import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/domain/entities/measure_request.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/app/domain/entities/parameters_measure/parameters_wrapper.dart';
import 'package:neuro_wood/core/failure/failure.dart';

abstract class IParametersMeasureRepository {
  Future<Either<FirestoreFailure, ParametersWrapper>> getAllParameters();

  Future<Either<FirestoreFailure, bool>> setMeasureData(
      String measureId, MeasureRequest measureRequest);

  Stream<MeasureResultEntityBase?> getStreamMeasurements(String measureId);
}
