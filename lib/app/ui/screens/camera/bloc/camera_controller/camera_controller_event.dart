part of 'camera_controller_bloc.dart';

@freezed
class CameraControllerEvent with _$CameraControllerEvent {
  const factory CameraControllerEvent.started() = CameraControllerStarted;
  const factory CameraControllerEvent.init() = CameraControllerInit;
  const factory CameraControllerEvent.reinit() = CameraControllerReinit;
  const factory CameraControllerEvent.takePhoto() = CameraControllerTakePhoto;
  const factory CameraControllerEvent.playPauseToggle() =
      CameraControllerTogglePause;
  const factory CameraControllerEvent.disposeCamera() =
      CameraControllerDisposeCamera;
  const factory CameraControllerEvent.onViewFinderTap(Offset offset) =
      CameraControllerOnViewFinderTap;
}
