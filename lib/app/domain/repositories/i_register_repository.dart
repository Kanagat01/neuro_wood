import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';
import 'package:neuro_wood/core/failure/failure.dart';

abstract class IRegisterRepository {
  Future<Either<FirestoreFailure, bool>> setUser(UserEntity user);

  Either<FirestoreFailure, User> getCurrentUser();
}
