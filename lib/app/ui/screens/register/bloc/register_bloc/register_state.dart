part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitial;
  const factory RegisterState.sending() = RegisterSending;
  const factory RegisterState.error({required String e}) = RegisterError;
  const factory RegisterState.sucess() = RegisterSuccess;
}
