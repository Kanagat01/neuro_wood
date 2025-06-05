import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/data/model/user_additional_model.dart';
import 'package:neuro_wood/app/domain/entities/user_additional_entity.dart';
import 'package:neuro_wood/core/failure/failure.dart';

abstract class IUserAdditionalRepository {
  Either<Exception, UserAdditionalEntity> getAdditional();

  Future<Either<FirestoreFailure, bool>> setAdditional(UserAdditionalModel additional);
}
