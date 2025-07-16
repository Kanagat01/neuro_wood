// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// @nodoc


class AuthSendPhone with DiagnosticableTreeMixin implements AuthEvent {
  const AuthSendPhone();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.sendPhone'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSendPhone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.sendPhone()';
}


}




/// @nodoc


class AuthSendCode with DiagnosticableTreeMixin implements AuthEvent {
  const AuthSendCode();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.sendCode'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSendCode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.sendCode()';
}


}




/// @nodoc


class AuthResendCode with DiagnosticableTreeMixin implements AuthEvent {
  const AuthResendCode();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.resendCode'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResendCode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.resendCode()';
}


}




/// @nodoc


class AuthBack with DiagnosticableTreeMixin implements AuthEvent {
  const AuthBack();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.back'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthBack);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.back()';
}


}




/// @nodoc


class AuthFirebaseEvent with DiagnosticableTreeMixin implements AuthEvent {
  const AuthFirebaseEvent(this.state);
  

 final  FASState state;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFirebaseEventCopyWith<AuthFirebaseEvent> get copyWith => _$AuthFirebaseEventCopyWithImpl<AuthFirebaseEvent>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.firebaseEvent'))
    ..add(DiagnosticsProperty('state', state));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFirebaseEvent&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.firebaseEvent(state: $state)';
}


}

/// @nodoc
abstract mixin class $AuthFirebaseEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthFirebaseEventCopyWith(AuthFirebaseEvent value, $Res Function(AuthFirebaseEvent) _then) = _$AuthFirebaseEventCopyWithImpl;
@useResult
$Res call({
 FASState state
});


$FASStateCopyWith<$Res> get state;

}
/// @nodoc
class _$AuthFirebaseEventCopyWithImpl<$Res>
    implements $AuthFirebaseEventCopyWith<$Res> {
  _$AuthFirebaseEventCopyWithImpl(this._self, this._then);

  final AuthFirebaseEvent _self;
  final $Res Function(AuthFirebaseEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(AuthFirebaseEvent(
null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as FASState,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FASStateCopyWith<$Res> get state {
  
  return $FASStateCopyWith<$Res>(_self.state, (value) {
    return _then(_self.copyWith(state: value));
  });
}
}

/// @nodoc


class AuthEnableValidatePhone with DiagnosticableTreeMixin implements AuthEvent {
  const AuthEnableValidatePhone();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.enableValidatePhone'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEnableValidatePhone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.enableValidatePhone()';
}


}




/// @nodoc


class AuthChangeEnableBtn with DiagnosticableTreeMixin implements AuthEvent {
  const AuthChangeEnableBtn(this.enableNextBtn);
  

 final  bool enableNextBtn;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthChangeEnableBtnCopyWith<AuthChangeEnableBtn> get copyWith => _$AuthChangeEnableBtnCopyWithImpl<AuthChangeEnableBtn>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.changeEnableBtn'))
    ..add(DiagnosticsProperty('enableNextBtn', enableNextBtn));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthChangeEnableBtn&&(identical(other.enableNextBtn, enableNextBtn) || other.enableNextBtn == enableNextBtn));
}


@override
int get hashCode => Object.hash(runtimeType,enableNextBtn);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.changeEnableBtn(enableNextBtn: $enableNextBtn)';
}


}

/// @nodoc
abstract mixin class $AuthChangeEnableBtnCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthChangeEnableBtnCopyWith(AuthChangeEnableBtn value, $Res Function(AuthChangeEnableBtn) _then) = _$AuthChangeEnableBtnCopyWithImpl;
@useResult
$Res call({
 bool enableNextBtn
});




}
/// @nodoc
class _$AuthChangeEnableBtnCopyWithImpl<$Res>
    implements $AuthChangeEnableBtnCopyWith<$Res> {
  _$AuthChangeEnableBtnCopyWithImpl(this._self, this._then);

  final AuthChangeEnableBtn _self;
  final $Res Function(AuthChangeEnableBtn) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? enableNextBtn = null,}) {
  return _then(AuthChangeEnableBtn(
null == enableNextBtn ? _self.enableNextBtn : enableNextBtn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class AuthLogout with DiagnosticableTreeMixin implements AuthEvent {
  const AuthLogout();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.logout'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.logout()';
}


}




/// @nodoc
mixin _$AuthState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// @nodoc


class AuthInitialState with DiagnosticableTreeMixin implements AuthState {
  const AuthInitialState();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthInputPhone with DiagnosticableTreeMixin implements AuthState {
  const AuthInputPhone({required this.substate, required this.validateForm, required this.enableNextBtn});
  

 final  AuthSubstate substate;
 final  bool validateForm;
 final  bool enableNextBtn;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthInputPhoneCopyWith<AuthInputPhone> get copyWith => _$AuthInputPhoneCopyWithImpl<AuthInputPhone>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.inputPhone'))
    ..add(DiagnosticsProperty('substate', substate))..add(DiagnosticsProperty('validateForm', validateForm))..add(DiagnosticsProperty('enableNextBtn', enableNextBtn));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInputPhone&&(identical(other.substate, substate) || other.substate == substate)&&(identical(other.validateForm, validateForm) || other.validateForm == validateForm)&&(identical(other.enableNextBtn, enableNextBtn) || other.enableNextBtn == enableNextBtn));
}


@override
int get hashCode => Object.hash(runtimeType,substate,validateForm,enableNextBtn);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.inputPhone(substate: $substate, validateForm: $validateForm, enableNextBtn: $enableNextBtn)';
}


}

/// @nodoc
abstract mixin class $AuthInputPhoneCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthInputPhoneCopyWith(AuthInputPhone value, $Res Function(AuthInputPhone) _then) = _$AuthInputPhoneCopyWithImpl;
@useResult
$Res call({
 AuthSubstate substate, bool validateForm, bool enableNextBtn
});


$AuthSubstateCopyWith<$Res> get substate;

}
/// @nodoc
class _$AuthInputPhoneCopyWithImpl<$Res>
    implements $AuthInputPhoneCopyWith<$Res> {
  _$AuthInputPhoneCopyWithImpl(this._self, this._then);

  final AuthInputPhone _self;
  final $Res Function(AuthInputPhone) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? substate = null,Object? validateForm = null,Object? enableNextBtn = null,}) {
  return _then(AuthInputPhone(
substate: null == substate ? _self.substate : substate // ignore: cast_nullable_to_non_nullable
as AuthSubstate,validateForm: null == validateForm ? _self.validateForm : validateForm // ignore: cast_nullable_to_non_nullable
as bool,enableNextBtn: null == enableNextBtn ? _self.enableNextBtn : enableNextBtn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthSubstateCopyWith<$Res> get substate {
  
  return $AuthSubstateCopyWith<$Res>(_self.substate, (value) {
    return _then(_self.copyWith(substate: value));
  });
}
}

/// @nodoc


class AuthInputCode with DiagnosticableTreeMixin implements AuthState {
  const AuthInputCode(this.substate);
  

 final  AuthSubstate substate;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthInputCodeCopyWith<AuthInputCode> get copyWith => _$AuthInputCodeCopyWithImpl<AuthInputCode>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.inputCode'))
    ..add(DiagnosticsProperty('substate', substate));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInputCode&&(identical(other.substate, substate) || other.substate == substate));
}


@override
int get hashCode => Object.hash(runtimeType,substate);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.inputCode(substate: $substate)';
}


}

/// @nodoc
abstract mixin class $AuthInputCodeCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthInputCodeCopyWith(AuthInputCode value, $Res Function(AuthInputCode) _then) = _$AuthInputCodeCopyWithImpl;
@useResult
$Res call({
 AuthSubstate substate
});


$AuthSubstateCopyWith<$Res> get substate;

}
/// @nodoc
class _$AuthInputCodeCopyWithImpl<$Res>
    implements $AuthInputCodeCopyWith<$Res> {
  _$AuthInputCodeCopyWithImpl(this._self, this._then);

  final AuthInputCode _self;
  final $Res Function(AuthInputCode) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? substate = null,}) {
  return _then(AuthInputCode(
null == substate ? _self.substate : substate // ignore: cast_nullable_to_non_nullable
as AuthSubstate,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthSubstateCopyWith<$Res> get substate {
  
  return $AuthSubstateCopyWith<$Res>(_self.substate, (value) {
    return _then(_self.copyWith(substate: value));
  });
}
}

/// @nodoc


class SuccessAuth with DiagnosticableTreeMixin implements AuthState {
  const SuccessAuth();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.successAuth'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.successAuth()';
}


}




/// @nodoc


class SuccessRegister with DiagnosticableTreeMixin implements AuthState {
  const SuccessRegister();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthState.successRegister'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessRegister);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthState.successRegister()';
}


}




/// @nodoc
mixin _$AuthSubstate implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthSubstate'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSubstate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthSubstate()';
}


}

/// @nodoc
class $AuthSubstateCopyWith<$Res>  {
$AuthSubstateCopyWith(AuthSubstate _, $Res Function(AuthSubstate) __);
}


/// @nodoc


class AuthSubInitial with DiagnosticableTreeMixin implements AuthSubstate {
  const AuthSubInitial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthSubstate.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSubInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthSubstate.initial()';
}


}




/// @nodoc


class AuthSubInvalid with DiagnosticableTreeMixin implements AuthSubstate {
  const AuthSubInvalid();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthSubstate.invalid'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSubInvalid);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthSubstate.invalid()';
}


}




/// @nodoc


class AuthSubSending with DiagnosticableTreeMixin implements AuthSubstate {
  const AuthSubSending();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthSubstate.sending'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSubSending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthSubstate.sending()';
}


}




/// @nodoc


class AuthSubError with DiagnosticableTreeMixin implements AuthSubstate {
  const AuthSubError({required this.message, required this.ms});
  

 final  String message;
 final  int ms;

/// Create a copy of AuthSubstate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSubErrorCopyWith<AuthSubError> get copyWith => _$AuthSubErrorCopyWithImpl<AuthSubError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthSubstate.error'))
    ..add(DiagnosticsProperty('message', message))..add(DiagnosticsProperty('ms', ms));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSubError&&(identical(other.message, message) || other.message == message)&&(identical(other.ms, ms) || other.ms == ms));
}


@override
int get hashCode => Object.hash(runtimeType,message,ms);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthSubstate.error(message: $message, ms: $ms)';
}


}

/// @nodoc
abstract mixin class $AuthSubErrorCopyWith<$Res> implements $AuthSubstateCopyWith<$Res> {
  factory $AuthSubErrorCopyWith(AuthSubError value, $Res Function(AuthSubError) _then) = _$AuthSubErrorCopyWithImpl;
@useResult
$Res call({
 String message, int ms
});




}
/// @nodoc
class _$AuthSubErrorCopyWithImpl<$Res>
    implements $AuthSubErrorCopyWith<$Res> {
  _$AuthSubErrorCopyWithImpl(this._self, this._then);

  final AuthSubError _self;
  final $Res Function(AuthSubError) _then;

/// Create a copy of AuthSubstate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? ms = null,}) {
  return _then(AuthSubError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,ms: null == ms ? _self.ms : ms // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
