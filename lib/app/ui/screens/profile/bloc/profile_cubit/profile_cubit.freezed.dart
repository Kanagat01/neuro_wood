// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// @nodoc


class ProfileInitial implements ProfileState {
  const ProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}




/// @nodoc


class ProfileHasData implements ProfileState {
  const ProfileHasData(this.user);
  

 final  UserEntity user;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileHasDataCopyWith<ProfileHasData> get copyWith => _$ProfileHasDataCopyWithImpl<ProfileHasData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileHasData&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileState.hasData(user: $user)';
}


}

/// @nodoc
abstract mixin class $ProfileHasDataCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory $ProfileHasDataCopyWith(ProfileHasData value, $Res Function(ProfileHasData) _then) = _$ProfileHasDataCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});




}
/// @nodoc
class _$ProfileHasDataCopyWithImpl<$Res>
    implements $ProfileHasDataCopyWith<$Res> {
  _$ProfileHasDataCopyWithImpl(this._self, this._then);

  final ProfileHasData _self;
  final $Res Function(ProfileHasData) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(ProfileHasData(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

/// @nodoc


class ProfileError implements ProfileState {
  const ProfileError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.error()';
}


}




// dart format on
