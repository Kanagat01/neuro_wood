part of 'image_loader_cubit.dart';

@freezed
class ImageLoaderState with _$ImageLoaderState {
  const factory ImageLoaderState.initial() = ImageLoaderInitial;
  const factory ImageLoaderState.loading() = ImageLoading;
  const factory ImageLoaderState.loaded({
    required MeasureResultImageEntity resultImageEntity,
  }) = ImageLoaded;
  const factory ImageLoaderState.error() = ImageLoaderError;
}
