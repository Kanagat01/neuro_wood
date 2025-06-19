// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribtions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubscribtionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribtionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscribtionsState()';
}


}

/// @nodoc
class $SubscribtionsStateCopyWith<$Res>  {
$SubscribtionsStateCopyWith(SubscribtionsState _, $Res Function(SubscribtionsState) __);
}


/// @nodoc


class SubscribtionsInitial implements SubscribtionsState {
  const SubscribtionsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribtionsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscribtionsState.initial()';
}


}




/// @nodoc


class SubscribtionsLoading implements SubscribtionsState {
  const SubscribtionsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribtionsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscribtionsState.loading()';
}


}




/// @nodoc


class SubscribtionsLoaded implements SubscribtionsState {
  const SubscribtionsLoaded(final  List<TariffEntity> tariffs): _tariffs = tariffs;
  

 final  List<TariffEntity> _tariffs;
 List<TariffEntity> get tariffs {
  if (_tariffs is EqualUnmodifiableListView) return _tariffs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tariffs);
}


/// Create a copy of SubscribtionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscribtionsLoadedCopyWith<SubscribtionsLoaded> get copyWith => _$SubscribtionsLoadedCopyWithImpl<SubscribtionsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribtionsLoaded&&const DeepCollectionEquality().equals(other._tariffs, _tariffs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tariffs));

@override
String toString() {
  return 'SubscribtionsState.loaded(tariffs: $tariffs)';
}


}

/// @nodoc
abstract mixin class $SubscribtionsLoadedCopyWith<$Res> implements $SubscribtionsStateCopyWith<$Res> {
  factory $SubscribtionsLoadedCopyWith(SubscribtionsLoaded value, $Res Function(SubscribtionsLoaded) _then) = _$SubscribtionsLoadedCopyWithImpl;
@useResult
$Res call({
 List<TariffEntity> tariffs
});




}
/// @nodoc
class _$SubscribtionsLoadedCopyWithImpl<$Res>
    implements $SubscribtionsLoadedCopyWith<$Res> {
  _$SubscribtionsLoadedCopyWithImpl(this._self, this._then);

  final SubscribtionsLoaded _self;
  final $Res Function(SubscribtionsLoaded) _then;

/// Create a copy of SubscribtionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tariffs = null,}) {
  return _then(SubscribtionsLoaded(
null == tariffs ? _self._tariffs : tariffs // ignore: cast_nullable_to_non_nullable
as List<TariffEntity>,
  ));
}


}

/// @nodoc


class SubscribtionsError implements SubscribtionsState {
  const SubscribtionsError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscribtionsError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SubscribtionsState.error()';
}


}




// dart format on
