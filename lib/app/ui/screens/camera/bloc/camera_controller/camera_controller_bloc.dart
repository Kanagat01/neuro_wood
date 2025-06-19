import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
export 'package:camera/camera.dart';

part 'camera_controller_event.dart';
part 'camera_controller_state.dart';
part 'camera_controller_bloc.freezed.dart';

class CameraControllerBloc
    extends Bloc<CameraControllerEvent, CameraControllerState> {
  CameraController? _camController;
  CameraController? get camController => _camController;
  bool _openedSettings = false;

  CameraControllerBloc() : super(const CameraControllerInitial()) {
    on<CameraControllerEvent>((event, emit) async {
      switch (event) {
        case CameraControllerStarted():
          await _started(event, emit);
          break;
        case CameraControllerInit():
          await _init(event, emit);
          break;
        case CameraControllerReinit():
          await _reinit(event, emit);
          break;
        case CameraControllerTakePhoto():
          await _takePhoto(event, emit);
          break;
        case CameraControllerTogglePause():
          await _playPauseToggle(event, emit);
          break;
        case CameraControllerDisposeCamera():
          _disposeCamera(event, emit);
          break;
        case CameraControllerOnViewFinderTap():
          _onViewFinderTap(event, emit);
          break;
      }
    });
  }

  _started(
    CameraControllerStarted event,
    Emitter<CameraControllerState> emit,
  ) {}

  _reinit(
    CameraControllerReinit event,
    Emitter<CameraControllerState> emit,
  ) async {
    if ((_camController != null &&
        (_camController?.value.isInitialized ?? false))) {
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
      return emit.forEach(
        _initCamera(),
        onData: (CameraControllerState s) => s,
      );
    } else {
      return emit.forEach(
        _initCamera(),
        onData: (CameraControllerState s) => s,
      );
    }
  }

  _init(CameraControllerInit event, Emitter<CameraControllerState> emit) async {
    return await emit.forEach(
      _initCamera(),
      onData: (CameraControllerState s) => s,
    );
  }

  Stream<CameraControllerState> _initCamera() async* {
    if (state is CameraControllerPreparation) return;
    yield const CameraControllerState.preparation();
    final cams = await availableCameras();
    final l = cams
        .where((e) => e.lensDirection == CameraLensDirection.back)
        .toList();
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

  _takePhoto(
    CameraControllerTakePhoto event,
    Emitter<CameraControllerState> emit,
  ) async {
    XFile? photo = await _takePicture();
    if (photo != null) {
      return emit(CameraControllerState.takedPhoto(photo));
    }
  }

  _playPauseToggle(
    CameraControllerTogglePause event,
    Emitter<CameraControllerState> emit,
  ) async {
    if (_camController == null ||
        (_camController?.value.isInitialized ?? true)) {
      return;
    }

    if (_camController!.value.isPreviewPaused) {
      await _camController!.resumePreview();
    } else {
      await _camController!.pausePreview();
    }
  }

  _disposeCamera(
    CameraControllerDisposeCamera event,
    Emitter<CameraControllerState> emit,
  ) {
    _camController?.dispose();
    emit(const CameraControllerState.initial());
  }

  _onViewFinderTap(
    CameraControllerOnViewFinderTap event,
    Emitter<CameraControllerState> emit,
  ) {
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
      final XFile picture = await cameraController.takePicture();
      try {
        // await GallerySaver.saveImage(file.path, albumName: "NeuroWood");
        final dir = Directory('/storage/emulated/0/Download'); // TODO: ios
        final file = File('${dir.path}/${picture.path}');
        await file.writeAsBytes(await picture.readAsBytes());
      } catch (_) {}
      return picture;
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
