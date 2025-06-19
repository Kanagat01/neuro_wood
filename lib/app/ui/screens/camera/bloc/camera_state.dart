part of 'camera_bloc.dart';

@freezed
class CameraState with _$CameraState {
  const factory CameraState.initialize() = InitializeCamera;
  const factory CameraState.empty() = EmptyCamera;
  const factory CameraState.errorInit() = CameraErrorInit;
  const factory CameraState.ready([Stream<InclineMeasure>? inclineStream]) =
      CameraReady;
  const factory CameraState.hasImage(HasImageSubState substate) =
      CameraHasImage;
}

class HasImageSubState {
  final XFile image;

  HasImageSubState(this.image);
}

class Sending extends HasImageSubState {
  final Stream<int> sendingProgress;

  Sending({required XFile image, required this.sendingProgress}) : super(image);
}

class ErrorSending extends HasImageSubState {
  ErrorSending({required XFile image}) : super(image);
}

class ErrorResponse extends HasImageSubState {
  final ServerFailureCode code;
  ErrorResponse({required XFile image, required this.code}) : super(image);
}

class Success extends HasImageSubState {
  final MeasureResponse result;
  Success({required XFile image, required this.result}) : super(image);
}
