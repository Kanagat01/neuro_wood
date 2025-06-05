import 'dart:developer';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:camera/camera.dart';
import 'package:gallery_saver/gallery_saver.dart';

part 'camera_controller_event.dart';
part 'camera_controller_state.dart';
part 'camera_controller_bloc.freezed.dart';

class CameraControllerBloc extends Bloc<CameraControllerEvent, CameraControllerState> {
  CameraController? _camController;
  CameraController? get camController => _camController;
  bool _openedSettings = false;

  CameraControllerBloc() : super(const _Initial()) {
    on<CameraControllerEvent>((event, emit) async {
      await event.map(
        started: (e) => _started(e, emit),
        init: (e) => _init(e, emit),
        reinit: (e) => _reinit(e, emit),
        takePhoto: (e) => _takePhoto(e, emit),
        playPauseToggle: (e) => _playPauseToggle(e, emit),
        disposeCamera: (e) => _disposeCamera(e, emit),
        onViewFinderTap: (e) => _onViewFinderTap(e, emit),
      );
    });
  }

  _started(_Started event, Emitter<CameraControllerState> emit) {}

  _reinit(_Reinit event, Emitter<CameraControllerState> emit) async {
    if ((_camController != null && (_camController?.value.isInitialized ?? false))) {
      try {
        bool _ = await onNewCameraSelected(_camController!.description);
        emit(const CameraControllerState.ready());
      } on CameraException catch (e) {
        CameraErrorType typeError;
        if (e.code == 'cameraPermission') {
          typeError = CameraErrorType.permission;
        } else {
          typeError = CameraErrorType.undefined;
        }
        emit(CameraControllerState.error(typeError));
      }
    } else if (_openedSettings) {
      _openedSettings = false;
      return emit.forEach(_initCamera(), onData: (CameraControllerState s) => s);
    } else {
      return emit.forEach(_initCamera(), onData: (CameraControllerState s) => s);
    }
  }

  _init(_Init event, Emitter<CameraControllerState> emit) async {
    return await emit.forEach(_initCamera(), onData: (CameraControllerState s) => s);
  }

  Stream<CameraControllerState> _initCamera() async* {
    if (state is _Preparation) return;
    yield const CameraControllerState.preparation();
    final cams = await availableCameras();
    final l = cams.where((e) => e.lensDirection == CameraLensDirection.back).toList();
    if (l.isNotEmpty) {
      try {
        bool _ = await onNewCameraSelected(l.first);
        yield const CameraControllerState.ready();
      } on CameraException catch (e) {
        CameraErrorType typeError;
        if (e.code == 'cameraPermission') {
          typeError = CameraErrorType.permission;
        } else {
          typeError = CameraErrorType.undefined;
        }
        yield CameraControllerState.error(typeError);
      }
    }
  }

  _takePhoto(_TakePhoto event, Emitter<CameraControllerState> emit) async {
    XFile? photo = await _takePicture();
    if (photo != null) {
      return emit(CameraControllerState.takedPhoto(photo));
    }
  }

  _playPauseToggle(_TogglePause event, Emitter<CameraControllerState> emit) async {
    if (_camController == null || (_camController?.value.isInitialized ?? true)) {
      return;
    }

    if (_camController!.value.isPreviewPaused) {
      await _camController!.resumePreview();
    } else {
      await _camController!.pausePreview();
    }
  }

  _disposeCamera(_DisposeCamera event, Emitter<CameraControllerState> emit) {
    _camController?.dispose();
    emit(const CameraControllerState.initial());
  }

  _onViewFinderTap(_OnViewFinderTap event, Emitter<CameraControllerState> emit) {
    if (_camController == null) return;
    _camController!.setExposurePoint(event.offset);
    _camController!.setFocusPoint(event.offset);
  }

  Future<XFile?> _takePicture() async {
    final CameraController? cameraController = _camController;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      try {
        await GallerySaver.saveImage(file.path, albumName: "NeuroWood");
      } catch (_) {}
      return file;
    } on CameraException catch (e) {
      log('TakePicture exception $e');
      return null;
    }
  }

  Future<bool> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (_camController != null) {
      await _camController!.dispose();
    }

    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    _camController = cameraController;

    cameraController.addListener(() {
      if (cameraController.value.hasError) {
        log('Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
      return true;
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }
  }

  set openedSettings(bool val) {
    _openedSettings = val;
  }

  void _showCameraException(CameraException e) {
    logError(e.code, e.description);
  }

  void logError(String code, String? message) {
    if (message != null) {
      log('Error: $code\nError Message: $message');
    } else {
      log('Error: $code');
    }
  }
}
