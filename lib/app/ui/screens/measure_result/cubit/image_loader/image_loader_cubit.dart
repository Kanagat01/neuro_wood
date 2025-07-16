import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/measure_result_image_entity.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_measurements_repository.dart';
import 'package:neuro_wood/app/ui/screens/measure_result/widgets/painters.dart';

part 'image_loader_state.dart';
part 'image_loader_cubit.freezed.dart';

class ImageLoaderCubit extends Cubit<ImageLoaderState> {
  final IMeasurementsRepository measurementsRepository;
  ImageLoaderCubit({required this.measurementsRepository})
    : super(const ImageLoaderState.initial());

  load(MeasureResultEntityFinish result, double screenWidth) async {
    emit(const ImageLoaderState.loading());
    try {
      String? path = await measurementsRepository.getMeasureImage(
        result.measureId,
      );
      if (path == null) {
        emit(const ImageLoaderState.error());
        return;
      }
      ImageProvider image = NetworkImage(path);
      Completer<ImageInfo> completer = Completer<ImageInfo>();
      image
          .resolve(const ImageConfiguration())
          .addListener(
            ImageStreamListener(
              (ImageInfo info, bool _) => completer.complete(info),
            ),
          );

      final info = await completer.future;
      final res = _prepare(
        screenWidth: screenWidth,
        info: info,
        result: result,
        image: image,
      );
      emit(ImageLoaderState.loaded(resultImageEntity: res));
    } catch (e) {
      emit(const ImageLoaderState.error());
    }
  }

  MeasureResultImageEntity _prepare({
    required double screenWidth,
    required ImageInfo info,
    required MeasureResultEntityFinish result,
    required ImageProvider image,
  }) {
    final Size size = Size(
      info.image.width.toDouble(),
      info.image.height.toDouble(),
    );
    final double pixelRatio = size.width / screenWidth;
    final String fileName = DateFormat('dd.MM.y_HH:MM').format(result.dateTime);
    PainterBuilder builder = PainterBuilder(info);
    final data = result.data;
    return MeasureResultImageEntity(
      imageInfo: info,
      image: image,
      pixelRatio: pixelRatio,
      selected: 0,
      items: [
        if (data is MeasureResultDataTimberCarrierEntity) ...[
          ResultItem(
            title: "logDiameter".tr(),
            foregroundPainter: builder.buildMarkupPainter(
              markups: data.markup,
              shape: MarkupType.diameter,
            ),
            fileName: '${fileName}_${"logDiameter".tr().toLowerCase()}.png',
          ),
          ResultItem(
            title: "logGrade".tr(),
            foregroundPainter: builder.buildMarkupPainter(
              shape: MarkupType.sort,
              markups: data.markup,
            ),
            fileName: '${fileName}_${"logGrade".tr().toLowerCase()}.png',
          ),
        ],
        ResultItem(
          title: "logHeights".tr(),
          foregroundPainter: builder.buildLinesPainter(
            lines: data.verticalLines,
          ),
          fileName: '${fileName}_${"logHeights".tr().toLowerCase()}.png',
        ),
        ResultItem(
          title: "logLatitudes".tr(),
          foregroundPainter: builder.buildLinesPainter(
            lines: data.horizontalLines,
          ),
          fileName: '${fileName}_${"logLatitudes".tr().toLowerCase()}.png',
        ),
      ],
    );
  }
}
