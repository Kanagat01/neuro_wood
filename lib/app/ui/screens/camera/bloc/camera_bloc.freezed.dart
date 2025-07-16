// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent()';
}


}

/// @nodoc
class $CameraEventCopyWith<$Res>  {
$CameraEventCopyWith(CameraEvent _, $Res Function(CameraEvent) __);
}


/// @nodoc


class InitCamera implements CameraEvent {
  const InitCamera(this.type);
  

 final  MeasureType type;

/// Create a copy of CameraEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitCameraCopyWith<InitCamera> get copyWith => _$InitCameraCopyWithImpl<InitCamera>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitCamera&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'CameraEvent.initCamera(type: $type)';
}


}

/// @nodoc
abstract mixin class $InitCameraCopyWith<$Res> implements $CameraEventCopyWith<$Res> {
  factory $InitCameraCopyWith(InitCamera value, $Res Function(InitCamera) _then) = _$InitCameraCopyWithImpl;
@useResult
$Res call({
 MeasureType type
});




}
/// @nodoc
class _$InitCameraCopyWithImpl<$Res>
    implements $InitCameraCopyWith<$Res> {
  _$InitCameraCopyWithImpl(this._self, this._then);

  final InitCamera _self;
  final $Res Function(InitCamera) _then;

/// Create a copy of CameraEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(InitCamera(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MeasureType,
  ));
}


}

/// @nodoc


class TakePhoto implements CameraEvent {
  const TakePhoto();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TakePhoto);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.takePhoto()';
}


}




/// @nodoc


class PickImage implements CameraEvent {
  const PickImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.pickImage()';
}


}




/// @nodoc


class ChangeAllowTakePhoto implements CameraEvent {
  const ChangeAllowTakePhoto([this.stream]);
  

 final  Stream<InclineMeasure>? stream;

/// Create a copy of CameraEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeAllowTakePhotoCopyWith<ChangeAllowTakePhoto> get copyWith => _$ChangeAllowTakePhotoCopyWithImpl<ChangeAllowTakePhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeAllowTakePhoto&&(identical(other.stream, stream) || other.stream == stream));
}


@override
int get hashCode => Object.hash(runtimeType,stream);

@override
String toString() {
  return 'CameraEvent.changeAllowTakePhoto(stream: $stream)';
}


}

/// @nodoc
abstract mixin class $ChangeAllowTakePhotoCopyWith<$Res> implements $CameraEventCopyWith<$Res> {
  factory $ChangeAllowTakePhotoCopyWith(ChangeAllowTakePhoto value, $Res Function(ChangeAllowTakePhoto) _then) = _$ChangeAllowTakePhotoCopyWithImpl;
@useResult
$Res call({
 Stream<InclineMeasure>? stream
});




}
/// @nodoc
class _$ChangeAllowTakePhotoCopyWithImpl<$Res>
    implements $ChangeAllowTakePhotoCopyWith<$Res> {
  _$ChangeAllowTakePhotoCopyWithImpl(this._self, this._then);

  final ChangeAllowTakePhoto _self;
  final $Res Function(ChangeAllowTakePhoto) _then;

/// Create a copy of CameraEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stream = freezed,}) {
  return _then(ChangeAllowTakePhoto(
freezed == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as Stream<InclineMeasure>?,
  ));
}


}

/// @nodoc


class CameraSend implements CameraEvent {
  const CameraSend();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraSend);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.send()';
}


}




/// @nodoc


class CameraOnViewFinderTap implements CameraEvent {
  const CameraOnViewFinderTap(this.offset);
  

 final  Offset offset;

/// Create a copy of CameraEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraOnViewFinderTapCopyWith<CameraOnViewFinderTap> get copyWith => _$CameraOnViewFinderTapCopyWithImpl<CameraOnViewFinderTap>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraOnViewFinderTap&&(identical(other.offset, offset) || other.offset == offset));
}


@override
int get hashCode => Object.hash(runtimeType,offset);

@override
String toString() {
  return 'CameraEvent.onViewFinderTap(offset: $offset)';
}


}

/// @nodoc
abstract mixin class $CameraOnViewFinderTapCopyWith<$Res> implements $CameraEventCopyWith<$Res> {
  factory $CameraOnViewFinderTapCopyWith(CameraOnViewFinderTap value, $Res Function(CameraOnViewFinderTap) _then) = _$CameraOnViewFinderTapCopyWithImpl;
@useResult
$Res call({
 Offset offset
});




}
/// @nodoc
class _$CameraOnViewFinderTapCopyWithImpl<$Res>
    implements $CameraOnViewFinderTapCopyWith<$Res> {
  _$CameraOnViewFinderTapCopyWithImpl(this._self, this._then);

  final CameraOnViewFinderTap _self;
  final $Res Function(CameraOnViewFinderTap) _then;

/// Create a copy of CameraEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offset = null,}) {
  return _then(CameraOnViewFinderTap(
null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as Offset,
  ));
}


}

/// @nodoc


class CameraEventController implements CameraEvent {
  const CameraEventController(this.ccState);
  

 final  CameraControllerState ccState;

/// Create a copy of CameraEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraEventControllerCopyWith<CameraEventController> get copyWith => _$CameraEventControllerCopyWithImpl<CameraEventController>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraEventController&&(identical(other.ccState, ccState) || other.ccState == ccState));
}


@override
int get hashCode => Object.hash(runtimeType,ccState);

@override
String toString() {
  return 'CameraEvent.cameraControllerEvent(ccState: $ccState)';
}


}

/// @nodoc
abstract mixin class $CameraEventControllerCopyWith<$Res> implements $CameraEventCopyWith<$Res> {
  factory $CameraEventControllerCopyWith(CameraEventController value, $Res Function(CameraEventController) _then) = _$CameraEventControllerCopyWithImpl;
@useResult
$Res call({
 CameraControllerState ccState
});


$CameraControllerStateCopyWith<$Res> get ccState;

}
/// @nodoc
class _$CameraEventControllerCopyWithImpl<$Res>
    implements $CameraEventControllerCopyWith<$Res> {
  _$CameraEventControllerCopyWithImpl(this._self, this._then);

  final CameraEventController _self;
  final $Res Function(CameraEventController) _then;

/// Create a copy of CameraEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ccState = null,}) {
  return _then(CameraEventController(
null == ccState ? _self.ccState : ccState // ignore: cast_nullable_to_non_nullable
as CameraControllerState,
  ));
}

/// Create a copy of CameraEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CameraControllerStateCopyWith<$Res> get ccState {
  
  return $CameraControllerStateCopyWith<$Res>(_self.ccState, (value) {
    return _then(_self.copyWith(ccState: value));
  });
}
}

/// @nodoc


class InterruptCamera implements CameraEvent {
  const InterruptCamera();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterruptCamera);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.interrupt()';
}


}




/// @nodoc


class CameraOnSettingsTap implements CameraEvent {
  const CameraOnSettingsTap();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraOnSettingsTap);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.onSettingsTap()';
}


}




/// @nodoc


class DisposeCamera implements CameraEvent {
  const DisposeCamera();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisposeCamera);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraEvent.dispose()';
}


}




/// @nodoc
mixin _$CameraState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraState()';
}


}

/// @nodoc
class $CameraStateCopyWith<$Res>  {
$CameraStateCopyWith(CameraState _, $Res Function(CameraState) __);
}


/// @nodoc


class InitializeCamera implements CameraState {
  const InitializeCamera();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitializeCamera);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraState.initialize()';
}


}




/// @nodoc


class EmptyCamera implements CameraState {
  const EmptyCamera();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyCamera);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraState.empty()';
}


}




/// @nodoc


class CameraErrorInit implements CameraState {
  const CameraErrorInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraErrorInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CameraState.errorInit()';
}


}




/// @nodoc


class CameraReady implements CameraState {
  const CameraReady([this.inclineStream]);
  

 final  Stream<InclineMeasure>? inclineStream;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraReadyCopyWith<CameraReady> get copyWith => _$CameraReadyCopyWithImpl<CameraReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraReady&&(identical(other.inclineStream, inclineStream) || other.inclineStream == inclineStream));
}


@override
int get hashCode => Object.hash(runtimeType,inclineStream);

@override
String toString() {
  return 'CameraState.ready(inclineStream: $inclineStream)';
}


}

/// @nodoc
abstract mixin class $CameraReadyCopyWith<$Res> implements $CameraStateCopyWith<$Res> {
  factory $CameraReadyCopyWith(CameraReady value, $Res Function(CameraReady) _then) = _$CameraReadyCopyWithImpl;
@useResult
$Res call({
 Stream<InclineMeasure>? inclineStream
});




}
/// @nodoc
class _$CameraReadyCopyWithImpl<$Res>
    implements $CameraReadyCopyWith<$Res> {
  _$CameraReadyCopyWithImpl(this._self, this._then);

  final CameraReady _self;
  final $Res Function(CameraReady) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inclineStream = freezed,}) {
  return _then(CameraReady(
freezed == inclineStream ? _self.inclineStream : inclineStream // ignore: cast_nullable_to_non_nullable
as Stream<InclineMeasure>?,
  ));
}


}

/// @nodoc


class CameraHasImage implements CameraState {
  const CameraHasImage(this.substate);
  

 final  HasImageSubState substate;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraHasImageCopyWith<CameraHasImage> get copyWith => _$CameraHasImageCopyWithImpl<CameraHasImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraHasImage&&(identical(other.substate, substate) || other.substate == substate));
}


@override
int get hashCode => Object.hash(runtimeType,substate);

@override
String toString() {
  return 'CameraState.hasImage(substate: $substate)';
}


}

/// @nodoc
abstract mixin class $CameraHasImageCopyWith<$Res> implements $CameraStateCopyWith<$Res> {
  factory $CameraHasImageCopyWith(CameraHasImage value, $Res Function(CameraHasImage) _then) = _$CameraHasImageCopyWithImpl;
@useResult
$Res call({
 HasImageSubState substate
});




}
/// @nodoc
class _$CameraHasImageCopyWithImpl<$Res>
    implements $CameraHasImageCopyWith<$Res> {
  _$CameraHasImageCopyWithImpl(this._self, this._then);

  final CameraHasImage _self;
  final $Res Function(CameraHasImage) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? substate = null,}) {
  return _then(CameraHasImage(
null == substate ? _self.substate : substate // ignore: cast_nullable_to_non_nullable
as HasImageSubState,
  ));
}


}

// dart format on
