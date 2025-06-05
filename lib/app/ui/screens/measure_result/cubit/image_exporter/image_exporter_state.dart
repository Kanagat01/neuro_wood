part of 'image_exporter_cubit.dart';

@freezed
class ImageExporterState with _$ImageExporterState {
  const factory ImageExporterState.initial() = _Initial;
  const factory ImageExporterState.proccessing() = _Processing;
  const factory ImageExporterState.success({bool? oneImage,}) = _Success;
  const factory ImageExporterState.error(ErrorType type) = _Error;
}

enum ErrorType {
  permission,
  undefined,
}
