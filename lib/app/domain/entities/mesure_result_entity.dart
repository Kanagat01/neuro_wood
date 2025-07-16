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
    required super.measureId,
    required super.licensePlateText,
    required super.dateTime,
    required super.hasFrontData,
    required super.type,
  });
}

class MeasureResultEntityError extends MeasureResultEntityBase {
  final String? errorMessage;

  MeasureResultEntityError({
    required super.measureId,
    required super.dateTime,
    required super.licensePlateText,
    required super.hasFrontData,
    required super.type,
    this.errorMessage,
  });
}

class MeasureResultEntitySucess extends MeasureResultEntityBase {
  final MeasureResultDataEntity data;

  MeasureResultEntitySucess({
    required super.dateTime,
    required super.licensePlateText,
    super.hasFrontData = false,
    required super.measureId,
    required super.type,
    required this.data,
  });
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
    required super.measureId,
    required super.dateTime,
    required super.licensePlateText,
    this.breed,
    this.breeds,
    required this.woodVolumeCircle,
    required this.woodVolumeEllipse,
    required this.location,
    this.length,
    required this.sortiment,
    required super.type,
    required super.data,
    // this.carNumber,
    this.provider,
    this.vehicleType,
  }) : super(hasFrontData: true);
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
}

class MeasureResultDataTimberCarrierEntity extends MeasureResultDataEntity {
  final Map<String, double> sortPercent;
  final List<MarkupEntity> markup;

  MeasureResultDataTimberCarrierEntity({
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
    required this.sortPercent,
    required this.markup,
  });
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
