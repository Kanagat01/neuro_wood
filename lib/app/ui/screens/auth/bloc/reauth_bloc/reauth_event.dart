part of 'reauth_bloc.dart';

@freezed
class ReauthEvent with _$ReauthEvent {
  const factory ReauthEvent.started() = ReauthStarted;
  const factory ReauthEvent.sendCode() = ReauthSendCode;
  const factory ReauthEvent.resendCode() = ReauthResendCode;
}
