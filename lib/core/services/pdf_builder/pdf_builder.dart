import 'dart:io';
import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart' as f;
import 'package:flutter/services.dart' show rootBundle;
import 'package:image/image.dart' as img;
import 'package:neuro_wood/core/helpers/extensions.dart';
import 'package:neuro_wood/core/ui/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:intl/intl.dart' as intl;
import 'package:neuro_wood/app/domain/entities/measure_result_image_entity.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';

class PDFBuilder {
  Font? rttf;
  Font? bttf;

  TextStyle get _regularTextStyle =>
      TextStyle(font: rttf, fontSize: 14, height: 1);
  TextStyle get _boldTextStyle => TextStyle(font: bttf);

  Future<img.Image> _exportImage(
    MeasureResultImageEntity images,
    int n,
    PdfPoint point,
  ) async {
    double scale = 1;
    if (images.imageInfo.image.width > point.x) {
      scale = images.imageInfo.image.width / point.x;
    }
    final f.Size size = f.Size(
      images.imageInfo.image.width / scale,
      images.imageInfo.image.height / scale,
    );
    final painter = images.items[n].foregroundPainter;
    ui.PictureRecorder recorder = ui.PictureRecorder();
    f.Canvas canvas = f.Canvas(recorder);
    painter.paint(canvas, size);
    final image = await recorder.endRecording().toImage(
      size.width.floor(),
      size.height.floor(),
    );
    return img.Image.fromBytes(
      width: image.width,
      height: image.height,
      bytes: (await image.toByteData())!.buffer,
    );
  }

  Future<File> createFromMeasureResult({
    required MeasureResultEntityFinish result,
    required MeasureResultImageEntity images,
    required String fileName,
  }) async {
    ByteData fontBytes = await rootBundle.load(
      'assets/fonts/Open_Sans/static/OpenSans/OpenSans-Regular.ttf',
    );
    rttf ??= Font.ttf(fontBytes.buffer.asByteData());
    fontBytes = await rootBundle.load(
      'assets/fonts/Open_Sans/static/OpenSans/OpenSans-SemiBold.ttf',
    );
    bttf ??= Font.ttf(fontBytes.buffer.asByteData());
    var dateFormat = intl.DateFormat('dd.MM.y   HH:mm');
    final pdf = Document();
    const docFormat = PdfPageFormat.a4;
    final point = docFormat.availableDimension;
    final data = result.data;
    img.Image imageDiameters = await _exportImage(images, 0, point);
    img.Image imageSort = await _exportImage(images, 1, point);
    // img.Image imageHeights = await _export(images, 2);
    // img.Image imageWidths = await _export(images, 3);
    pdf.addPage(
      Page(
        pageFormat: docFormat,
        build: (Context context) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const PdfColor.fromInt(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          result.type.name.tr(),
                          // result.licensePlateText.toUpperCase(),
                          style: _boldTextStyle.copyWith(
                            color: PdfColor.fromInt(
                              NeuroWoodColors.black.toARGB32(),
                            ),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          dateFormat.format(result.dateTime),
                          style: _regularTextStyle.copyWith(
                            color: PdfColor.fromInt(
                              NeuroWoodColors.darkGray.toARGB32(),
                            ),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    _measurePropertyBloc(
                      name: "generalMeasureInfo".tr(),
                      values: [
                        MapEntry(
                          "breadLabel".tr(),
                          result.breed ?? result.breeds?.join(', '),
                        ),
                        if (result.sortiment.isNotEmpty)
                          MapEntry("sortimentLabel".tr(), result.sortiment),
                        MapEntry(
                          "countLogs".tr(),
                          "${data.count} ${'pcs'.tr()}",
                        ),
                        if (result.length != null)
                          MapEntry("Номинальная длина", "${result.length} см."),
                        if (result.provider?.isNotEmpty ?? false)
                          MapEntry("Поставщик", "${result.provider}"),
                        if (result.vehicleType?.isNotEmpty ?? false)
                          MapEntry(
                            "Тип транспортного средства",
                            "${result.vehicleType}",
                          ),
                      ],
                    ),
                    if ((result.breeds?.isEmpty ?? true) &&
                        data is MeasureResultDataTimberCarrierEntity)
                      _measurePropertyBloc(
                        name: "grade".tr(),
                        values: data.sortPercent
                            .map((key, value) {
                              double volume =
                                  result.woodVolumeEllipse * (value / 100);
                              String sort;
                              switch (key) {
                                case "1":
                                  sort = "firstSort".tr();
                                  break;
                                case "3":
                                  sort = "thirdSord".tr();
                                  break;
                                case "d":
                                  sort = "lastSort".tr();
                                  break;
                                default:
                                  sort = "unrecognizedSort".tr();
                              }
                              return MapEntry(
                                sort,
                                "volumeOrPerc".tr(
                                  args: [volume.toStringAsFixed(1), "$value"],
                                ),
                              );
                            })
                            .entries
                            .toList(),
                      ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "volumeLog".tr(),
                          style: _regularTextStyle.copyWith(
                            color: const PdfColor.fromInt(0xFF96BC44),
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${result.woodVolumeEllipse.toStringAsFixed(2)} м³",
                            textAlign: TextAlign.right,
                            style: _boldTextStyle.copyWith(
                              color: PdfColor.fromInt(
                                NeuroWoodColors.black.toARGB32(),
                              ),
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildImage(
                      image: imageDiameters,
                      docFormat: docFormat,
                      text: "Диаметры бревен",
                    ),
                    if (result.breed != null) ...[
                      SizedBox(width: 16),
                      _buildImage(
                        image: imageSort,
                        docFormat: docFormat,
                        text: "Сортность бревен",
                      ),
                    ],
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
    // addImagePage(
    //   pdf: pdf,
    //   text: "Диаметр бревен",
    //   image: imageDiameters,
    // );
    // addImagePage(
    //   pdf: pdf,
    //   text: "Сортность бревен",
    //   image: imageSort,
    // );
    // addImagePage(
    //   pdf: pdf,
    //   text: "Высоты",
    //   image: imageHeights,
    // );
    // addImagePage(
    //   pdf: pdf,
    //   text: "Широты",
    //   image: imageWidths,
    // );
    final bytes = await pdf.save();
    String dir = (await getTemporaryDirectory()).path;
    File file = File('$dir/report_$fileName.pdf');
    return await file.writeAsBytes(bytes);
  }

  _buildImage({
    required img.Image image,
    required PdfPageFormat docFormat,
    required String text,
  }) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: docFormat.availableWidth / 2 - 16,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ImageImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(text, style: _regularTextStyle),
      ],
    );
  }

  // addImagePage({
  //   required Document pdf,
  //   required String text,
  //   required img.Image image,
  // }) {
  //   pdf.addPage(
  //     Page(
  //         pageFormat: PdfPageFormat.a4,
  //         build: (Context context) {
  //           return Column(children: [
  //             Text(text, style: _regularTextStyle),
  //             SizedBox(height: 16),
  //             Image(
  //               ImageImage(image),
  //               width: PdfPageFormat.a4.availableWidth,
  //               height: PdfPageFormat.a4.availableHeight - 30,
  //             ),
  //           ]);
  //         }),
  //   );
  // }

  Widget _measurePropertyBloc({
    required String name,
    required List<MapEntry> values,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Text(
          name,
          style: _regularTextStyle.copyWith(
            color: const PdfColor.fromInt(0xFF96BC44),
            fontSize: 14,
          ),
        ),
        SizedBox(height: 12),
        ...intersperse(
          SizedBox(height: 8),
          values.map((e) => _measurePropertyItem(name: e.key, value: e.value)),
        ),
      ],
    );
  }

  Widget _measurePropertyItem({required String name, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: _regularTextStyle.copyWith(
            color: PdfColor.fromInt(NeuroWoodColors.darkGray.toARGB32()),
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: _boldTextStyle.copyWith(
              color: PdfColor.fromInt(NeuroWoodColors.black.toARGB32()),
              fontSize: 16,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
