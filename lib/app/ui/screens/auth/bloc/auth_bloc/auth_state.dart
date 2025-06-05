part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _InitialState;
  const factory AuthState.inputPhone({
    required AuthSubstate substate,
    required bool validateForm,
    required bool enableNextBtn,
  }) = _InputPhone;
  const factory AuthState.inputCode(AuthSubstate substate) = _InputCode;
  const factory AuthState.successAuth() = _SuccessAuth;
  const factory AuthState.successRegister() = _SuccessRegister;
}

@freezed
class AuthSubstate with _$AuthSubstate {
  const factory AuthSubstate.initial() = _Initial;
  const factory AuthSubstate.invalid() = _Invalid;
  const factory AuthSubstate.sending() = _Sending;
  const factory AuthSubstate.error({required String message, required int ms}) = _Error;
}
