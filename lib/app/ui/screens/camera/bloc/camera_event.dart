part of 'camera_bloc.dart';

@freezed
class CameraEvent with _$CameraEvent {
  const factory CameraEvent.initCamera(MeasureType type) = _InitCamera;
  const factory CameraEvent.takePhoto() = _TakePhoto;
  const factory CameraEvent.pickImage() = _PickImage;
  const factory CameraEvent.changeAllowTakePhoto([
    Stream<InclineMeasure>? stream,
  ]) = _ChangeAllowTakePhoto;
  const factory CameraEvent.send() = _Send;
  const factory CameraEvent.onViewFinderTap(Offset offset) = _OnViewFinderTap;
  const factory CameraEvent.cameraControllerEvent(
    CameraControllerState ccState,
  ) = _CameraControllerEvent;
  const factory CameraEvent.interrupt() = _Interrupt;
  const factory CameraEvent.onSettingsTap() = _OnSettingsTap;
  const factory CameraEvent.dispose() = _Dispose;
}
