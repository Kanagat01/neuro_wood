import 'package:neuro_wood/app/domain/entities/image_recognize_result.dart';

class ImageRecognizeResultModel extends ImageRecognizeResult {
  ImageRecognizeResultModel({
    required String measureId,
  }) : super(
          measureId: measureId,
        );

  factory ImageRecognizeResultModel.fromMap(Map<String, dynamic> map) => ImageRecognizeResultModel(measureId: map['measure_id']);
}
