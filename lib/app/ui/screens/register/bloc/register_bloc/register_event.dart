part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.send() = _Send;
  const factory RegisterEvent.changeAgree() = _ChangeAgree;
}
