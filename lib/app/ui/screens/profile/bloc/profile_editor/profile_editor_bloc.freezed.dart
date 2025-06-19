// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEditorEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditorEvent()';
}


}

/// @nodoc
class $ProfileEditorEventCopyWith<$Res>  {
$ProfileEditorEventCopyWith(ProfileEditorEvent _, $Res Function(ProfileEditorEvent) __);
}


/// @nodoc


class _Save implements ProfileEditorEvent {
  const _Save();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Save);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditorEvent.save()';
}


}




/// @nodoc
mixin _$ProfileEditorState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditorState()';
}


}

/// @nodoc
class $ProfileEditorStateCopyWith<$Res>  {
$ProfileEditorStateCopyWith(ProfileEditorState _, $Res Function(ProfileEditorState) __);
}


/// @nodoc


class ProfileEditorInitial implements ProfileEditorState {
  const ProfileEditorInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditorInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditorState.initial()';
}


}




/// @nodoc


class ProfileEditorSending implements ProfileEditorState {
  const ProfileEditorSending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditorSending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditorState.sending()';
}


}




/// @nodoc


class ProfileEditorError implements ProfileEditorState {
  const ProfileEditorError({required this.e});
  

 final  String e;

/// Create a copy of ProfileEditorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEditorErrorCopyWith<ProfileEditorError> get copyWith => _$ProfileEditorErrorCopyWithImpl<ProfileEditorError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditorError&&(identical(other.e, e) || other.e == e));
}


@override
int get hashCode => Object.hash(runtimeType,e);

@override
String toString() {
  return 'ProfileEditorState.error(e: $e)';
}


}

/// @nodoc
abstract mixin class $ProfileEditorErrorCopyWith<$Res> implements $ProfileEditorStateCopyWith<$Res> {
  factory $ProfileEditorErrorCopyWith(ProfileEditorError value, $Res Function(ProfileEditorError) _then) = _$ProfileEditorErrorCopyWithImpl;
@useResult
$Res call({
 String e
});




}
/// @nodoc
class _$ProfileEditorErrorCopyWithImpl<$Res>
    implements $ProfileEditorErrorCopyWith<$Res> {
  _$ProfileEditorErrorCopyWithImpl(this._self, this._then);

  final ProfileEditorError _self;
  final $Res Function(ProfileEditorError) _then;

/// Create a copy of ProfileEditorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? e = null,}) {
  return _then(ProfileEditorError(
e: null == e ? _self.e : e // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProfileEditorSuccess implements ProfileEditorState {
  const ProfileEditorSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditorSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditorState.sucess()';
}


}




// dart format on
