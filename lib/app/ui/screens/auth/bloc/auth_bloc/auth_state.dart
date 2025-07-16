part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitialState;
  const factory AuthState.inputPhone({
    required AuthSubstate substate,
    required bool validateForm,
    required bool enableNextBtn,
  }) = AuthInputPhone;
  const factory AuthState.inputCode(AuthSubstate substate) = AuthInputCode;
  const factory AuthState.successAuth() = SuccessAuth;
  const factory AuthState.successRegister() = SuccessRegister;
}

@freezed
abstract class AuthSubstate with _$AuthSubstate {
  const factory AuthSubstate.initial() = AuthSubInitial;
  const factory AuthSubstate.invalid() = AuthSubInvalid;
  const factory AuthSubstate.sending() = AuthSubSending;
  const factory AuthSubstate.error({required String message, required int ms}) =
      AuthSubError;
}
