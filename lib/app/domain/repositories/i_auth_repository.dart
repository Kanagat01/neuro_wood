import 'package:dartz/dartz.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_auth/fas_state.dart';

abstract class IAuthRepository {
  Future<FASState> sendPhone(String phone);
  Future<Either<FirebaseAuthFailure, bool>> sendCode(String code);
  Future<FASState> resendCode(String phone);
  Future<void> logout();
  void clear();
  Stream<FASState> get authStream;
}
