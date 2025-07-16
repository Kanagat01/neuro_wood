import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/domain/entities/user_additional_entity.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';
import 'package:neuro_wood/core/failure/failure.dart';

abstract class IUserRepository {
  Either<Exception, UserEntity> getUser();

  Future<Either<FirestoreFailure, bool>> updateUserAdditional(
    UserAdditionalEntity additional,
  );

  Future<Either<FirestoreFailure, bool>> updateUser(
    UserEntity userEntity,
  );

  Future<Either<FirestoreFailure, bool>> updateMeasurements(
    UserEntity userEntity,
  );

  Future<Either<FirebaseAuthFailure, bool>> deleteUser();
}
