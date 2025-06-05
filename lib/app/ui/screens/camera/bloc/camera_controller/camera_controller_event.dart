part of 'camera_controller_bloc.dart';

@freezed
class CameraControllerEvent with _$CameraControllerEvent {
  const factory CameraControllerEvent.started() = _Started;
  const factory CameraControllerEvent.init() = _Init;
  const factory CameraControllerEvent.reinit() = _Reinit;
  const factory CameraControllerEvent.takePhoto() = _TakePhoto;
  const factory CameraControllerEvent.playPauseToggle() = _TogglePause;
  const factory CameraControllerEvent.disposeCamera() = _DisposeCamera;
  const factory CameraControllerEvent.onViewFinderTap(Offset offset) = _OnViewFinderTap;
}