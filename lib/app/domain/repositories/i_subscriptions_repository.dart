import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/domain/entities/tariff_entity.dart';
import 'package:neuro_wood/core/failure/failure.dart';

abstract class ISubscriptionsRepository {
  Future<Either<FirestoreFailure, List<TariffEntity>>> getSubscriptions();
}
