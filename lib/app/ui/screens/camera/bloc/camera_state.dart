part of 'camera_bloc.dart';

@freezed
class CameraState with _$CameraState {
  const factory CameraState.initialize() = _Initialize;
  const factory CameraState.empty() = _Empty;
  const factory CameraState.errorInit() = _ErrorInit;
  const factory CameraState.ready([Stream<InclineMeasure>? inclineStream]) = _Ready;
  const factory CameraState.hasImage(HasImageSubState substate) = _HasImage;
}

class HasImageSubState {
  final XFile image;

  HasImageSubState(this.image);
}

class Sending extends HasImageSubState {
  final Stream<int> sendingProgress;

  Sending({
    required XFile image,
    required this.sendingProgress,
  }) : super(image);
}

class ErrorSending extends HasImageSubState {
  ErrorSending({
    required XFile image,
  }) : super(image);
}

class ErrorResponse extends HasImageSubState {
  final ServerFailureCode code;
  ErrorResponse({
    required XFile image,
    required this.code,
  }) : super(image);
}

class Success extends HasImageSubState {
  final MeasureResponse result;
  Success({
    required XFile image,
    required this.result,
  }) : super(image);
}
