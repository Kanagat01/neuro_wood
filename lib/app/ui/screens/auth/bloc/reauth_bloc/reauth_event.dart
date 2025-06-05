part of 'reauth_bloc.dart';

@freezed
class ReauthEvent with _$ReauthEvent {
  const factory ReauthEvent.started() = _Started;
  const factory ReauthEvent.sendCode() = _SendCode;
  const factory ReauthEvent.resendCode() = _ResendCode;
}