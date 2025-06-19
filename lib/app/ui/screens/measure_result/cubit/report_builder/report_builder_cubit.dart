import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:neuro_wood/app/domain/entities/measure_result_image_entity.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/core/services/pdf_builder/pdf_builder.dart';
import 'package:path_provider/path_provider.dart';

part 'report_builder_state.dart';
part 'report_builder_cubit.freezed.dart';

class ReportBuilderCubit extends Cubit<ReportBuilderState> {
  ReportBuilderCubit({required this.pdfBuilder})
    : super(const ReportBuilderState.initial());

  final PDFBuilder pdfBuilder;

  getReport(
    MeasureResultEntityFinish result,
    MeasureResultImageEntity resultImage,
  ) async {
    if (state is ReportBuilderLoading) return;
    emit(const ReportBuilderState.loading());
    final String fileName = DateFormat('dd.MM.y_HH:MM').format(result.dateTime);
    String dir = (await getTemporaryDirectory()).path;
    File file = File('$dir/report_$fileName.pdf');
    try {
      if (await file.exists()) {
        emit(ReportBuilderState.loaded(file));
        return;
      }
    } catch (_) {}
    try {
      final report = await pdfBuilder.createFromMeasureResult(
        result: result,
        images: resultImage,
        fileName: fileName,
      );
      try {
        file.writeAsBytes(await report.readAsBytes());
      } catch (_) {}
      emit(ReportBuilderState.loaded(report));
    } catch (e) {
      log(e.toString());
      emit(const ReportBuilderState.error());
    }
  }
}
