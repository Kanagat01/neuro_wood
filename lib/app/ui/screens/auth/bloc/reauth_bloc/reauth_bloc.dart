import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/stream_ticker.dart';
import 'package:neuro_wood/app/domain/repositories/i_reauth_repository.dart';
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

  ReauthBloc({
    required this.reauthRepository,
  }) : super(const ReauthState.initial()) {
    on<ReauthEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        sendCode: (event) => _sendCode(event, emit),
        resendCode: (event) => _resendCode(event, emit),
      );
    });
  }

  _started(_Started event, Emitter<ReauthState> emit) async {
    //
    // emit(const ReauthState.awaiting());
    final res = await reauthRepository.sendPhone();

    res.maybeWhen(
        phoneVerificationCompleted: (_) {
          emit(const ReauthState.initial());
          _startTicker();
        },
        phoneVerificationError: (code, e) {
          emit(ReauthState.error(message: e ?? "thereWasAnErrorTitle".tr(), ms: DateTime.now().millisecondsSinceEpoch));
        },
        orElse: () {});
  }

  _sendCode(_SendCode event, Emitter<ReauthState> emit) async {
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
        emit(ReauthState.error(
          message: message,
          ms: DateTime.now().millisecondsSinceEpoch,
        ));
      },
      (r) {
        emit(const ReauthState.success());
      },
    );
    return;
  }

  bool _lockResend = false;
  _resendCode(_ResendCode event, Emitter<ReauthState> emit) async {
    if (_lockResend) {
      return;
    }
    _lockResend = true;
    final fasState = await reauthRepository.resendCode();
    _lockResend = false;
    fasState.maybeWhen(
      phoneVerificationError: (e, m) {
        String message = "unexpectedError".tr();
        message = _mapErrorCode(e) ?? message;
        emit(ReauthState.error(
          message: message,
          ms: DateTime.now().millisecondsSinceEpoch,
        ));
      },
      orElse: () {
        _startTicker();
      },
    );
  }

  //TODO: вынести маппинг ошибок от cloud functions
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

  Stream<int?> get ticker => _tickerSubject.stream;
}
