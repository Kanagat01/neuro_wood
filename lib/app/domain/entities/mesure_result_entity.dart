import 'package:neuro_wood/app/domain/entities/measure_type.dart';

abstract class MeasureResultEntityBase {
  final String measureId;
  final DateTime dateTime;
  final bool hasFrontData;
  final String licensePlateText;
  final MeasureType type;

  MeasureResultEntityBase({
    required this.measureId,
    required this.dateTime,
    required this.hasFrontData,
    required this.licensePlateText,
    required this.type,
  });
}

class MeasureResultEntityInProgress extends MeasureResultEntityBase {
  MeasureResultEntityInProgress({
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
}

class MeasureResultEntityError extends MeasureResultEntityBase {
  final String? errorMessage;

  MeasureResultEntityError({
    required String measureId,
    required DateTime dateTime,
    required String licensePlateText,
    required bool hasFrontData,
    required MeasureType type,
    this.errorMessage,
  }) : super(
          measureId: measureId,
          dateTime: dateTime,
          hasFrontData: hasFrontData,
          licensePlateText: licensePlateText,
          type: type,
        );
}

class MeasureResultEntitySucess extends MeasureResultEntityBase {
  final MeasureResultDataEntity data;

  MeasureResultEntitySucess({
    required DateTime dateTime,
    required String licensePlateText,
    bool hasFrontData = false,
    required String measureId,
    required MeasureType type,
    required this.data,
  }) : super(
          measureId: measureId,
          dateTime: dateTime,
          hasFrontData: hasFrontData,
          licensePlateText: licensePlateText,
          type: type,
        );
}

class MeasureResultEntityFinish extends MeasureResultEntitySucess {
  final double woodVolumeCircle;
  final double woodVolumeEllipse;
  final String location;
  final String? breed;
  final List<String>? breeds;
  final String sortiment;
  // final String? carNumber;
  final String? provider;
  final String? vehicleType;
  final int? length;

  MeasureResultEntityFinish({
    required String measureId,
    required DateTime dateTime,
    required String licensePlateText,
    this.breed,
    this.breeds,
    required this.woodVolumeCircle,
    required this.woodVolumeEllipse,
    required this.location,
    this.length,
    required this.sortiment,
    required MeasureType type,
    required MeasureResultDataEntity data,
    // this.carNumber,
    this.provider,
    this.vehicleType,
  }) : super(
          measureId: measureId,
          dateTime: dateTime,
          licensePlateText: licensePlateText,
          hasFrontData: true,
          type: type,
          data: data,
        );
}

abstract class MeasureResultDataEntity {
  final double? kpdCircle;
  final double? kpdElipse;
  final int count;
  final double medianHeight;
  final double medianWidth;
  final double? woodAreaCircle;
  final double woodAreaEllipse;
  final double? effectiveArea;
  final List<LineCoordsEntity> verticalLines;
  final List<LineCoordsEntity> horizontalLines;

  MeasureResultDataEntity({
    this.kpdCircle,
    this.kpdElipse,
    required this.count,
    required this.medianHeight,
    required this.medianWidth,
    required this.woodAreaCircle,
    required this.woodAreaEllipse,
    this.effectiveArea,
    required this.verticalLines,
    required this.horizontalLines,
  });
}

class MeasureResultDataStackEntity extends MeasureResultDataEntity {
  MeasureResultDataStackEntity({
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
}

class MeasureResultDataTimberCarrierEntity extends MeasureResultDataEntity {
  final Map<String, double> sortPercent;
  final List<MarkupEntity> markup;

  MeasureResultDataTimberCarrierEntity({
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
    required this.sortPercent,
    required this.markup,
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
}

class CoordEntity {
  final num x, y;

  CoordEntity(this.x, this.y);

  @override
  toString() => '($x, $y)';
}

class LineCoordsEntity {
  final CoordEntity start;
  final CoordEntity end;

  LineCoordsEntity(this.start, this.end);

  @override
  toString() => '$start - $end';
}

class MarkupEntity {
  final CoordEntity topLeft, bottomRight;
  final String? woodClass;
  final double diameter;

  MarkupEntity({
    required this.topLeft,
    required this.bottomRight,
    this.woodClass,
    required this.diameter,
  });

  @override
  toString() => '($topLeft, $bottomRight) class=$woodClass, D=$diameter';
}
