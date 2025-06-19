part of 'image_exporter_cubit.dart';

@freezed
abstract class ImageExporterState with _$ImageExporterState {
  const factory ImageExporterState.initial() = ImageExporterInitial;
  const factory ImageExporterState.proccessing() = ImageExporterProcessing;
  const factory ImageExporterState.success({bool? oneImage}) =
      ImageExporterSuccess;
  const factory ImageExporterState.error(ErrorType type) = ImageExporterError;
}

enum ErrorType { permission, undefined }
