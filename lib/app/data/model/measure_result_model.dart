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
    required super.measureId,
    required super.licensePlateText,
    required super.dateTime,
    required super.hasFrontData,
    required super.type,
  });
  factory MeasureResultModelInProgress.fromMap(
    Map<String, dynamic> map,
    bool hasFrontData,
  ) => MeasureResultModelInProgress(
    measureId: map['measure_id'],
    dateTime: map['date_time'],
    licensePlateText: map['license_plate_text']?.trim() ?? '',
    type: getMeasureTypeFromString(map['recognition_type']),
    hasFrontData: hasFrontData,
  );
}

class MeasureResultModelError extends MeasureResultEntityError {
  MeasureResultModelError({
    required super.measureId,
    required super.licensePlateText,
    required super.dateTime,
    required super.hasFrontData,
    required super.type,
    super.errorMessage,
  });

  factory MeasureResultModelError.fromMap(
    Map<String, dynamic> map,
    bool hasFrontData,
  ) => MeasureResultModelError(
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
    required super.dateTime,
    required super.measureId,
    super.hasFrontData,
    required super.licensePlateText,
    required super.type,
    required super.data,
  });

  factory MeasureResultModelSucess.fromMap(Map<String, dynamic> map) =>
      MeasureResultModelSucess(
        measureId: map['measure_id'],
        licensePlateText: map['license_plate_text']?.trim() ?? '',
        dateTime: map['date_time'],
        type: getMeasureTypeFromString(map['recognition_type']),
        data: MeasureResultDataBuilder.build(
          map,
          getMeasureTypeFromString(map['recognition_type']),
        ),
      );
}

class MeasureResultModelFinish extends MeasureResultEntityFinish {
  MeasureResultModelFinish({
    required super.measureId,
    required super.woodVolumeCircle,
    required super.woodVolumeEllipse,
    required super.dateTime,
    required super.licensePlateText,
    required super.location,
    super.breed,
    super.breeds,
    required super.sortiment,
    super.length,
    required super.type,
    required super.data,
  });

  factory MeasureResultModelFinish.fromMap(Map<String, dynamic> map) =>
      MeasureResultModelFinish(
        measureId: map['measure_id'],
        woodVolumeCircle:
            map['wood_volume_circle'] ??
            (map['length'] / 100) * map['wood_area_circle'],
        woodVolumeEllipse:
            map['wood_volume_ellipse'] ??
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
          map,
          getMeasureTypeFromString(map['recognition_type']),
        ),
      );
}

class MeasureResultDataBuilder {
  static MeasureResultDataEntity build(
    Map<String, dynamic> map,
    MeasureType type,
  ) {
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
    super.kpdCircle,
    super.kpdElipse,
    required super.count,
    required super.medianHeight,
    required super.medianWidth,
    required super.woodAreaCircle,
    required super.woodAreaEllipse,
    super.effectiveArea,
    required super.verticalLines,
    required super.horizontalLines,
  });

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
        verticalLines: List<LineCoordsModel>.from(
          map['lines_vertical'].map(
            (e) => LineCoordsModel.formMap(e as Map<String, dynamic>),
          ),
        ),
        horizontalLines: List<LineCoordsModel>.from(
          map['lines_horizontal'].map(
            (e) => LineCoordsModel.formMap(e as Map<String, dynamic>),
          ),
        ),
      );
}

class MeasureResultDataTimberCarrierModel
    extends MeasureResultDataTimberCarrierEntity {
  MeasureResultDataTimberCarrierModel({
    super.kpdCircle,
    super.kpdElipse,
    required super.count,
    required super.medianHeight,
    required super.medianWidth,
    required super.woodAreaCircle,
    required super.woodAreaEllipse,
    super.effectiveArea,
    required List<LineCoordsModel> super.verticalLines,
    required List<LineCoordsModel> super.horizontalLines,
    required super.sortPercent,
    required List<MarkupModel> super.markup,
  });

  factory MeasureResultDataTimberCarrierModel.fromMap(
    Map<String, dynamic> map,
  ) => MeasureResultDataTimberCarrierModel(
    medianHeight: map['median_height'],
    medianWidth: map['median_width'],
    woodAreaCircle: map['wood_area_circle'],
    woodAreaEllipse: map['wood_area_ellipse'],
    effectiveArea: map['effective_area'],
    kpdCircle: map['kpd_circle'],
    kpdElipse: map['kpd_ellipse'],
    count: map['count'],
    verticalLines: List<LineCoordsModel>.from(
      map['lines_vertical'].map(
        (e) => LineCoordsModel.formMap(e as Map<String, dynamic>),
      ),
    ),
    horizontalLines: List<LineCoordsModel>.from(
      map['lines_horizontal'].map(
        (e) => LineCoordsModel.formMap(e as Map<String, dynamic>),
      ),
    ),
    markup: List<MarkupModel>.from(
      map['markup'].map((e) => MarkupModel.fromMap(e as Map<String, dynamic>)),
    ),
    sortPercent: Map<String, double>.from(map['sort_percent']),
  );
}

class CoordModel extends CoordEntity {
  CoordModel(super.x, super.y);

  factory CoordModel.fromList(List<num> list) => CoordModel(list[0], list[1]);
}

class LineCoordsModel extends LineCoordsEntity {
  LineCoordsModel(super.start, super.end);

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
    required super.topLeft,
    required super.bottomRight,
    super.woodClass,
    required super.diameter,
  });

  factory MarkupModel.fromMap(Map<String, dynamic> map) => MarkupModel(
    topLeft: CoordModel(map['xmin'], map['ymin']),
    bottomRight: CoordModel(map['xmax'], map['ymax']),
    woodClass: map['class'],
    diameter: map['diameter'],
  );
}
