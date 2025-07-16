import 'dart:io';

import 'package:neuro_wood/app/domain/repositories/i_measure_result_report_repository.dart';
import 'package:neuro_wood/core/services/firebase/firebase_data_source.dart';

class MeasureResultReportReportRepository implements IMeasureResultReportReportRepository {
  MeasureResultReportReportRepository({required this.firebaseDataSource});
  final FirebaseDataSource firebaseDataSource;

  @override
  Future<String?> getMeasureReport(String measureId) {
    return firebaseDataSource.getMeasureReport(measureId);
  }

  @override
  Future<bool> saveMeasureReport({
    required String measureId,
    required File file,
  }) {
    return firebaseDataSource.saveMeasureReport(
      measureId: measureId,
      file: file,
    );
  }
}
