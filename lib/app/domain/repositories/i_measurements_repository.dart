import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/core/failure/failure.dart';

abstract class IMeasurementsRepository {
  Future<Either<FirestoreFailure, List<MeasureResultEntityBase>>> getAllMeasurements();
  Stream<List<MeasureResultEntityBase>?> getStreamMeasurements();
  Future<String?> getMeasureImage(String measureId);
}
