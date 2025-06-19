// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_controller_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraControllerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraControllerEvent()';
}


}

/// @nodoc
class $CameraControllerEventCopyWith<$Res>  {
$CameraControllerEventCopyWith(CameraControllerEvent _, $Res Function(CameraControllerEvent) __);
}


/// @nodoc


class CameraControllerStarted implements CameraControllerEvent {
  const CameraControllerStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraControllerEvent.started()';
}


}




/// @nodoc


class CameraControllerInit implements CameraControllerEvent {
  const CameraControllerInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraControllerEvent.init()';
}


}




/// @nodoc


class CameraControllerReinit implements CameraControllerEvent {
  const CameraControllerReinit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerReinit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraControllerEvent.reinit()';
}


}




/// @nodoc


class CameraControllerTakePhoto implements CameraControllerEvent {
  const CameraControllerTakePhoto();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerTakePhoto);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraControllerEvent.takePhoto()';
}


}




/// @nodoc


class CameraControllerTogglePause implements CameraControllerEvent {
  const CameraControllerTogglePause();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerTogglePause);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraControllerEvent.playPauseToggle()';
}


}




/// @nodoc


class CameraControllerDisposeCamera implements CameraControllerEvent {
  const CameraControllerDisposeCamera();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerDisposeCamera);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraControllerEvent.disposeCamera()';
}


}




/// @nodoc


class CameraControllerOnViewFinderTap implements CameraControllerEvent {
  const CameraControllerOnViewFinderTap(this.offset);
  

 final  Offset offset;

/// Create a copy of CameraControllerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraControllerOnViewFinderTapCopyWith<CameraControllerOnViewFinderTap> get copyWith => _$CameraControllerOnViewFinderTapCopyWithImpl<CameraControllerOnViewFinderTap>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerOnViewFinderTap&&(identical(other.offset, offset) || other.offset == offset));
}


@override
int get hashCode => Object.hash(runtimeType,offset);

@override
String toString() {
  return 'CameraControllerEvent.onViewFinderTap(offset: $offset)';
}


}

/// @nodoc
abstract mixin class $CameraControllerOnViewFinderTapCopyWith<$Res> implements $CameraControllerEventCopyWith<$Res> {
  factory $CameraControllerOnViewFinderTapCopyWith(CameraControllerOnViewFinderTap value, $Res Function(CameraControllerOnViewFinderTap) _then) = _$CameraControllerOnViewFinderTapCopyWithImpl;
@useResult
$Res call({
 Offset offset
});




}
/// @nodoc
class _$CameraControllerOnViewFinderTapCopyWithImpl<$Res>
    implements $CameraControllerOnViewFinderTapCopyWith<$Res> {
  _$CameraControllerOnViewFinderTapCopyWithImpl(this._self, this._then);

  final CameraControllerOnViewFinderTap _self;
  final $Res Function(CameraControllerOnViewFinderTap) _then;

/// Create a copy of CameraControllerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offset = null,}) {
  return _then(CameraControllerOnViewFinderTap(
null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as Offset,
  ));
}


}

/// @nodoc
mixin _$CameraControllerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraControllerState()';
}


}

/// @nodoc
class $CameraControllerStateCopyWith<$Res>  {
$CameraControllerStateCopyWith(CameraControllerState _, $Res Function(CameraControllerState) __);
}


/// @nodoc


class CameraControllerInitial implements CameraControllerState {
  const CameraControllerInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraControllerState.initial()';
}


}




/// @nodoc


class CameraControllerPreparation implements CameraControllerState {
  const CameraControllerPreparation();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerPreparation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraControllerState.preparation()';
}


}




/// @nodoc


class CameraControllerReady implements CameraControllerState {
  const CameraControllerReady();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerReady);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraControllerState.ready()';
}


}




/// @nodoc


class CameraControllerError implements CameraControllerState {
  const CameraControllerError(this.error);
  

 final  CameraErrorType error;

/// Create a copy of CameraControllerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraControllerErrorCopyWith<CameraControllerError> get copyWith => _$CameraControllerErrorCopyWithImpl<CameraControllerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CameraControllerState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $CameraControllerErrorCopyWith<$Res> implements $CameraControllerStateCopyWith<$Res> {
  factory $CameraControllerErrorCopyWith(CameraControllerError value, $Res Function(CameraControllerError) _then) = _$CameraControllerErrorCopyWithImpl;
@useResult
$Res call({
 CameraErrorType error
});




}
/// @nodoc
class _$CameraControllerErrorCopyWithImpl<$Res>
    implements $CameraControllerErrorCopyWith<$Res> {
  _$CameraControllerErrorCopyWithImpl(this._self, this._then);

  final CameraControllerError _self;
  final $Res Function(CameraControllerError) _then;

/// Create a copy of CameraControllerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CameraControllerError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as CameraErrorType,
  ));
}


}

/// @nodoc


class CameraControllerTakedPhoto implements CameraControllerState {
  const CameraControllerTakedPhoto(this.photo);
  

 final  XFile photo;

/// Create a copy of CameraControllerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraControllerTakedPhotoCopyWith<CameraControllerTakedPhoto> get copyWith => _$CameraControllerTakedPhotoCopyWithImpl<CameraControllerTakedPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraControllerTakedPhoto&&(identical(other.photo, photo) || other.photo == photo));
}


@override
int get hashCode => Object.hash(runtimeType,photo);

@override
String toString() {
  return 'CameraControllerState.takedPhoto(photo: $photo)';
}


}

/// @nodoc
abstract mixin class $CameraControllerTakedPhotoCopyWith<$Res> implements $CameraControllerStateCopyWith<$Res> {
  factory $CameraControllerTakedPhotoCopyWith(CameraControllerTakedPhoto value, $Res Function(CameraControllerTakedPhoto) _then) = _$CameraControllerTakedPhotoCopyWithImpl;
@useResult
$Res call({
 XFile photo
});




}
/// @nodoc
class _$CameraControllerTakedPhotoCopyWithImpl<$Res>
    implements $CameraControllerTakedPhotoCopyWith<$Res> {
  _$CameraControllerTakedPhotoCopyWithImpl(this._self, this._then);

  final CameraControllerTakedPhoto _self;
  final $Res Function(CameraControllerTakedPhoto) _then;

/// Create a copy of CameraControllerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? photo = null,}) {
  return _then(CameraControllerTakedPhoto(
null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as XFile,
  ));
}


}

// dart format on
