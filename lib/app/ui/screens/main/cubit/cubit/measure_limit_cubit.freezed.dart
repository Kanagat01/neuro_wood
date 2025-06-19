// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measure_limit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MeasureLimitState {

 int get totalCount; int get leftCount; bool get showBlock; bool get isFree;
/// Create a copy of MeasureLimitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeasureLimitStateCopyWith<MeasureLimitState> get copyWith => _$MeasureLimitStateCopyWithImpl<MeasureLimitState>(this as MeasureLimitState, _$identity);

  /// Serializes this MeasureLimitState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasureLimitState&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.leftCount, leftCount) || other.leftCount == leftCount)&&(identical(other.showBlock, showBlock) || other.showBlock == showBlock)&&(identical(other.isFree, isFree) || other.isFree == isFree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCount,leftCount,showBlock,isFree);

@override
String toString() {
  return 'MeasureLimitState(totalCount: $totalCount, leftCount: $leftCount, showBlock: $showBlock, isFree: $isFree)';
}


}

/// @nodoc
abstract mixin class $MeasureLimitStateCopyWith<$Res>  {
  factory $MeasureLimitStateCopyWith(MeasureLimitState value, $Res Function(MeasureLimitState) _then) = _$MeasureLimitStateCopyWithImpl;
@useResult
$Res call({
 int totalCount, int leftCount, bool showBlock, bool isFree
});




}
/// @nodoc
class _$MeasureLimitStateCopyWithImpl<$Res>
    implements $MeasureLimitStateCopyWith<$Res> {
  _$MeasureLimitStateCopyWithImpl(this._self, this._then);

  final MeasureLimitState _self;
  final $Res Function(MeasureLimitState) _then;

/// Create a copy of MeasureLimitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalCount = null,Object? leftCount = null,Object? showBlock = null,Object? isFree = null,}) {
  return _then(_self.copyWith(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,leftCount: null == leftCount ? _self.leftCount : leftCount // ignore: cast_nullable_to_non_nullable
as int,showBlock: null == showBlock ? _self.showBlock : showBlock // ignore: cast_nullable_to_non_nullable
as bool,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MeasureLimitState implements MeasureLimitState {
  const _MeasureLimitState({required this.totalCount, required this.leftCount, required this.showBlock, required this.isFree});
  factory _MeasureLimitState.fromJson(Map<String, dynamic> json) => _$MeasureLimitStateFromJson(json);

@override final  int totalCount;
@override final  int leftCount;
@override final  bool showBlock;
@override final  bool isFree;

/// Create a copy of MeasureLimitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeasureLimitStateCopyWith<_MeasureLimitState> get copyWith => __$MeasureLimitStateCopyWithImpl<_MeasureLimitState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeasureLimitStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeasureLimitState&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.leftCount, leftCount) || other.leftCount == leftCount)&&(identical(other.showBlock, showBlock) || other.showBlock == showBlock)&&(identical(other.isFree, isFree) || other.isFree == isFree));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCount,leftCount,showBlock,isFree);

@override
String toString() {
  return 'MeasureLimitState(totalCount: $totalCount, leftCount: $leftCount, showBlock: $showBlock, isFree: $isFree)';
}


}

/// @nodoc
abstract mixin class _$MeasureLimitStateCopyWith<$Res> implements $MeasureLimitStateCopyWith<$Res> {
  factory _$MeasureLimitStateCopyWith(_MeasureLimitState value, $Res Function(_MeasureLimitState) _then) = __$MeasureLimitStateCopyWithImpl;
@override @useResult
$Res call({
 int totalCount, int leftCount, bool showBlock, bool isFree
});




}
/// @nodoc
class __$MeasureLimitStateCopyWithImpl<$Res>
    implements _$MeasureLimitStateCopyWith<$Res> {
  __$MeasureLimitStateCopyWithImpl(this._self, this._then);

  final _MeasureLimitState _self;
  final $Res Function(_MeasureLimitState) _then;

/// Create a copy of MeasureLimitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalCount = null,Object? leftCount = null,Object? showBlock = null,Object? isFree = null,}) {
  return _then(_MeasureLimitState(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,leftCount: null == leftCount ? _self.leftCount : leftCount // ignore: cast_nullable_to_non_nullable
as int,showBlock: null == showBlock ? _self.showBlock : showBlock // ignore: cast_nullable_to_non_nullable
as bool,isFree: null == isFree ? _self.isFree : isFree // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
