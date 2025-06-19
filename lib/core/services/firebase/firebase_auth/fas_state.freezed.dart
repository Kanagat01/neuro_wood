// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fas_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FASState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FASState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FASState()';
}


}

/// @nodoc
class $FASStateCopyWith<$Res>  {
$FASStateCopyWith(FASState _, $Res Function(FASState) __);
}


/// @nodoc


class FAInitial implements FASState {
  const FAInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FAInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FASState.initial()';
}


}




/// @nodoc


class FAUnauthorized implements FASState {
  const FAUnauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FAUnauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FASState.unauthorized()';
}


}




/// @nodoc


class FAAuthorized implements FASState {
  const FAAuthorized({required this.user});
  

 final  User user;

/// Create a copy of FASState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FAAuthorizedCopyWith<FAAuthorized> get copyWith => _$FAAuthorizedCopyWithImpl<FAAuthorized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FAAuthorized&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'FASState.authorized(user: $user)';
}


}

/// @nodoc
abstract mixin class $FAAuthorizedCopyWith<$Res> implements $FASStateCopyWith<$Res> {
  factory $FAAuthorizedCopyWith(FAAuthorized value, $Res Function(FAAuthorized) _then) = _$FAAuthorizedCopyWithImpl;
@useResult
$Res call({
 User user
});




}
/// @nodoc
class _$FAAuthorizedCopyWithImpl<$Res>
    implements $FAAuthorizedCopyWith<$Res> {
  _$FAAuthorizedCopyWithImpl(this._self, this._then);

  final FAAuthorized _self;
  final $Res Function(FAAuthorized) _then;

/// Create a copy of FASState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(FAAuthorized(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}


}

/// @nodoc


class FAPhoneVerificationError implements FASState {
  const FAPhoneVerificationError({required this.code, this.message});
  

 final  String code;
 final  String? message;

/// Create a copy of FASState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FAPhoneVerificationErrorCopyWith<FAPhoneVerificationError> get copyWith => _$FAPhoneVerificationErrorCopyWithImpl<FAPhoneVerificationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FAPhoneVerificationError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'FASState.phoneVerificationError(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $FAPhoneVerificationErrorCopyWith<$Res> implements $FASStateCopyWith<$Res> {
  factory $FAPhoneVerificationErrorCopyWith(FAPhoneVerificationError value, $Res Function(FAPhoneVerificationError) _then) = _$FAPhoneVerificationErrorCopyWithImpl;
@useResult
$Res call({
 String code, String? message
});




}
/// @nodoc
class _$FAPhoneVerificationErrorCopyWithImpl<$Res>
    implements $FAPhoneVerificationErrorCopyWith<$Res> {
  _$FAPhoneVerificationErrorCopyWithImpl(this._self, this._then);

  final FAPhoneVerificationError _self;
  final $Res Function(FAPhoneVerificationError) _then;

/// Create a copy of FASState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = freezed,}) {
  return _then(FAPhoneVerificationError(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FAPhoneVerificationCompleted implements FASState {
  const FAPhoneVerificationCompleted({this.uid});
  

 final  String? uid;

/// Create a copy of FASState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FAPhoneVerificationCompletedCopyWith<FAPhoneVerificationCompleted> get copyWith => _$FAPhoneVerificationCompletedCopyWithImpl<FAPhoneVerificationCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FAPhoneVerificationCompleted&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode => Object.hash(runtimeType,uid);

@override
String toString() {
  return 'FASState.phoneVerificationCompleted(uid: $uid)';
}


}

/// @nodoc
abstract mixin class $FAPhoneVerificationCompletedCopyWith<$Res> implements $FASStateCopyWith<$Res> {
  factory $FAPhoneVerificationCompletedCopyWith(FAPhoneVerificationCompleted value, $Res Function(FAPhoneVerificationCompleted) _then) = _$FAPhoneVerificationCompletedCopyWithImpl;
@useResult
$Res call({
 String? uid
});




}
/// @nodoc
class _$FAPhoneVerificationCompletedCopyWithImpl<$Res>
    implements $FAPhoneVerificationCompletedCopyWith<$Res> {
  _$FAPhoneVerificationCompletedCopyWithImpl(this._self, this._then);

  final FAPhoneVerificationCompleted _self;
  final $Res Function(FAPhoneVerificationCompleted) _then;

/// Create a copy of FASState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uid = freezed,}) {
  return _then(FAPhoneVerificationCompleted(
uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FASignInError implements FASState {
  const FASignInError({required this.code, this.message});
  

 final  String code;
 final  String? message;

/// Create a copy of FASState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FASignInErrorCopyWith<FASignInError> get copyWith => _$FASignInErrorCopyWithImpl<FASignInError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FASignInError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'FASState.signInError(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $FASignInErrorCopyWith<$Res> implements $FASStateCopyWith<$Res> {
  factory $FASignInErrorCopyWith(FASignInError value, $Res Function(FASignInError) _then) = _$FASignInErrorCopyWithImpl;
@useResult
$Res call({
 String code, String? message
});




}
/// @nodoc
class _$FASignInErrorCopyWithImpl<$Res>
    implements $FASignInErrorCopyWith<$Res> {
  _$FASignInErrorCopyWithImpl(this._self, this._then);

  final FASignInError _self;
  final $Res Function(FASignInError) _then;

/// Create a copy of FASState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = freezed,}) {
  return _then(FASignInError(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FAAuthorizedWithData implements FASState {
  const FAAuthorizedWithData(this.user);
  

 final  UserEntity user;

/// Create a copy of FASState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FAAuthorizedWithDataCopyWith<FAAuthorizedWithData> get copyWith => _$FAAuthorizedWithDataCopyWithImpl<FAAuthorizedWithData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FAAuthorizedWithData&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'FASState.authorizedWithData(user: $user)';
}


}

/// @nodoc
abstract mixin class $FAAuthorizedWithDataCopyWith<$Res> implements $FASStateCopyWith<$Res> {
  factory $FAAuthorizedWithDataCopyWith(FAAuthorizedWithData value, $Res Function(FAAuthorizedWithData) _then) = _$FAAuthorizedWithDataCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});




}
/// @nodoc
class _$FAAuthorizedWithDataCopyWithImpl<$Res>
    implements $FAAuthorizedWithDataCopyWith<$Res> {
  _$FAAuthorizedWithDataCopyWithImpl(this._self, this._then);

  final FAAuthorizedWithData _self;
  final $Res Function(FAAuthorizedWithData) _then;

/// Create a copy of FASState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(FAAuthorizedWithData(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

// dart format on
