import 'dart:io';

abstract class IMeasureResultReportReportRepository {
  Future<String?> getMeasureReport(String measureId);

  Future<bool> saveMeasureReport({
    required String measureId,
    required File file,
  });
}
