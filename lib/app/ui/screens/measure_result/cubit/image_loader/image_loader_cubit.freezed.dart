// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_loader_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImageLoaderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageLoaderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageLoaderState()';
}


}

/// @nodoc
class $ImageLoaderStateCopyWith<$Res>  {
$ImageLoaderStateCopyWith(ImageLoaderState _, $Res Function(ImageLoaderState) __);
}


/// @nodoc


class ImageLoaderInitial implements ImageLoaderState {
  const ImageLoaderInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageLoaderInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageLoaderState.initial()';
}


}




/// @nodoc


class ImageLoading implements ImageLoaderState {
  const ImageLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageLoaderState.loading()';
}


}




/// @nodoc


class ImageLoaded implements ImageLoaderState {
  const ImageLoaded({required this.resultImageEntity});
  

 final  MeasureResultImageEntity resultImageEntity;

/// Create a copy of ImageLoaderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageLoadedCopyWith<ImageLoaded> get copyWith => _$ImageLoadedCopyWithImpl<ImageLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageLoaded&&(identical(other.resultImageEntity, resultImageEntity) || other.resultImageEntity == resultImageEntity));
}


@override
int get hashCode => Object.hash(runtimeType,resultImageEntity);

@override
String toString() {
  return 'ImageLoaderState.loaded(resultImageEntity: $resultImageEntity)';
}


}

/// @nodoc
abstract mixin class $ImageLoadedCopyWith<$Res> implements $ImageLoaderStateCopyWith<$Res> {
  factory $ImageLoadedCopyWith(ImageLoaded value, $Res Function(ImageLoaded) _then) = _$ImageLoadedCopyWithImpl;
@useResult
$Res call({
 MeasureResultImageEntity resultImageEntity
});




}
/// @nodoc
class _$ImageLoadedCopyWithImpl<$Res>
    implements $ImageLoadedCopyWith<$Res> {
  _$ImageLoadedCopyWithImpl(this._self, this._then);

  final ImageLoaded _self;
  final $Res Function(ImageLoaded) _then;

/// Create a copy of ImageLoaderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? resultImageEntity = null,}) {
  return _then(ImageLoaded(
resultImageEntity: null == resultImageEntity ? _self.resultImageEntity : resultImageEntity // ignore: cast_nullable_to_non_nullable
as MeasureResultImageEntity,
  ));
}


}

/// @nodoc


class ImageLoaderError implements ImageLoaderState {
  const ImageLoaderError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageLoaderError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageLoaderState.error()';
}


}




// dart format on
