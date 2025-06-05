import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/domain/entities/measure_request.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';

import 'package:neuro_wood/app/domain/entities/parameters_measure/parameters_wrapper.dart';

import 'package:neuro_wood/app/domain/repositories/i_parameters_measure_repository.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_data_source.dart';

class ParametersMeasureRepository implements IParametersMeasureRepository {
  final FirebaseDataSource firebaseDataSource;
  ParametersMeasureRepository({
    required this.firebaseDataSource,
  });

  @override
  Future<Either<FirestoreFailure, ParametersWrapper>> getAllParameters() async {
    return await firebaseDataSource.getAllParameters();
  }

  @override
  Future<Either<FirestoreFailure, bool>> setMeasureData(
      String measureId, MeasureRequest measureRequest) {
    return firebaseDataSource.setMeasureData(measureId, measureRequest);
  }

  @override
  Stream<MeasureResultEntityBase?> getStreamMeasurements(String measureId) {
    return firebaseDataSource.subscribeOnMeasure(measureId);
  }
}
