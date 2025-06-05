import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController phoneController =
      MaskedTextController(mask: '000 000 00 00');
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
      : super(const _InitialState()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        sendPhone: (e) => _sendPhone(e, emit),
        sendCode: (e) => _sendCode(e, emit),
        resendCode: (e) => _resendCode(e, emit),
        back: (e) => _back(e, emit),
        firebaseEvent: (e) => _fbEvent(e, emit),
        enableValidatePhone: (e) => _enableValidatePhone(e, emit),
        changeEnableBtn: (e) => _changeEnableBtn(e, emit),
        logout: (e) => _logout(e, emit),
      );
    });
    authRepository.authStream.listen(_fbListener);
    _keyboardVisibilitySubs =
        KeyboardVisibilityController().onChange.listen((event) {
      if (!checkKeyboard && event) {
        checkKeyboard = true;
      }
      if (checkKeyboard && !event) {
        add(const AuthEvent.enableValidatePhone());
        _keyboardVisibilitySubs?.cancel();
      }
    });
    phoneController.addListener(() {
      if (state is _InputPhone) {
        String value = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
        if (value.length != 10 && (state as _InputPhone).enableNextBtn) {
          add(const AuthEvent.changeEnableBtn(false));
        } else if (value.length == 10 &&
            !(state as _InputPhone).enableNextBtn) {
          add(const AuthEvent.changeEnableBtn(true));
        }
      }
    });
  }

  _changeEnableBtn(_ChangeEnableBtn event, Emitter<AuthState> emit) {
    emit((state as _InputPhone).copyWith(enableNextBtn: event.enableNextBtn));
  }

  @override
  Future<void> close() {
    return super.close();
  }

  _enableValidatePhone(_EnableValidatePhone event, Emitter<AuthState> emit) {
    if (state is _InputPhone) {
      emit((state as _InputPhone).copyWith(validateForm: true));
    }
  }

  _logout(_Logout event, Emitter<AuthState> emit) {
    _clear();
    // emit(const AuthState.initial());
    emit(const AuthState.inputPhone(
      substate: AuthSubstate.initial(),
      validateForm: false,
      enableNextBtn: false,
    ));
  }

  _fbListener(FASState event) {
    add(AuthEvent.firebaseEvent(event));
  }

  _sendPhone(_SendPhone event, Emitter<AuthState> emit) async {
    String value = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (value.length != 10) {
      emit(const AuthState.inputPhone(
        substate: AuthSubstate.invalid(),
        validateForm: true,
        enableNextBtn: true,
      ));
      return;
    }
    value = '+7' + value;
    if (value != _oldPhone) {
      _oldPhone = value;
      emit(const AuthState.inputPhone(
        substate: AuthSubstate.sending(),
        validateForm: true,
        enableNextBtn: true,
      ));
      final res = await authRepository.sendPhone(value);
      res.maybeWhen(
          phoneVerificationCompleted: (_) {
            codeController.clear();
            _startTicker();
            emit(const AuthState.inputCode(_Initial()));
          },
          phoneVerificationError: (code, e) {
            emit(
              AuthState.inputPhone(
                substate: AuthSubstate.error(
                    message: e ?? "thereWasAnErrorTitle".tr(),
                    ms: DateTime.now().millisecondsSinceEpoch),
                validateForm: (state as _InputPhone).validateForm,
                enableNextBtn: (state as _InputPhone).enableNextBtn,
              ),
            );
          },
          orElse: () {});
    } else {
      emit(const _InputCode(_Initial()));
    }
    return;
  }

  _sendCode(_SendCode event, Emitter<AuthState> emit) async {
    String value = codeController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (value.isEmpty) {
      emit(const _InputCode(_Invalid()));
      return;
    }
    emit(const _InputCode(_Sending()));
    final res = await authRepository.sendCode(value);
    res.fold(
      (l) {
        log('_sendCode error: ${l.exception.code}');
        String message = l.exception.message ?? "thereWasAnErrorTitle".tr();
        message = _mapErrorCode(l.exception.code) ?? message;
        emit(AuthState.inputCode(AuthSubstate.error(
            message: message, ms: DateTime.now().millisecondsSinceEpoch)));
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
    _subscription = _ticker.tickDec(ticks: 60).asBroadcastStream().listen(
          (int v) => _tickerSubject.sink.add(v),
          onDone: () => _tickerSubject.sink.add(null),
        );
  }

  bool _lockResend = false;

  _resendCode(_ResendCode event, Emitter<AuthState> emit) async {
    if (_lockResend) {
      return;
    }
    _lockResend = true;
    String value = _oldPhone;
    //phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
    final fasState = await authRepository.resendCode(value);
    _lockResend = false;
    fasState.maybeWhen(
      phoneVerificationError: (e, m) {
        String message = "unexpectedError".tr();
        message = _mapErrorCode(e) ?? message;
        emit(AuthState.inputCode(AuthSubstate.error(
          message: message,
          ms: DateTime.now().millisecondsSinceEpoch,
        )));
      },
      orElse: () {
        _startTicker();
      },
    );
  }

  _back(_Back event, Emitter<AuthState> emit) {
    emit(const AuthState.inputPhone(
      substate: AuthSubstate.initial(),
      validateForm: true,
      enableNextBtn: true,
    ));
  }

  _fbEvent(_FirebaseEvent event, Emitter<AuthState> emit) {
    event.state.maybeWhen(
      unauthorized: () {
        emit(const AuthState.inputPhone(
          substate: AuthSubstate.initial(),
          validateForm: false,
          enableNextBtn: false,
        ));
      },
      orElse: () {},
    );
    state.maybeWhen(
      initial: () {
        event.state.maybeWhen(
          unauthorized: () => emit(
            const AuthState.inputPhone(
              substate: AuthSubstate.initial(),
              validateForm: false,
              enableNextBtn: false,
            ),
          ),
          authorized: (_) => emit(const AuthState.successAuth()),
          authorizedWithData: (user) {
            analytics.setUserProfile(user.uid);
            emit(const AuthState.successRegister());
          },
          orElse: () {},
        );
      },
      inputPhone: (substate, isValidate, enableNextBtn) {
        event.state.maybeWhen(
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
          orElse: () {},
        );
      },
      inputCode: (substate) {
        event.state.maybeWhen(
          authorized: (_) {
            emit(const AuthState.successAuth());
            _clear();
          },
          signInError: (code, e) {
            log('phoneVerificationError: $code, $e');
            emit(AuthState.inputCode(AuthSubstate.error(
                message: e ?? "thereWasAnErrorTitle".tr(),
                ms: DateTime.now().millisecondsSinceEpoch)));
          },
          authorizedWithData: (_) {
            emit(const AuthState.successRegister());
            _clear();
          },
          orElse: () {},
        );
      },
      orElse: () {},
    );
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
