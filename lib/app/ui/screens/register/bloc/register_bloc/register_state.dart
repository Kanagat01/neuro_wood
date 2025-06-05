part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.sending() = _Sending;
  const factory RegisterState.error({required String e}) = _Error;
  const factory RegisterState.sucess() = _Success;
}
