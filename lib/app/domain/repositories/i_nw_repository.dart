import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/domain/entities/image_recognize_request.dart';
import 'package:neuro_wood/app/domain/entities/measure_response.dart';
import 'package:neuro_wood/core/failure/failure.dart';

abstract class INWRepository {
  Future<Either<ServerFailure, MeasureResponse>> processImage(ImageRecognizeRequest request);
}
