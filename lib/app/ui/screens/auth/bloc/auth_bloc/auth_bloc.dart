import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/stream_ticker.dart';
import 'package:neuro_wood/app/domain/repositories/i_auth_repository.dart';
import 'package:neuro_wood/core/services/analytics/i_analytics.dart';
import 'package:neuro_wood/core/services/firebase/firebase_auth/fas_state.dart';
import 'package:rxdart/subjects.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TextEditingController phoneController = MaskedTextController(
    mask: '000 000 00 00',
  );
  final TextEditingController codeController = TextEditingController();
  final FocusNode focusNodePhone = FocusNode();
  final IAuthRepository authRepository;
  final IAnalytics analytics;
  bool checkKeyboard = false;
  String _oldPhone = '';
  final StreamTicker _ticker = const StreamTicker();
  StreamSubscription<bool>? _keyboardVisibilitySubs;
  StreamSubscription<int>? _subscription;
  final BehaviorSubject<int?> _tickerSubject = BehaviorSubject<int?>();
  AuthBloc({required this.authRepository, required this.analytics})
    : super(const AuthInitialState()) {
    on<AuthEvent>((event, emit) async {
      switch (event) {
        case AuthSendPhone():
          await _sendPhone(event, emit);
          break;
        case AuthSendCode():
          await _sendCode(event, emit);
          break;
        case AuthResendCode():
          await _resendCode(event, emit);
          break;
        case AuthBack():
          await _back(event, emit);
          break;
        case AuthFirebaseEvent():
          await _fbEvent(event, emit);
          break;
        case AuthEnableValidatePhone():
          await _enableValidatePhone(event, emit);
          break;
        case AuthChangeEnableBtn():
          await _changeEnableBtn(event, emit);
          break;
        case AuthLogout():
          await _logout(event, emit);
          break;
      }
    });
    authRepository.authStream.listen(_fbListener);
    _keyboardVisibilitySubs = KeyboardVisibilityController().onChange.listen((
      event,
    ) {
      if (!checkKeyboard && event) {
        checkKeyboard = true;
      }
      if (checkKeyboard && !event) {
        add(const AuthEvent.enableValidatePhone());
        _keyboardVisibilitySubs?.cancel();
      }
    });
    phoneController.addListener(() {
      if (state is AuthInputPhone) {
        String value = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
        if (value.length != 10 && (state as AuthInputPhone).enableNextBtn) {
          add(const AuthEvent.changeEnableBtn(false));
        } else if (value.length == 10 &&
            !(state as AuthInputPhone).enableNextBtn) {
          add(const AuthEvent.changeEnableBtn(true));
        }
      }
    });
  }

  _changeEnableBtn(AuthChangeEnableBtn event, Emitter<AuthState> emit) {
    emit(
      (state as AuthInputPhone).copyWith(enableNextBtn: event.enableNextBtn),
    );
  }

  _enableValidatePhone(AuthEnableValidatePhone event, Emitter<AuthState> emit) {
    if (state is AuthInputPhone) {
      emit((state as AuthInputPhone).copyWith(validateForm: true));
    }
  }

  _logout(AuthLogout event, Emitter<AuthState> emit) {
    _clear();
    // emit(const AuthState.initial());
    emit(
      const AuthState.inputPhone(
        substate: AuthSubstate.initial(),
        validateForm: false,
        enableNextBtn: false,
      ),
    );
  }

  _fbListener(FASState event) {
    add(AuthEvent.firebaseEvent(event));
  }

  _sendPhone(AuthSendPhone event, Emitter<AuthState> emit) async {
    String value = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (value.length != 10) {
      emit(
        const AuthState.inputPhone(
          substate: AuthSubstate.invalid(),
          validateForm: true,
          enableNextBtn: true,
        ),
      );
      return;
    }
    value = '+7$value';
    if (value != _oldPhone) {
      _oldPhone = value;
      emit(
        const AuthState.inputPhone(
          substate: AuthSubstate.sending(),
          validateForm: true,
          enableNextBtn: true,
        ),
      );
      final res = await authRepository.sendPhone(value);
      switch (res) {
        case FAPhoneVerificationCompleted():
          codeController.clear();
          _startTicker();
          emit(const AuthState.inputCode(AuthSubInitial()));
          break;
        case FAPhoneVerificationError(:final message):
          emit(
            AuthState.inputPhone(
              substate: AuthSubstate.error(
                message: message ?? "thereWasAnErrorTitle".tr(),
                ms: DateTime.now().millisecondsSinceEpoch,
              ),
              validateForm: (state as AuthInputPhone).validateForm,
              enableNextBtn: (state as AuthInputPhone).enableNextBtn,
            ),
          );
          break;
        default:
          break;
      }
    } else {
      emit(const AuthInputCode(AuthSubInitial()));
    }
    return;
  }

  _sendCode(AuthSendCode event, Emitter<AuthState> emit) async {
    String value = codeController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (value.isEmpty) {
      emit(const AuthInputCode(AuthSubInvalid()));
      return;
    }
    emit(const AuthInputCode(AuthSubSending()));
    final res = await authRepository.sendCode(value);
    res.fold(
      (l) {
        log('_sendCode error: ${l.exception.code}');
        String message = l.exception.message ?? "thereWasAnErrorTitle".tr();
        message = _mapErrorCode(l.exception.code) ?? message;
        emit(
          AuthState.inputCode(
            AuthSubstate.error(
              message: message,
              ms: DateTime.now().millisecondsSinceEpoch,
            ),
          ),
        );
      },
      (r) {
        return null;
      },
    );
    return;
  }

  String? _mapErrorCode(String code) {
    String? message;
    if (code == 'invalid-verification-code') {
      message = "incorrectSmsCode".tr();
    } else if (code == 'missing-verification-code') {
      message = "incorrectSmsCode".tr();
    } else if (code == 'session-expired') {
      message = "expiredSmsCode".tr();
    } else if (code == 'unexpected-error') {
      message = "unexpectedError".tr();
    } else if (code == 'blocked-1-h') {
      message = "blocked1hSms".tr();
    } else if (code == 'blocked-24-h') {
      message = "blocked24hSms".tr();
    }
    return message;
  }

  _startTicker() {
    _subscription?.cancel();
    _tickerSubject.sink.add(60);
    _subscription = _ticker
        .tickDec(ticks: 60)
        .asBroadcastStream()
        .listen(
          (int v) => _tickerSubject.sink.add(v),
          onDone: () => _tickerSubject.sink.add(null),
        );
  }

  bool _lockResend = false;

  _resendCode(AuthResendCode event, Emitter<AuthState> emit) async {
    if (_lockResend) {
      return;
    }
    _lockResend = true;
    String value = _oldPhone;
    //phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
    final fasState = await authRepository.resendCode(value);
    _lockResend = false;
    switch (fasState) {
      case FAPhoneVerificationError(:final code):
        String errorMessage = "unexpectedError".tr();
        errorMessage = _mapErrorCode(code) ?? errorMessage;
        emit(
          AuthState.inputCode(
            AuthSubstate.error(
              message: errorMessage,
              ms: DateTime.now().millisecondsSinceEpoch,
            ),
          ),
        );
        break;
      default:
        _startTicker();
        break;
    }
  }

  _back(AuthBack event, Emitter<AuthState> emit) {
    emit(
      const AuthState.inputPhone(
        substate: AuthSubstate.initial(),
        validateForm: true,
        enableNextBtn: true,
      ),
    );
  }

  _fbEvent(AuthFirebaseEvent event, Emitter<AuthState> emit) {
    switch (event.state) {
      case FAUnauthorized():
        emit(
          const AuthState.inputPhone(
            substate: AuthSubstate.initial(),
            validateForm: false,
            enableNextBtn: false,
          ),
        );
        break;
      default:
        break;
    }
    switch (state) {
      case AuthInitialState():
        switch (event.state) {
          case FAUnauthorized():
            emit(
              const AuthState.inputPhone(
                substate: AuthSubstate.initial(),
                validateForm: false,
                enableNextBtn: false,
              ),
            );
            break;
          case FAAuthorized():
            emit(const AuthState.successAuth());
            break;
          case FAAuthorizedWithData(:final user):
            analytics.setUserProfile(user.uid);
            emit(const AuthState.successRegister());
            break;
          default:
            break;
        }
        break;
      case AuthInputPhone():
        switch (event.state) {
          // phoneVerificationCompleted: () {
          //   codeController.clear();
          //   _startTicker();
          //   emit(const AuthState.inputCode(_Initial()));
          // },
          // phoneVerificationError: (code, e) {
          //   emit(
          //     AuthState.inputPhone(
          //       substate: AuthSubstate.error(message: e ?? 'Возникла ошибка'),
          //       validateForm: isValidate,
          //       enableNextBtn: enableNextBtn,
          //     ),
          //   );
          // },
          default:
            break;
        }
        break;
      case AuthInputCode():
        switch (event.state) {
          case FAAuthorized():
            emit(const AuthState.successAuth());
            _clear();
            break;
          case FASignInError(:final code, :final message):
            log('phoneVerificationError: $code, $message');
            emit(
              AuthState.inputCode(
                AuthSubstate.error(
                  message: message ?? "thereWasAnErrorTitle".tr(),
                  ms: DateTime.now().millisecondsSinceEpoch,
                ),
              ),
            );
            break;
          case FAAuthorizedWithData():
            emit(const AuthState.successRegister());
            _clear();
            break;
          default:
            break;
        }
        break;
      default:
        break;
    }
  }

  _clear() {
    authRepository.clear();
    checkKeyboard = false;
    _oldPhone = '';
    phoneController.clear();
    codeController.clear();
  }

  Stream<int?> get ticker => _tickerSubject.stream;
}
