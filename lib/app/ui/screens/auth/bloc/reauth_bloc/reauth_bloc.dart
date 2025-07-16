import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/stream_ticker.dart';
import 'package:neuro_wood/app/domain/repositories/i_reauth_repository.dart';
import 'package:neuro_wood/core/services/firebase/firebase_auth/fas_state.dart';
import 'package:rxdart/rxdart.dart';

part 'reauth_event.dart';
part 'reauth_state.dart';
part 'reauth_bloc.freezed.dart';

class ReauthBloc extends Bloc<ReauthEvent, ReauthState> {
  final IReauthRepository reauthRepository;
  StreamSubscription<int>? _subscription;
  final BehaviorSubject<int?> _tickerSubject = BehaviorSubject<int?>();
  final StreamTicker _ticker = const StreamTicker();
  final TextEditingController codeController = TextEditingController();

  ReauthBloc({required this.reauthRepository})
    : super(const ReauthState.initial()) {
    on<ReauthEvent>((event, emit) async {
      switch (event) {
        case ReauthStarted():
          await _started(event, emit);
          break;

        case ReauthSendCode():
          await _sendCode(event, emit);
          break;

        case ReauthResendCode():
          await _resendCode(event, emit);
          break;
      }
    });
  }

  _started(ReauthStarted event, Emitter<ReauthState> emit) async {
    //
    // emit(const ReauthState.awaiting());
    final res = await reauthRepository.sendPhone();
    switch (res) {
      case FAPhoneVerificationCompleted():
        emit(const ReauthState.initial());
        _startTicker();
        break;
      case FAPhoneVerificationError(:final message):
        emit(
          ReauthState.error(
            message: message ?? "thereWasAnErrorTitle".tr(),
            ms: DateTime.now().millisecondsSinceEpoch,
          ),
        );
        break;
      default:
        break;
    }
  }

  _sendCode(ReauthSendCode event, Emitter<ReauthState> emit) async {
    String value = codeController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (value.isEmpty) {
      emit(const ReauthState.invalid());
      return;
    }
    emit(const ReauthState.sending());
    final res = await reauthRepository.sendCode(value);
    res.fold(
      (l) {
        log('_sendCode error: ${l.exception.code}');
        String message = l.exception.message ?? "thereWasAnErrorTitle".tr();
        message = _mapErrorCode(l.exception.code) ?? message;
        emit(
          ReauthState.error(
            message: message,
            ms: DateTime.now().millisecondsSinceEpoch,
          ),
        );
      },
      (r) {
        emit(const ReauthState.success());
      },
    );
    return;
  }

  bool _lockResend = false;
  _resendCode(ReauthResendCode event, Emitter<ReauthState> emit) async {
    if (_lockResend) {
      return;
    }
    _lockResend = true;
    final fasState = await reauthRepository.resendCode();
    _lockResend = false;
    switch (fasState) {
      case FASState.phoneVerificationError:
        (e, m) {
          String message = "unexpectedError".tr();
          message = _mapErrorCode(e) ?? message;
          emit(
            ReauthState.error(
              message: message,
              ms: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        };
      default:
        _startTicker();
    }
    // fasState.maybeWhen(
    //   phoneVerificationError: (e, m) {
    //     String message = "unexpectedError".tr();
    //     message = _mapErrorCode(e) ?? message;
    //     emit(
    //       ReauthState.error(
    //         message: message,
    //         ms: DateTime.now().millisecondsSinceEpoch,
    //       ),
    //     );
    //   },
    //   orElse: () {
    //     _startTicker();
    //   },
    // );
  }

  // TODO: вынести маппинг ошибок от cloud functions
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

  Stream<int?> get ticker => _tickerSubject.stream;
}
