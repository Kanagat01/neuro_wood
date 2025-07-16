// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurements_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeasurementsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementsState()';
}


}

/// @nodoc
class $MeasurementsStateCopyWith<$Res>  {
$MeasurementsStateCopyWith(MeasurementsState _, $Res Function(MeasurementsState) __);
}


/// @nodoc


class MeasurementsInitial implements MeasurementsState {
  const MeasurementsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementsState.initial()';
}


}




/// @nodoc


class MeasurementsLoaded implements MeasurementsState {
  const MeasurementsLoaded(final  Map<DateTime, List<MeasureResultEntityBase>> list): _list = list;
  

 final  Map<DateTime, List<MeasureResultEntityBase>> _list;
 Map<DateTime, List<MeasureResultEntityBase>> get list {
  if (_list is EqualUnmodifiableMapView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_list);
}


/// Create a copy of MeasurementsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeasurementsLoadedCopyWith<MeasurementsLoaded> get copyWith => _$MeasurementsLoadedCopyWithImpl<MeasurementsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementsLoaded&&const DeepCollectionEquality().equals(other._list, _list));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'MeasurementsState.loaded(list: $list)';
}


}

/// @nodoc
abstract mixin class $MeasurementsLoadedCopyWith<$Res> implements $MeasurementsStateCopyWith<$Res> {
  factory $MeasurementsLoadedCopyWith(MeasurementsLoaded value, $Res Function(MeasurementsLoaded) _then) = _$MeasurementsLoadedCopyWithImpl;
@useResult
$Res call({
 Map<DateTime, List<MeasureResultEntityBase>> list
});




}
/// @nodoc
class _$MeasurementsLoadedCopyWithImpl<$Res>
    implements $MeasurementsLoadedCopyWith<$Res> {
  _$MeasurementsLoadedCopyWithImpl(this._self, this._then);

  final MeasurementsLoaded _self;
  final $Res Function(MeasurementsLoaded) _then;

/// Create a copy of MeasurementsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(MeasurementsLoaded(
null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as Map<DateTime, List<MeasureResultEntityBase>>,
  ));
}


}

/// @nodoc


class MeasurementsLoading implements MeasurementsState {
  const MeasurementsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementsState.loading()';
}


}




/// @nodoc


class MeasurementsEmpty implements MeasurementsState {
  const MeasurementsEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementsEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MeasurementsState.empty()';
}


}




// dart format on
