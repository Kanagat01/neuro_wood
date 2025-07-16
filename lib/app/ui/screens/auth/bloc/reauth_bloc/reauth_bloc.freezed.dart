// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reauth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReauthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReauthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReauthEvent()';
}


}

/// @nodoc
class $ReauthEventCopyWith<$Res>  {
$ReauthEventCopyWith(ReauthEvent _, $Res Function(ReauthEvent) __);
}


/// @nodoc


class ReauthStarted implements ReauthEvent {
  const ReauthStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReauthStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReauthEvent.started()';
}


}




/// @nodoc


class ReauthSendCode implements ReauthEvent {
  const ReauthSendCode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReauthSendCode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReauthEvent.sendCode()';
}


}




/// @nodoc


class ReauthResendCode implements ReauthEvent {
  const ReauthResendCode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReauthResendCode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReauthEvent.resendCode()';
}


}




/// @nodoc
mixin _$ReauthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReauthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReauthState()';
}


}

/// @nodoc
class $ReauthStateCopyWith<$Res>  {
$ReauthStateCopyWith(ReauthState _, $Res Function(ReauthState) __);
}


/// @nodoc


class ReauthInitial implements ReauthState {
  const ReauthInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReauthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReauthState.initial()';
}


}




/// @nodoc


class ReauthAwaiting implements ReauthState {
  const ReauthAwaiting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReauthAwaiting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReauthState.awaiting()';
}


}




/// @nodoc


class ReauthSending implements ReauthState {
  const ReauthSending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReauthSending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReauthState.sending()';
}


}




/// @nodoc


class ReauthInvalid implements ReauthState {
  const ReauthInvalid();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReauthInvalid);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReauthState.invalid()';
}


}




/// @nodoc


class ReauthError implements ReauthState {
  const ReauthError({required this.message, required this.ms});
  

 final  String message;
 final  int ms;

/// Create a copy of ReauthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReauthErrorCopyWith<ReauthError> get copyWith => _$ReauthErrorCopyWithImpl<ReauthError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReauthError&&(identical(other.message, message) || other.message == message)&&(identical(other.ms, ms) || other.ms == ms));
}


@override
int get hashCode => Object.hash(runtimeType,message,ms);

@override
String toString() {
  return 'ReauthState.error(message: $message, ms: $ms)';
}


}

/// @nodoc
abstract mixin class $ReauthErrorCopyWith<$Res> implements $ReauthStateCopyWith<$Res> {
  factory $ReauthErrorCopyWith(ReauthError value, $Res Function(ReauthError) _then) = _$ReauthErrorCopyWithImpl;
@useResult
$Res call({
 String message, int ms
});




}
/// @nodoc
class _$ReauthErrorCopyWithImpl<$Res>
    implements $ReauthErrorCopyWith<$Res> {
  _$ReauthErrorCopyWithImpl(this._self, this._then);

  final ReauthError _self;
  final $Res Function(ReauthError) _then;

/// Create a copy of ReauthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? ms = null,}) {
  return _then(ReauthError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,ms: null == ms ? _self.ms : ms // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ReauthSuccess implements ReauthState {
  const ReauthSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReauthSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReauthState.success()';
}


}




// dart format on
