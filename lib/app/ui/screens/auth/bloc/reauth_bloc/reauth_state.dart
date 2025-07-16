part of 'reauth_bloc.dart';

@freezed
class ReauthState with _$ReauthState {
  const factory ReauthState.initial() = ReauthInitial;
  const factory ReauthState.awaiting() = ReauthAwaiting;
  const factory ReauthState.sending() = ReauthSending;
  const factory ReauthState.invalid() = ReauthInvalid;
  const factory ReauthState.error({required String message, required int ms}) =
      ReauthError;
  const factory ReauthState.success() = ReauthSuccess;
}
