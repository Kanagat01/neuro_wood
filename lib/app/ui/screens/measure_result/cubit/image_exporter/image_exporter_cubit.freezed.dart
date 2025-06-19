// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_exporter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImageExporterState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImageExporterState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageExporterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImageExporterState()';
}


}

/// @nodoc
class $ImageExporterStateCopyWith<$Res>  {
$ImageExporterStateCopyWith(ImageExporterState _, $Res Function(ImageExporterState) __);
}


/// @nodoc


class ImageExporterInitial with DiagnosticableTreeMixin implements ImageExporterState {
  const ImageExporterInitial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImageExporterState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageExporterInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImageExporterState.initial()';
}


}




/// @nodoc


class ImageExporterProcessing with DiagnosticableTreeMixin implements ImageExporterState {
  const ImageExporterProcessing();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImageExporterState.proccessing'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageExporterProcessing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImageExporterState.proccessing()';
}


}




/// @nodoc


class ImageExporterSuccess with DiagnosticableTreeMixin implements ImageExporterState {
  const ImageExporterSuccess({this.oneImage});
  

 final  bool? oneImage;

/// Create a copy of ImageExporterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageExporterSuccessCopyWith<ImageExporterSuccess> get copyWith => _$ImageExporterSuccessCopyWithImpl<ImageExporterSuccess>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImageExporterState.success'))
    ..add(DiagnosticsProperty('oneImage', oneImage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageExporterSuccess&&(identical(other.oneImage, oneImage) || other.oneImage == oneImage));
}


@override
int get hashCode => Object.hash(runtimeType,oneImage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImageExporterState.success(oneImage: $oneImage)';
}


}

/// @nodoc
abstract mixin class $ImageExporterSuccessCopyWith<$Res> implements $ImageExporterStateCopyWith<$Res> {
  factory $ImageExporterSuccessCopyWith(ImageExporterSuccess value, $Res Function(ImageExporterSuccess) _then) = _$ImageExporterSuccessCopyWithImpl;
@useResult
$Res call({
 bool? oneImage
});




}
/// @nodoc
class _$ImageExporterSuccessCopyWithImpl<$Res>
    implements $ImageExporterSuccessCopyWith<$Res> {
  _$ImageExporterSuccessCopyWithImpl(this._self, this._then);

  final ImageExporterSuccess _self;
  final $Res Function(ImageExporterSuccess) _then;

/// Create a copy of ImageExporterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? oneImage = freezed,}) {
  return _then(ImageExporterSuccess(
oneImage: freezed == oneImage ? _self.oneImage : oneImage // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class ImageExporterError with DiagnosticableTreeMixin implements ImageExporterState {
  const ImageExporterError(this.type);
  

 final  ErrorType type;

/// Create a copy of ImageExporterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageExporterErrorCopyWith<ImageExporterError> get copyWith => _$ImageExporterErrorCopyWithImpl<ImageExporterError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ImageExporterState.error'))
    ..add(DiagnosticsProperty('type', type));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageExporterError&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ImageExporterState.error(type: $type)';
}


}

/// @nodoc
abstract mixin class $ImageExporterErrorCopyWith<$Res> implements $ImageExporterStateCopyWith<$Res> {
  factory $ImageExporterErrorCopyWith(ImageExporterError value, $Res Function(ImageExporterError) _then) = _$ImageExporterErrorCopyWithImpl;
@useResult
$Res call({
 ErrorType type
});




}
/// @nodoc
class _$ImageExporterErrorCopyWithImpl<$Res>
    implements $ImageExporterErrorCopyWith<$Res> {
  _$ImageExporterErrorCopyWithImpl(this._self, this._then);

  final ImageExporterError _self;
  final $Res Function(ImageExporterError) _then;

/// Create a copy of ImageExporterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(ImageExporterError(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ErrorType,
  ));
}


}

// dart format on
