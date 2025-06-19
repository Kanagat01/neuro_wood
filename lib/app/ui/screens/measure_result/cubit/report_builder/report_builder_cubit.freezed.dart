// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_builder_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportBuilderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportBuilderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReportBuilderState()';
}


}

/// @nodoc
class $ReportBuilderStateCopyWith<$Res>  {
$ReportBuilderStateCopyWith(ReportBuilderState _, $Res Function(ReportBuilderState) __);
}


/// @nodoc


class ReportBuilderInitial implements ReportBuilderState {
  const ReportBuilderInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportBuilderInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReportBuilderState.initial()';
}


}




/// @nodoc


class ReportBuilderLoading implements ReportBuilderState {
  const ReportBuilderLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportBuilderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReportBuilderState.loading()';
}


}




/// @nodoc


class ReportBuilderLoaded implements ReportBuilderState {
  const ReportBuilderLoaded(this.report);
  

 final  File report;

/// Create a copy of ReportBuilderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportBuilderLoadedCopyWith<ReportBuilderLoaded> get copyWith => _$ReportBuilderLoadedCopyWithImpl<ReportBuilderLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportBuilderLoaded&&(identical(other.report, report) || other.report == report));
}


@override
int get hashCode => Object.hash(runtimeType,report);

@override
String toString() {
  return 'ReportBuilderState.loaded(report: $report)';
}


}

/// @nodoc
abstract mixin class $ReportBuilderLoadedCopyWith<$Res> implements $ReportBuilderStateCopyWith<$Res> {
  factory $ReportBuilderLoadedCopyWith(ReportBuilderLoaded value, $Res Function(ReportBuilderLoaded) _then) = _$ReportBuilderLoadedCopyWithImpl;
@useResult
$Res call({
 File report
});




}
/// @nodoc
class _$ReportBuilderLoadedCopyWithImpl<$Res>
    implements $ReportBuilderLoadedCopyWith<$Res> {
  _$ReportBuilderLoadedCopyWithImpl(this._self, this._then);

  final ReportBuilderLoaded _self;
  final $Res Function(ReportBuilderLoaded) _then;

/// Create a copy of ReportBuilderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? report = null,}) {
  return _then(ReportBuilderLoaded(
null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc


class ReportBuilderError implements ReportBuilderState {
  const ReportBuilderError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportBuilderError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReportBuilderState.error()';
}


}




// dart format on
