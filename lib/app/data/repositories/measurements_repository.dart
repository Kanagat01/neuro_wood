import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_measurements_repository.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_data_source.dart';

class MeasurementsRepository implements IMeasurementsRepository {
  MeasurementsRepository({required this.firebaseDataSource});

  final FirebaseDataSource firebaseDataSource;

  @override
  Future<Either<FirestoreFailure, List<MeasureResultEntityBase>>> getAllMeasurements() async {
    return await firebaseDataSource.getMeasures();
  }

  @override
  Stream<List<MeasureResultEntityBase>?> getStreamMeasurements() {
    return firebaseDataSource.getStreamMesures();
  }

  @override
  Future<String?> getMeasureImage(String measureId) async{
    return await firebaseDataSource.getMeasureImage(measureId);
  }
}
