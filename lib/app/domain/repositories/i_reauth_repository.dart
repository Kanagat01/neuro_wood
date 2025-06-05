import 'package:dartz/dartz.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_auth/fas_state.dart';

abstract class IReauthRepository {
  Future<FASState> resendCode();
  Future<Either<FirebaseAuthFailure, bool>> sendCode(String code);
  Future<FASState> sendPhone();
}
