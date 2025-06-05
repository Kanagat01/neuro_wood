import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neuro_wood/app/data/model/user_model.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_register_repository.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_data_source.dart';

class RegisterRepository implements IRegisterRepository {
  final FirebaseDataSource firebaseDataSource;

  RegisterRepository({
    required this.firebaseDataSource,
  });

  @override
  Future<Either<FirestoreFailure, bool>> setUser(UserEntity user) async {
    return await firebaseDataSource.setUser(UserModel.fromEntity(user)).timeout(
        const Duration(seconds: 30),
        onTimeout: () => firebaseDataSource.hasUser());
  }

  @override
  Either<FirestoreFailure, User> getCurrentUser() {
    User? user = firebaseDataSource.currentUser;
    if (user != null) {
      return Right(user);
    }
    return Left(FirestoreFailure());
  }
}
