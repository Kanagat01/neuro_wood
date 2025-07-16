import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neuro_wood/app/domain/entities/image_recognize_request_builder.dart';
import 'package:neuro_wood/app/domain/entities/measure_response.dart';
import 'package:neuro_wood/app/domain/entities/measure_type.dart';
import 'package:neuro_wood/app/domain/entities/stream_ticker.dart';
import 'package:neuro_wood/app/domain/repositories/i_nw_repository.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/permissions/permissions.dart';
import 'package:neuro_wood/core/services/sensors/sensor.dart';
import 'package:rxdart/subjects.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'camera_controller/camera_controller_bloc.dart';

part 'camera_event.dart';
part 'camera_state.dart';
part 'camera_bloc.freezed.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState>
    with WidgetsBindingObserver {
  XFile? imageFile;
  bool enableAudio = false;
  final ImagePicker _picker = ImagePicker();
  final StreamTicker _ticker = const StreamTicker();
  StreamSubscription<int>? _subscription;
  final BehaviorSubject<int> _tickerSubject = BehaviorSubject<int>();
  final CameraControllerBloc _cameraControllerBloc = CameraControllerBloc();
  StreamSubscription<CameraControllerState>? ccsSubs;
  CameraController? get cameraController => _cameraControllerBloc.camController;
  final INWRepository nwRepository;
  final ImageRecognizeRequestBuilder measureRequestBuilder =
      ImageRecognizeRequestBuilder();
  final InclineSensor sensor;
  bool _openPicker = false;
  final Permissions permissions;
  late final MeasureType _type;
  StreamSubscription<InclineMeasure>? _streamSubscription;

  set openedSettings(bool val) {
    _cameraControllerBloc.openedSettings = val;
  }

  List<CameraDescription> listCameras = <CameraDescription>[];
  CameraBloc({
    required this.nwRepository,
    required this.sensor,
    // required this.measureRequestBuilder,
    required this.permissions,
  }) : super(const CameraState.initialize()) {
    WidgetsBinding.instance.addObserver(this);
    on<CameraEvent>((event, emit) async {
      switch (event) {
        case final InitCamera e:
          _initCamera(e, emit);
          break;
        case final TakePhoto e:
          _takePhoto(e, emit);
          break;
        case final PickImage e:
          await _pickImage(e, emit);
          break;
        case final CameraSend e:
          await _send(e, emit);
          break;
        case final CameraOnViewFinderTap e:
          _onViewFinderTap(e, emit);
          break;
        case final InterruptCamera e:
          _interrupt(e, emit);
          break;
        case final DisposeCamera e:
          _dispose(e, emit);
          break;
        case final CameraEventController e:
          _cameraControllerEvent(e, emit);
          break;
        case final ChangeAllowTakePhoto e:
          _changeAllowTakePhoto(e, emit);
          break;
        case final CameraOnSettingsTap e:
          _onSettingsTap(e, emit);
          break;
      }
    });
    ccsSubs = _cameraControllerBloc.stream.listen((camState) {
      log('cameraContorller $camState');
      if (!isClosed) {
        add(CameraEvent.cameraControllerEvent(camState));
      }
    });
  }

  _onSettingsTap(CameraOnSettingsTap event, Emitter<CameraState> emit) {
    emit(const CameraState.empty());
    permissions.openSetting().then(
      (value) => _cameraControllerBloc.openedSettings = value,
    );
  }

  _changeAllowTakePhoto(ChangeAllowTakePhoto event, Emitter<CameraState> emit) {
    switch (state) {
      case CameraReady(:final inclineStream):
        emit(CameraState.ready(inclineStream));
        break;
    }
  }

  _initCamera(InitCamera event, Emitter<CameraState> emit) {
    _type = event.type;
    _cameraControllerBloc.add(const CameraControllerEvent.init());
  }

  _takePhoto(TakePhoto event, Emitter<CameraState> emit) {
    _cameraControllerBloc.add(const CameraControllerEvent.takePhoto());
  }

  _pickImage(PickImage event, Emitter<CameraState> emit) async {
    _openPicker = true;
    WakelockPlus.disable();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(CameraState.hasImage(HasImageSubState(image)));
    } else {
      _openPicker = false;
      _cameraControllerBloc.add(const CameraControllerEvent.reinit());
    }
  }

  _send(CameraSend event, Emitter<CameraState> emit) async {
    if (state is! CameraHasImage) return;
    CameraHasImage s = (state as CameraHasImage);
    measureRequestBuilder.image = s.substate.image;
    measureRequestBuilder.type = _type;
    _startPreloader();
    emit(
      s.copyWith(
        substate: Sending(
          image: s.substate.image,
          sendingProgress: _tickerSubject.stream,
        ),
      ),
    );
    final res = await nwRepository.processImage(
      await measureRequestBuilder.build(),
    );
    _cancelPreloader();
    res.fold(
      (l) {
        emit(
          s.copyWith(
            substate: ErrorResponse(image: s.substate.image, code: l.code),
          ),
        );
      },
      (r) {
        emit(
          s.copyWith(
            substate: Success(image: s.substate.image, result: r),
          ),
        );
      },
    );
  }

  _onViewFinderTap(CameraOnViewFinderTap event, Emitter<CameraState> emit) {
    _cameraControllerBloc.add(
      CameraControllerEvent.onViewFinderTap(event.offset),
    );
  }

  _interrupt(InterruptCamera event, Emitter<CameraState> emit) {
    _openPicker = false;
    // WakelockPlus.enable();
    _cameraControllerBloc.add(const CameraControllerEvent.init());
    // sensor.play();
  }

  @override
  close() async {
    _cameraControllerBloc.add(const CameraControllerEvent.disposeCamera());
    WidgetsBinding.instance.removeObserver(this);
    ccsSubs?.cancel();
    sensor.pause();
    WakelockPlus.disable();
    _streamSubscription?.cancel();
    sensor.dispose();
    _cameraControllerBloc.close();
    super.close();
  }

  _dispose(DisposeCamera event, Emitter<CameraState> emit) {
    _cameraControllerBloc.add(const CameraControllerEvent.disposeCamera());
    WidgetsBinding.instance.removeObserver(this);
    ccsSubs?.cancel();
    WakelockPlus.disable();
    sensor.pause();
    _streamSubscription?.cancel();
    sensor.dispose();
    _cameraControllerBloc.close();
    close();
  }

  _cameraControllerEvent(
    CameraEventController event,
    Emitter<CameraState> emit,
  ) {
    switch (event.ccState) {
      case CameraControllerInitial():
        if (state is! CameraHasImage) {
          emit(const CameraState.empty());
        }
        break;
      case CameraControllerReady():
        emit(const CameraState.ready());
        WakelockPlus.enable();
        _streamSubscription?.cancel();
        sensor.play();
        _streamSubscription = sensor.stream.listen((e) {
          switch (state) {
            case CameraReady(:final inclineStream):
              if (inclineStream == null && !e.isAllowable) {
                add(CameraEvent.changeAllowTakePhoto(sensor.stream));
              } else if (inclineStream != null && e.isAllowable) {
                add(const CameraEvent.changeAllowTakePhoto());
              }
              break;
          }
        });
        break;
      case CameraControllerTakedPhoto(photo: final photo):
        emit(CameraState.hasImage(HasImageSubState(photo)));
        sensor.pause();
        WakelockPlus.disable();
        _streamSubscription?.cancel();
        _cameraControllerBloc.add(const CameraControllerEvent.disposeCamera());
        break;
      case CameraControllerError():
        emit(const CameraState.errorInit());
        WakelockPlus.disable();
        break;
      default:
        break;
    }
  }

  void logError(String code, String? message) {
    if (message != null) {
      log('Error: $code\nError Message: $message');
    } else {
      log('Error: $code');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.inactive &&
        (cameraController?.value.isInitialized ?? false)) {
      _cameraControllerBloc.add(const CameraControllerEvent.disposeCamera());
      _streamSubscription?.cancel();
      WakelockPlus.disable();
      sensor.pause();
    } else if (state == AppLifecycleState.resumed &&
        ((this.state is EmptyCamera && !_openPicker) ||
            this.state is CameraErrorInit)) {
      await Future.delayed(const Duration(milliseconds: 500));
      _cameraControllerBloc.add(const CameraControllerEvent.reinit());
    }
  }

  _startPreloader() async {
    _subscription?.cancel();
    _tickerSubject.sink.add(0);
    _subscription = _ticker.tickInk().asBroadcastStream().listen(
      (int v) => _tickerSubject.sink.add(v),
    );
  }

  void _cancelPreloader() {
    _subscription?.cancel();
  }
}
