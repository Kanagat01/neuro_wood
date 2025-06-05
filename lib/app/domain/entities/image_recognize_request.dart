import 'package:camera/camera.dart' show XFile;

import 'measure_type.dart';

class ImageRecognizeRequest {
  final XFile image;
  final String? baseUrl;
  final bool useDepth;
  final MeasureType type;

  ImageRecognizeRequest({
    required this.image,
    required this.type,
    this.baseUrl,
    this.useDepth = true,
  });

  Map<String, dynamic> toRequest(String uid) => {
        "user_id": uid,
        "use_depth": useDepth,
        "recognition_type": type.toSend(),
      };
}
