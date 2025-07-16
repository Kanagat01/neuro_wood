import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/data/model/user_additional_model.dart';
import 'package:neuro_wood/app/data/model/user_model.dart';
import 'package:neuro_wood/app/domain/entities/user_additional_entity.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_user_repository.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_data_source.dart';

class UserRepository implements IUserRepository {
  final FirebaseDataSource firebaseDataSource;

  UserRepository({
    required this.firebaseDataSource,
  });

  @override
  Either<Exception, UserEntity> getUser() {
    UserEntity? user = firebaseDataSource.user;
    if (user == null) {
      return Left(Exception());
    }
    return Right(user);
  }

  @override
  Future<Either<FirestoreFailure, bool>> updateUserAdditional(
    UserAdditionalEntity additional,
  ) {
    return firebaseDataSource.updateUserAdditional(
      UserAdditionalModel.fromEntity(additional),
    );
  }

  @override
  Future<Either<FirestoreFailure, bool>> updateUser(
    UserEntity userEntity,
  ) {
    return firebaseDataSource.updateUser(UserModel.fromEntity(userEntity));
  }

  @override
  Future<Either<FirestoreFailure, bool>> updateMeasurements(
    UserEntity userEntity,
  ) {
    return firebaseDataSource
        .updateUserMeasurements(UserModel.fromEntity(userEntity));
  }

  @override
  Future<Either<FirebaseAuthFailure, bool>> deleteUser() async {
    return firebaseDataSource.deleteUser();
    // return firebaseDataSource;
  }
}
