import 'dart:async';

import 'package:camera/camera.dart' show XFile;

import 'image_recognize_request.dart';
import 'measure_type.dart';

class ImageRecognizeRequestBuilder {
  XFile? image;
  String? baseUrl;
  MeasureType? type;

  Future<ImageRecognizeRequest> build() async {
    if (_checkNull()) {
      throw Exception();
    }

    return Future.value(ImageRecognizeRequest(
      image: image!,
      type: type!,
    ));
  }

  bool _checkNull() {
    return image == null || type == null;
  }
}
