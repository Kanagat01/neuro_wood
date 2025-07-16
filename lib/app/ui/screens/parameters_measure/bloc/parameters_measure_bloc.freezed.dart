// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parameters_measure_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressState()';
}


}

/// @nodoc
class $ProgressStateCopyWith<$Res>  {
$ProgressStateCopyWith(ProgressState _, $Res Function(ProgressState) __);
}


/// @nodoc


class Started implements ProgressState {
  const Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressState.started()';
}


}




/// @nodoc


class InProgress implements ProgressState {
  const InProgress(this.sendingProgress);
  

 final  Stream<int> sendingProgress;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InProgressCopyWith<InProgress> get copyWith => _$InProgressCopyWithImpl<InProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InProgress&&(identical(other.sendingProgress, sendingProgress) || other.sendingProgress == sendingProgress));
}


@override
int get hashCode => Object.hash(runtimeType,sendingProgress);

@override
String toString() {
  return 'ProgressState.inProgress(sendingProgress: $sendingProgress)';
}


}

/// @nodoc
abstract mixin class $InProgressCopyWith<$Res> implements $ProgressStateCopyWith<$Res> {
  factory $InProgressCopyWith(InProgress value, $Res Function(InProgress) _then) = _$InProgressCopyWithImpl;
@useResult
$Res call({
 Stream<int> sendingProgress
});




}
/// @nodoc
class _$InProgressCopyWithImpl<$Res>
    implements $InProgressCopyWith<$Res> {
  _$InProgressCopyWithImpl(this._self, this._then);

  final InProgress _self;
  final $Res Function(InProgress) _then;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sendingProgress = null,}) {
  return _then(InProgress(
null == sendingProgress ? _self.sendingProgress : sendingProgress // ignore: cast_nullable_to_non_nullable
as Stream<int>,
  ));
}


}

/// @nodoc


class Success implements ProgressState {
  const Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressState.success()';
}


}




/// @nodoc


class Finish implements ProgressState {
  const Finish(this.result);
  

 final  MeasureResultEntityFinish result;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinishCopyWith<Finish> get copyWith => _$FinishCopyWithImpl<Finish>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Finish&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,result);

@override
String toString() {
  return 'ProgressState.finish(result: $result)';
}


}

/// @nodoc
abstract mixin class $FinishCopyWith<$Res> implements $ProgressStateCopyWith<$Res> {
  factory $FinishCopyWith(Finish value, $Res Function(Finish) _then) = _$FinishCopyWithImpl;
@useResult
$Res call({
 MeasureResultEntityFinish result
});




}
/// @nodoc
class _$FinishCopyWithImpl<$Res>
    implements $FinishCopyWith<$Res> {
  _$FinishCopyWithImpl(this._self, this._then);

  final Finish _self;
  final $Res Function(Finish) _then;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(Finish(
null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as MeasureResultEntityFinish,
  ));
}


}

/// @nodoc


class ProgressError implements ProgressState {
  const ProgressError(this.message);
  

 final  String message;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressErrorCopyWith<ProgressError> get copyWith => _$ProgressErrorCopyWithImpl<ProgressError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProgressState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProgressErrorCopyWith<$Res> implements $ProgressStateCopyWith<$Res> {
  factory $ProgressErrorCopyWith(ProgressError value, $Res Function(ProgressError) _then) = _$ProgressErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProgressErrorCopyWithImpl<$Res>
    implements $ProgressErrorCopyWith<$Res> {
  _$ProgressErrorCopyWithImpl(this._self, this._then);

  final ProgressError _self;
  final $Res Function(ProgressError) _then;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProgressError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ParametersMeasureEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParametersMeasureEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParametersMeasureEvent()';
}


}

/// @nodoc
class $ParametersMeasureEventCopyWith<$Res>  {
$ParametersMeasureEventCopyWith(ParametersMeasureEvent _, $Res Function(ParametersMeasureEvent) __);
}


/// @nodoc


class _Load implements ParametersMeasureEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParametersMeasureEvent.load()';
}


}




/// @nodoc


class _Apply implements ParametersMeasureEvent {
  const _Apply();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Apply);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParametersMeasureEvent.apply()';
}


}




/// @nodoc
mixin _$ParametersMeasureState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParametersMeasureState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParametersMeasureState()';
}


}

/// @nodoc
class $ParametersMeasureStateCopyWith<$Res>  {
$ParametersMeasureStateCopyWith(ParametersMeasureState _, $Res Function(ParametersMeasureState) __);
}


/// @nodoc


class ParametersMeasureInitial implements ParametersMeasureState {
  const ParametersMeasureInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParametersMeasureInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParametersMeasureState.initial()';
}


}




/// @nodoc


class ParametersMeasureLoading implements ParametersMeasureState {
  const ParametersMeasureLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParametersMeasureLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParametersMeasureState.loading()';
}


}




/// @nodoc


class ParametersMeasureLoaded implements ParametersMeasureState {
  const ParametersMeasureLoaded({required final  List<InputSelectAdapterLocation> locations, required final  List<InputSelectAdapterSortiment> sortiment, required final  List<InputSelectAdapterBread> bread, required final  List<InputSelectAdapterVehicleType> vehicleType}): _locations = locations,_sortiment = sortiment,_bread = bread,_vehicleType = vehicleType;
  

 final  List<InputSelectAdapterLocation> _locations;
 List<InputSelectAdapterLocation> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}

 final  List<InputSelectAdapterSortiment> _sortiment;
 List<InputSelectAdapterSortiment> get sortiment {
  if (_sortiment is EqualUnmodifiableListView) return _sortiment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sortiment);
}

 final  List<InputSelectAdapterBread> _bread;
 List<InputSelectAdapterBread> get bread {
  if (_bread is EqualUnmodifiableListView) return _bread;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bread);
}

 final  List<InputSelectAdapterVehicleType> _vehicleType;
 List<InputSelectAdapterVehicleType> get vehicleType {
  if (_vehicleType is EqualUnmodifiableListView) return _vehicleType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vehicleType);
}


/// Create a copy of ParametersMeasureState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParametersMeasureLoadedCopyWith<ParametersMeasureLoaded> get copyWith => _$ParametersMeasureLoadedCopyWithImpl<ParametersMeasureLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParametersMeasureLoaded&&const DeepCollectionEquality().equals(other._locations, _locations)&&const DeepCollectionEquality().equals(other._sortiment, _sortiment)&&const DeepCollectionEquality().equals(other._bread, _bread)&&const DeepCollectionEquality().equals(other._vehicleType, _vehicleType));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_locations),const DeepCollectionEquality().hash(_sortiment),const DeepCollectionEquality().hash(_bread),const DeepCollectionEquality().hash(_vehicleType));

@override
String toString() {
  return 'ParametersMeasureState.loaded(locations: $locations, sortiment: $sortiment, bread: $bread, vehicleType: $vehicleType)';
}


}

/// @nodoc
abstract mixin class $ParametersMeasureLoadedCopyWith<$Res> implements $ParametersMeasureStateCopyWith<$Res> {
  factory $ParametersMeasureLoadedCopyWith(ParametersMeasureLoaded value, $Res Function(ParametersMeasureLoaded) _then) = _$ParametersMeasureLoadedCopyWithImpl;
@useResult
$Res call({
 List<InputSelectAdapterLocation> locations, List<InputSelectAdapterSortiment> sortiment, List<InputSelectAdapterBread> bread, List<InputSelectAdapterVehicleType> vehicleType
});




}
/// @nodoc
class _$ParametersMeasureLoadedCopyWithImpl<$Res>
    implements $ParametersMeasureLoadedCopyWith<$Res> {
  _$ParametersMeasureLoadedCopyWithImpl(this._self, this._then);

  final ParametersMeasureLoaded _self;
  final $Res Function(ParametersMeasureLoaded) _then;

/// Create a copy of ParametersMeasureState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locations = null,Object? sortiment = null,Object? bread = null,Object? vehicleType = null,}) {
  return _then(ParametersMeasureLoaded(
locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<InputSelectAdapterLocation>,sortiment: null == sortiment ? _self._sortiment : sortiment // ignore: cast_nullable_to_non_nullable
as List<InputSelectAdapterSortiment>,bread: null == bread ? _self._bread : bread // ignore: cast_nullable_to_non_nullable
as List<InputSelectAdapterBread>,vehicleType: null == vehicleType ? _self._vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as List<InputSelectAdapterVehicleType>,
  ));
}


}

/// @nodoc


class ParametersMeasureErrorLoading implements ParametersMeasureState {
  const ParametersMeasureErrorLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParametersMeasureErrorLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ParametersMeasureState.error()';
}


}




// dart format on
