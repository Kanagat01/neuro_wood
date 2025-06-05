part of 'camera_controller_bloc.dart';

@freezed
class CameraControllerState with _$CameraControllerState {
  const factory CameraControllerState.initial() = _Initial;
  const factory CameraControllerState.preparation() = _Preparation;
  const factory CameraControllerState.ready() = _Ready;
  const factory CameraControllerState.error(CameraErrorType error) = _Error;
  const factory CameraControllerState.takedPhoto(XFile photo) = _TakedPhoto;
}

enum CameraErrorType {
  permission,
  undefined
}
