part of 'camera_bloc.dart';

@freezed
class CameraEvent with _$CameraEvent {
  const factory CameraEvent.initCamera(MeasureType type) = InitCamera;
  const factory CameraEvent.takePhoto() = TakePhoto;
  const factory CameraEvent.pickImage() = PickImage;
  const factory CameraEvent.changeAllowTakePhoto([
    Stream<InclineMeasure>? stream,
  ]) = ChangeAllowTakePhoto;
  const factory CameraEvent.send() = CameraSend;
  const factory CameraEvent.onViewFinderTap(Offset offset) =
      CameraOnViewFinderTap;
  const factory CameraEvent.cameraControllerEvent(
    CameraControllerState ccState,
  ) = CameraEventController;
  const factory CameraEvent.interrupt() = InterruptCamera;
  const factory CameraEvent.onSettingsTap() = CameraOnSettingsTap;
  const factory CameraEvent.dispose() = DisposeCamera;
}
