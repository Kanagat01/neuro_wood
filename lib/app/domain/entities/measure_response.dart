import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';

class MeasureResponse {
  final String measureId;
  final String licensePlateText;
  final Stream<MeasureResultEntityBase?> measureStream;

  MeasureResponse({
    required this.measureId,
    required this.measureStream,
    required this.licensePlateText,
  });
}
