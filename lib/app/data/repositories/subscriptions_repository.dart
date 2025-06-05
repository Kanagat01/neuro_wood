import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/domain/entities/tariff_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_subscriptions_repository.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_data_source.dart';

class SubscriptionsRepository implements ISubscriptionsRepository {
  final FirebaseDataSource firebaseDataSource;

  SubscriptionsRepository({
    required this.firebaseDataSource,
  });

  @override
  Future<Either<FirestoreFailure, List<TariffEntity>>> getSubscriptions() {
    return firebaseDataSource.getSubscriptions();
  }
}
