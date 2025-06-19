part of 'camera_controller_bloc.dart';

@freezed
class CameraControllerState with _$CameraControllerState {
  const factory CameraControllerState.initial() = CameraControllerInitial;
  const factory CameraControllerState.preparation() =
      CameraControllerPreparation;
  const factory CameraControllerState.ready() = CameraControllerReady;
  const factory CameraControllerState.error(CameraErrorType error) =
      CameraControllerError;
  const factory CameraControllerState.takedPhoto(XFile photo) =
      CameraControllerTakedPhoto;
}

enum CameraErrorType { permission, undefined }
