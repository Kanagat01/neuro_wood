import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';

part 'fas_state.freezed.dart';

@freezed
class FASState with _$FASState {
  ///Начальное состояние авторизации
  const factory FASState.initial() = FAInitial;

  ///Не авторизован
  const factory FASState.unauthorized() = FAUnauthorized;

  ///Авторизован
  const factory FASState.authorized({required User user}) = FAAuthorized;

  ///Ошибка при отправке номера телефона
  const factory FASState.phoneVerificationError({required String code, String? message}) = FAPhoneVerificationError;

  ///Нормер телефона успешно отправлен
  const factory FASState.phoneVerificationCompleted({String? uid}) = FAPhoneVerificationCompleted;

  ///Выполнен вход
  // const factory FASState.signInSuccess() = _SignInSuccess;
  ///Ошибка при входе
  const factory FASState.signInError({required String code, String? message}) = FASignInError;
  //Выполнен вход, нужно пройти регистрацию
  const factory FASState.authorizedWithData(UserEntity user) = FAAuthorizedWithData;
}
