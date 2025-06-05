import 'package:neuro_wood/app/domain/entities/measure_type.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';

class MeasureResultBuilder {
  MeasureResultEntityBase build(Map<String, dynamic> map) {
    if (map.containsKey('recognition_status')) {
      final bool hasFrontData = map['location'] != null;
      if (map['recognition_status'] == 'processing') {
        return MeasureResultModelInProgress.fromMap(map, hasFrontData);
      } else if (map['recognition_status'] == 'error') {
        return MeasureResultModelError.fromMap(map, hasFrontData);
      } else if (map['recognition_status'] == 'success') {
        if (hasFrontData) {
          return MeasureResultModelFinish.fromMap(map);
        } else {
          return MeasureResultModelSucess.fromMap(map);
        }
      }
      return MeasureResultModelFinish.fromMap(map);
    } else {
      return MeasureResultModelFinish.fromMap(map);
    }
  }
}

class MeasureResultModelInProgress extends MeasureResultEntityInProgress {
  MeasureResultModelInProgress({
    required String measureId,
    required String licensePlateText,
    required DateTime dateTime,
    required bool hasFrontData,
    required MeasureType type,
  }) : super(
          measureId: measureId,
          dateTime: dateTime,
          hasFrontData: hasFrontData,
          licensePlateText: licensePlateText,
          type: type,
        );
  factory MeasureResultModelInProgress.fromMap(
    Map<String, dynamic> map,
    bool hasFrontData,
  ) =>
      MeasureResultModelInProgress(
        measureId: map['measure_id'],
        dateTime: map['date_time'],
        licensePlateText: map['license_plate_text']?.trim() ?? '',
        type: getMeasureTypeFromString(map['recognition_type']),
        hasFrontData: hasFrontData,
      );
}

class MeasureResultModelError extends MeasureResultEntityError {
  MeasureResultModelError({
    required String measureId,
    required String licensePlateText,
    required DateTime dateTime,
    required bool hasFrontData,
    required MeasureType type,
    String? errorMessage,
  }) : super(
          measureId: measureId,
          dateTime: dateTime,
          hasFrontData: hasFrontData,
          errorMessage: errorMessage,
          licensePlateText: licensePlateText,
          type: type,
        );

  factory MeasureResultModelError.fromMap(
    Map<String, dynamic> map,
    bool hasFrontData,
  ) =>
      MeasureResultModelError(
        measureId: map['measure_id'],
        dateTime: map['date_time'],
        errorMessage: map['error_message'],
        licensePlateText: map['license_plate_text']?.trim() ?? '',
        type: getMeasureTypeFromString(map['recognition_type']),
        hasFrontData: hasFrontData,
      );
}

class MeasureResultModelSucess extends MeasureResultEntitySucess {
  MeasureResultModelSucess({
    required DateTime dateTime,
    required String measureId,
    bool hasFrontData = false,
    required String licensePlateText,
    required MeasureType type,
    required MeasureResultDataEntity data,
  }) : super(
          dateTime: dateTime,
          measureId: measureId,
          licensePlateText: licensePlateText,
          hasFrontData: hasFrontData,
          type: type,
          data: data,
        );

  factory MeasureResultModelSucess.fromMap(Map<String, dynamic> map) =>
      MeasureResultModelSucess(
        measureId: map['measure_id'],
        licensePlateText: map['license_plate_text']?.trim() ?? '',
        dateTime: map['date_time'],
        type: getMeasureTypeFromString(map['recognition_type']),
        data: MeasureResultDataBuilder.build(
            map, getMeasureTypeFromString(map['recognition_type'])),
      );
}

class MeasureResultModelFinish extends MeasureResultEntityFinish {
  MeasureResultModelFinish({
    required String measureId,
    required double woodVolumeCircle,
    required double woodVolumeEllipse,
    required DateTime dateTime,
    required String licensePlateText,
    required String location,
    String? breed,
    List<String>? breeds,
    required String sortiment,
    int? length,
    required MeasureType type,
    required MeasureResultDataEntity data,
  }) : super(
          measureId: measureId,
          woodVolumeCircle: woodVolumeCircle,
          woodVolumeEllipse: woodVolumeEllipse,
          dateTime: dateTime,
          licensePlateText: licensePlateText,
          location: location,
          breed: breed,
          breeds: breeds,
          sortiment: sortiment,
          length: length,
          type: type,
          data: data,
        );

  factory MeasureResultModelFinish.fromMap(Map<String, dynamic> map) =>
      MeasureResultModelFinish(
        measureId: map['measure_id'],
        woodVolumeCircle: map['wood_volume_circle'] ??
            (map['length'] / 100) * map['wood_area_circle'],
        woodVolumeEllipse: map['wood_volume_ellipse'] ??
            (map['length'] / 100) * map['wood_area_ellipse'],
        licensePlateText: (map['license_plate_text'] ?? "").trim(),
        location: map['location'],
        breed: map['breed'],
        breeds: map['breeds'] != null ? List<String>.from(map['breeds']) : null,
        dateTime: map['date_time'],
        sortiment: map['sortiment'] ?? "",
        length: map['length'],
        type: getMeasureTypeFromString(map['recognition_type']),
        data: MeasureResultDataBuilder.build(
            map, getMeasureTypeFromString(map['recognition_type'])),
      );
}

class MeasureResultDataBuilder {
  static MeasureResultDataEntity build(
      Map<String, dynamic> map, MeasureType type) {
    switch (type) {
      case MeasureType.timberCarrier:
        return MeasureResultDataTimberCarrierModel.fromMap(map);
      case MeasureType.stack:
        return MeasureResultDataStackModel.fromMap(map);
    }
  }
}

class MeasureResultDataStackModel extends MeasureResultDataStackEntity {
  MeasureResultDataStackModel({
    double? kpdCircle,
    double? kpdElipse,
    required int count,
    required double medianHeight,
    required double medianWidth,
    required double? woodAreaCircle,
    required double woodAreaEllipse,
    double? effectiveArea,
    required List<LineCoordsEntity> verticalLines,
    required List<LineCoordsEntity> horizontalLines,
  }) : super(
          kpdCircle: kpdCircle,
          kpdElipse: kpdElipse,
          count: count,
          medianHeight: medianHeight,
          medianWidth: medianWidth,
          woodAreaCircle: woodAreaCircle,
          woodAreaEllipse: woodAreaEllipse,
          effectiveArea: effectiveArea,
          verticalLines: verticalLines,
          horizontalLines: horizontalLines,
        );

  factory MeasureResultDataStackModel.fromMap(Map<String, dynamic> map) =>
      MeasureResultDataStackModel(
        medianHeight: map['median_height'],
        medianWidth: map['median_width'],
        woodAreaCircle: map['wood_area_circle'],
        woodAreaEllipse: map['wood_area_ellipse'],
        effectiveArea: map['effective_area'],
        kpdCircle: map['kpd_circle'],
        kpdElipse: map['kpd_ellipse'],
        count: map['count'],
        verticalLines: List<LineCoordsModel>.from(map['lines_vertical']
            .map((e) => LineCoordsModel.formMap(e as Map<String, dynamic>))),
        horizontalLines: List<LineCoordsModel>.from(map['lines_horizontal']
            .map((e) => LineCoordsModel.formMap(e as Map<String, dynamic>))),
      );
}

class MeasureResultDataTimberCarrierModel
    extends MeasureResultDataTimberCarrierEntity {
  MeasureResultDataTimberCarrierModel({
    double? kpdCircle,
    double? kpdElipse,
    required int count,
    required double medianHeight,
    required double medianWidth,
    required double? woodAreaCircle,
    required double woodAreaEllipse,
    double? effectiveArea,
    required List<LineCoordsModel> verticalLines,
    required List<LineCoordsModel> horizontalLines,
    required Map<String, double> sortPercent,
    required List<MarkupModel> markup,
  }) : super(
          kpdCircle: kpdCircle,
          kpdElipse: kpdElipse,
          count: count,
          medianHeight: medianHeight,
          medianWidth: medianWidth,
          woodAreaCircle: woodAreaCircle,
          woodAreaEllipse: woodAreaEllipse,
          effectiveArea: effectiveArea,
          verticalLines: verticalLines,
          horizontalLines: horizontalLines,
          sortPercent: sortPercent,
          markup: markup,
        );

  factory MeasureResultDataTimberCarrierModel.fromMap(
          Map<String, dynamic> map) =>
      MeasureResultDataTimberCarrierModel(
        medianHeight: map['median_height'],
        medianWidth: map['median_width'],
        woodAreaCircle: map['wood_area_circle'],
        woodAreaEllipse: map['wood_area_ellipse'],
        effectiveArea: map['effective_area'],
        kpdCircle: map['kpd_circle'],
        kpdElipse: map['kpd_ellipse'],
        count: map['count'],
        verticalLines: List<LineCoordsModel>.from(map['lines_vertical']
            .map((e) => LineCoordsModel.formMap(e as Map<String, dynamic>))),
        horizontalLines: List<LineCoordsModel>.from(map['lines_horizontal']
            .map((e) => LineCoordsModel.formMap(e as Map<String, dynamic>))),
        markup: List<MarkupModel>.from(map['markup']
            .map((e) => MarkupModel.fromMap(e as Map<String, dynamic>))),
        sortPercent: Map<String, double>.from(map['sort_percent']),
      );
}

class CoordModel extends CoordEntity {
  CoordModel(num x, num y) : super(x, y);

  factory CoordModel.fromList(List<num> list) => CoordModel(list[0], list[1]);
}

class LineCoordsModel extends LineCoordsEntity {
  LineCoordsModel(CoordEntity start, CoordEntity end) : super(start, end);

  factory LineCoordsModel.fromList(List<List<double>> list) => LineCoordsModel(
        CoordEntity(list[0][0], list[0][1]),
        CoordEntity(list[1][0], list[1][1]),
      );
  factory LineCoordsModel.formMap(Map<String, dynamic> map) => LineCoordsModel(
        CoordEntity(map["x_start"], map["y_start"]),
        CoordEntity(map["x_end"], map["y_end"]),
      );
}

class MarkupModel extends MarkupEntity {
  MarkupModel({
    required CoordEntity topLeft,
    required CoordEntity bottomRight,
    String? woodClass,
    required double diameter,
  }) : super(
          topLeft: topLeft,
          bottomRight: bottomRight,
          woodClass: woodClass,
          diameter: diameter,
        );

  factory MarkupModel.fromMap(Map<String, dynamic> map) => MarkupModel(
        topLeft: CoordModel(map['xmin'], map['ymin']),
        bottomRight: CoordModel(map['xmax'], map['ymax']),
        woodClass: map['class'],
        diameter: map['diameter'],
      );
}
