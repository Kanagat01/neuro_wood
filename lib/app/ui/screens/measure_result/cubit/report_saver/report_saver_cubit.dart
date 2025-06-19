import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/core/services/permissions/permissions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
part 'report_saver_state.dart';
part 'report_saver_cubit.freezed.dart';

class ReportSaverCubit extends Cubit<ReportSaverState> {
  ReportSaverCubit({required this.permissions})
    : super(const ReportSaverState.initial());
  final Permissions permissions;

  saveReport(File report) async {
    emit(const ReportSaverState.inProgress());
    String fileName = report.path.split('/').last;
    Directory? dir;
    if (Platform.isAndroid) {
      final params = SaveFileDialogParams(
        sourceFilePath: report.path,
        fileName: 'report_$fileName',
      );
      try {
        final savedFile = await FlutterFileDialog.saveFile(params: params);
        if (savedFile?.isNotEmpty ?? false) {
          emit(const ReportSaverState.saved());
          return;
        } else {
          emit(const ReportSaverState.initial());
          return;
        }
      } catch (_) {}
      PermissionStatus status = await permissions.checkPermission(
        PermissionsEnum.photos,
      );
      if (status == PermissionStatus.denied ||
          status == PermissionStatus.restricted) {
        status = await permissions.request(PermissionsEnum.photos);
      }
      if ((status == PermissionStatus.granted ||
          status == PermissionStatus.limited)) {}
      dir = await getExternalStorageDirectory();
    }
    String? dirPath = dir?.path;
    File? file = dirPath == null ? null : File('$dirPath/report_$fileName');
    if (file != null) {
      try {
        await file.writeAsBytes(await report.readAsBytes());
        emit(const ReportSaverState.saved());
        return;
      } catch (e) {
        log('$e');
        emit(const ReportSaverState.error());
        return;
      }
    }
    emit(const ReportSaverState.error());
  }
}
