part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.sendPhone() = AuthSendPhone;
  const factory AuthEvent.sendCode() = AuthSendCode;
  const factory AuthEvent.resendCode() = AuthResendCode;
  const factory AuthEvent.back() = AuthBack;
  const factory AuthEvent.firebaseEvent(FASState state) = AuthFirebaseEvent;
  const factory AuthEvent.enableValidatePhone() = AuthEnableValidatePhone;
  const factory AuthEvent.changeEnableBtn(bool enableNextBtn) =
      AuthChangeEnableBtn;
  const factory AuthEvent.logout() = AuthLogout;
}
