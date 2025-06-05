part of 'image_loader_cubit.dart';

@freezed
class ImageLoaderState with _$ImageLoaderState {
  const factory ImageLoaderState.initial() = _Initial;
  const factory ImageLoaderState.loading() = _Loading;
  const factory ImageLoaderState.loaded({required MeasureResultImageEntity resultImageEntity}) = _Loaded;
  const factory ImageLoaderState.error() = _Error;
}
