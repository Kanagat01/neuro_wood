import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/data/model/user_additional_model.dart';
import 'package:neuro_wood/app/domain/entities/user_additional_entity.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_user_additional_repository.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_data_source.dart';

class UserAdditionalRepository implements IUserAdditionalRepository {
  final FirebaseDataSource firebaseDataSource;

  UserAdditionalRepository({
    required this.firebaseDataSource,
  });

  @override
  Either<Exception, UserAdditionalEntity> getAdditional() {
    UserEntity? user = firebaseDataSource.user;
    if (user != null) {
      return right(user.additional);
    }
    return left(Exception());
  }

  @override
  Future<Either<FirestoreFailure, bool>> setAdditional(UserAdditionalEntity additional) {
    return firebaseDataSource.updateUserAdditional(UserAdditionalModel.fromEntity(additional));
  }
}
