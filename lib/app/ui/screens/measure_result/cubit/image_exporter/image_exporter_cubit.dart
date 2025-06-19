import 'dart:async';

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/measure_result_image_entity.dart';
import 'package:neuro_wood/core/services/permissions/permissions.dart';
import 'package:path_provider/path_provider.dart';

part 'image_exporter_state.dart';
part 'image_exporter_cubit.freezed.dart';

class ImageExporterCubit extends Cubit<ImageExporterState> {
  ImageExporterCubit({required this.result, required this.permissions})
    : super(const ImageExporterState.initial()) {
    rendersKeys = List.generate(
      result.items.length,
      (i) => GlobalKey(debugLabel: '$i'),
    );
  }

  final MeasureResultImageEntity result;
  final Permissions permissions;

  late List<GlobalKey> rendersKeys;

  Future<PermissionStatus> _checkPermission() async {
    PermissionStatus status = await permissions.checkPermission(
      PermissionsEnum.photos,
    );
    if (status == PermissionStatus.denied ||
        status == PermissionStatus.restricted) {
      status = await permissions.request(PermissionsEnum.photos);
    }
    return status;
  }

  Future<bool> openSettings() async {
    return await permissions.openSetting();
  }

  exportAll() async {
    emit(const ImageExporterState.proccessing());
    PermissionStatus perm = await _checkPermission();
    if (!(perm == PermissionStatus.granted ||
        perm == PermissionStatus.limited)) {
      emit(const ImageExporterState.error(ErrorType.permission));
      return;
    }
    bool hasError = false;
    final Size size = Size(
      result.imageInfo.image.width.toDouble(),
      result.imageInfo.image.height.toDouble(),
    );
    for (int i = 0; i < result.items.length && !hasError; i++) {
      CustomPainter painter = result.items[i].foregroundPainter;
      final pngBytes = await _prepareImage(painter: painter, size: size);
      if (pngBytes == null) {
        hasError = true;
        continue;
      }
      final saveRes = await _saveFile(
        fileName: result.items[i].fileName,
        pngBytes: pngBytes,
      );

      if (saveRes != true) {
        hasError = true;
        continue;
      }
    }
    if (!hasError) {
      emit(const ImageExporterState.success(oneImage: false));
    } else {
      emit(const ImageExporterState.error(ErrorType.undefined));
    }
  }

  export() async {
    emit(const ImageExporterState.proccessing());
    PermissionStatus perm = await _checkPermission();
    if (!(perm == PermissionStatus.granted ||
        perm == PermissionStatus.limited)) {
      emit(const ImageExporterState.error(ErrorType.permission));
      return;
    }
    final int selected = result.selected;

    CustomPainter painter = result.items[selected].foregroundPainter;
    final Size size = Size(
      result.imageInfo.image.width.toDouble(),
      result.imageInfo.image.height.toDouble(),
    );
    final pngBytes = await _prepareImage(painter: painter, size: size);
    if (pngBytes == null) {
      emit(const ImageExporterState.error(ErrorType.undefined));
      return;
    }
    final saveRes = await _saveFile(
      fileName: result.items[selected].fileName,
      pngBytes: pngBytes,
    );

    if (saveRes == true) {
      emit(const ImageExporterState.success());
      return;
    }
    emit(const ImageExporterState.error(ErrorType.undefined));
    return;
  }

  Future<Uint8List?> _prepareImage({
    required CustomPainter painter,
    required Size size,
  }) async {
    // Stopwatch s = Stopwatch();
    // s.start();
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    painter.paint(canvas, size);
    // log("Paint - ${s.elapsedMilliseconds}");

    ui.Picture pic = recorder.endRecording();
    // log("pic - ${s.elapsedMilliseconds}");

    ui.Image renderedImage = await pic.toImage(
      size.width.floor(),
      size.height.floor(),
    );
    // log("renderedImage - ${s.elapsedMilliseconds}");

    //долгая операция
    ByteData? byteData = await renderedImage.toByteData(
      format: ui.ImageByteFormat.png,
    );
    // log("byteData - ${s.elapsedMilliseconds}");

    Uint8List? bytearray = byteData?.buffer.asUint8List();
    // log("bytearray - ${s.elapsedMilliseconds}");

    // s.stop();
    return bytearray;
  }

  Future<bool?> _saveFile({
    required String fileName,
    required Uint8List pngBytes,
  }) async {
    String dir = (await getTemporaryDirectory()).path;
    File file = File('$dir/$fileName');
    await file.writeAsBytes(pngBytes);
    // bool? saveRes = await GallerySaver.saveImage(
    //   file.path,
    //   albumName: "NeuroWood",
    // );
    await file.delete();
    return true;
  }
}
