part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.sendPhone() = _SendPhone;
  const factory AuthEvent.sendCode() = _SendCode;
  const factory AuthEvent.resendCode() = _ResendCode;
  const factory AuthEvent.back() = _Back;
  const factory AuthEvent.firebaseEvent(FASState state) = _FirebaseEvent;
  const factory AuthEvent.enableValidatePhone() = _EnableValidatePhone;
  const factory AuthEvent.changeEnableBtn(bool enableNextBtn) = _ChangeEnableBtn;
  const factory AuthEvent.logout() = _Logout;
}
