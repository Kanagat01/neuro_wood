part of 'reauth_bloc.dart';

@freezed
class ReauthState with _$ReauthState {
  const factory ReauthState.initial() = _Initial;
  const factory ReauthState.awaiting() = _Awaiting;
  const factory ReauthState.sending() = _Sending;
  const factory ReauthState.invalid() = _Invalid;
  const factory ReauthState.error({required String message, required int ms}) = _Error;
  const factory ReauthState.success() = _Success;
}
