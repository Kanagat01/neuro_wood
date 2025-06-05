// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reauth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReauthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() sendCode,
    required TResult Function() resendCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? sendCode,
    TResult? Function()? resendCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? sendCode,
    TResult Function()? resendCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ResendCode value) resendCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReauthEventCopyWith<$Res> {
  factory $ReauthEventCopyWith(
          ReauthEvent value, $Res Function(ReauthEvent) then) =
      _$ReauthEventCopyWithImpl<$Res, ReauthEvent>;
}

/// @nodoc
class _$ReauthEventCopyWithImpl<$Res, $Val extends ReauthEvent>
    implements $ReauthEventCopyWith<$Res> {
  _$ReauthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$ReauthEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'ReauthEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() sendCode,
    required TResult Function() resendCode,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? sendCode,
    TResult? Function()? resendCode,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? sendCode,
    TResult Function()? resendCode,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ResendCode value) resendCode,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ReauthEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_SendCodeCopyWith<$Res> {
  factory _$$_SendCodeCopyWith(
          _$_SendCode value, $Res Function(_$_SendCode) then) =
      __$$_SendCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendCodeCopyWithImpl<$Res>
    extends _$ReauthEventCopyWithImpl<$Res, _$_SendCode>
    implements _$$_SendCodeCopyWith<$Res> {
  __$$_SendCodeCopyWithImpl(
      _$_SendCode _value, $Res Function(_$_SendCode) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SendCode implements _SendCode {
  const _$_SendCode();

  @override
  String toString() {
    return 'ReauthEvent.sendCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SendCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() sendCode,
    required TResult Function() resendCode,
  }) {
    return sendCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? sendCode,
    TResult? Function()? resendCode,
  }) {
    return sendCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? sendCode,
    TResult Function()? resendCode,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ResendCode value) resendCode,
  }) {
    return sendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
  }) {
    return sendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(this);
    }
    return orElse();
  }
}

abstract class _SendCode implements ReauthEvent {
  const factory _SendCode() = _$_SendCode;
}

/// @nodoc
abstract class _$$_ResendCodeCopyWith<$Res> {
  factory _$$_ResendCodeCopyWith(
          _$_ResendCode value, $Res Function(_$_ResendCode) then) =
      __$$_ResendCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResendCodeCopyWithImpl<$Res>
    extends _$ReauthEventCopyWithImpl<$Res, _$_ResendCode>
    implements _$$_ResendCodeCopyWith<$Res> {
  __$$_ResendCodeCopyWithImpl(
      _$_ResendCode _value, $Res Function(_$_ResendCode) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ResendCode implements _ResendCode {
  const _$_ResendCode();

  @override
  String toString() {
    return 'ReauthEvent.resendCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResendCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() sendCode,
    required TResult Function() resendCode,
  }) {
    return resendCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? sendCode,
    TResult? Function()? resendCode,
  }) {
    return resendCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? sendCode,
    TResult Function()? resendCode,
    required TResult orElse(),
  }) {
    if (resendCode != null) {
      return resendCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_ResendCode value) resendCode,
  }) {
    return resendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_ResendCode value)? resendCode,
  }) {
    return resendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_ResendCode value)? resendCode,
    required TResult orElse(),
  }) {
    if (resendCode != null) {
      return resendCode(this);
    }
    return orElse();
  }
}

abstract class _ResendCode implements ReauthEvent {
  const factory _ResendCode() = _$_ResendCode;
}

/// @nodoc
mixin _$ReauthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() awaiting,
    required TResult Function() sending,
    required TResult Function() invalid,
    required TResult Function(String message, int ms) error,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? awaiting,
    TResult? Function()? sending,
    TResult? Function()? invalid,
    TResult? Function(String message, int ms)? error,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? awaiting,
    TResult Function()? sending,
    TResult Function()? invalid,
    TResult Function(String message, int ms)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Awaiting value) awaiting,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Awaiting value)? awaiting,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Awaiting value)? awaiting,
    TResult Function(_Sending value)? sending,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReauthStateCopyWith<$Res> {
  factory $ReauthStateCopyWith(
          ReauthState value, $Res Function(ReauthState) then) =
      _$ReauthStateCopyWithImpl<$Res, ReauthState>;
}

/// @nodoc
class _$ReauthStateCopyWithImpl<$Res, $Val extends ReauthState>
    implements $ReauthStateCopyWith<$Res> {
  _$ReauthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ReauthStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ReauthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() awaiting,
    required TResult Function() sending,
    required TResult Function() invalid,
    required TResult Function(String message, int ms) error,
    required TResult Function() success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? awaiting,
    TResult? Function()? sending,
    TResult? Function()? invalid,
    TResult? Function(String message, int ms)? error,
    TResult? Function()? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? awaiting,
    TResult Function()? sending,
    TResult Function()? invalid,
    TResult Function(String message, int ms)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Awaiting value) awaiting,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Awaiting value)? awaiting,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Awaiting value)? awaiting,
    TResult Function(_Sending value)? sending,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReauthState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_AwaitingCopyWith<$Res> {
  factory _$$_AwaitingCopyWith(
          _$_Awaiting value, $Res Function(_$_Awaiting) then) =
      __$$_AwaitingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AwaitingCopyWithImpl<$Res>
    extends _$ReauthStateCopyWithImpl<$Res, _$_Awaiting>
    implements _$$_AwaitingCopyWith<$Res> {
  __$$_AwaitingCopyWithImpl(
      _$_Awaiting _value, $Res Function(_$_Awaiting) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Awaiting implements _Awaiting {
  const _$_Awaiting();

  @override
  String toString() {
    return 'ReauthState.awaiting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Awaiting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() awaiting,
    required TResult Function() sending,
    required TResult Function() invalid,
    required TResult Function(String message, int ms) error,
    required TResult Function() success,
  }) {
    return awaiting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? awaiting,
    TResult? Function()? sending,
    TResult? Function()? invalid,
    TResult? Function(String message, int ms)? error,
    TResult? Function()? success,
  }) {
    return awaiting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? awaiting,
    TResult Function()? sending,
    TResult Function()? invalid,
    TResult Function(String message, int ms)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (awaiting != null) {
      return awaiting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Awaiting value) awaiting,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return awaiting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Awaiting value)? awaiting,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return awaiting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Awaiting value)? awaiting,
    TResult Function(_Sending value)? sending,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (awaiting != null) {
      return awaiting(this);
    }
    return orElse();
  }
}

abstract class _Awaiting implements ReauthState {
  const factory _Awaiting() = _$_Awaiting;
}

/// @nodoc
abstract class _$$_SendingCopyWith<$Res> {
  factory _$$_SendingCopyWith(
          _$_Sending value, $Res Function(_$_Sending) then) =
      __$$_SendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendingCopyWithImpl<$Res>
    extends _$ReauthStateCopyWithImpl<$Res, _$_Sending>
    implements _$$_SendingCopyWith<$Res> {
  __$$_SendingCopyWithImpl(_$_Sending _value, $Res Function(_$_Sending) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Sending implements _Sending {
  const _$_Sending();

  @override
  String toString() {
    return 'ReauthState.sending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Sending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() awaiting,
    required TResult Function() sending,
    required TResult Function() invalid,
    required TResult Function(String message, int ms) error,
    required TResult Function() success,
  }) {
    return sending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? awaiting,
    TResult? Function()? sending,
    TResult? Function()? invalid,
    TResult? Function(String message, int ms)? error,
    TResult? Function()? success,
  }) {
    return sending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? awaiting,
    TResult Function()? sending,
    TResult Function()? invalid,
    TResult Function(String message, int ms)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Awaiting value) awaiting,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return sending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Awaiting value)? awaiting,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return sending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Awaiting value)? awaiting,
    TResult Function(_Sending value)? sending,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(this);
    }
    return orElse();
  }
}

abstract class _Sending implements ReauthState {
  const factory _Sending() = _$_Sending;
}

/// @nodoc
abstract class _$$_InvalidCopyWith<$Res> {
  factory _$$_InvalidCopyWith(
          _$_Invalid value, $Res Function(_$_Invalid) then) =
      __$$_InvalidCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InvalidCopyWithImpl<$Res>
    extends _$ReauthStateCopyWithImpl<$Res, _$_Invalid>
    implements _$$_InvalidCopyWith<$Res> {
  __$$_InvalidCopyWithImpl(_$_Invalid _value, $Res Function(_$_Invalid) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Invalid implements _Invalid {
  const _$_Invalid();

  @override
  String toString() {
    return 'ReauthState.invalid()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Invalid);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() awaiting,
    required TResult Function() sending,
    required TResult Function() invalid,
    required TResult Function(String message, int ms) error,
    required TResult Function() success,
  }) {
    return invalid();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? awaiting,
    TResult? Function()? sending,
    TResult? Function()? invalid,
    TResult? Function(String message, int ms)? error,
    TResult? Function()? success,
  }) {
    return invalid?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? awaiting,
    TResult Function()? sending,
    TResult Function()? invalid,
    TResult Function(String message, int ms)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Awaiting value) awaiting,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return invalid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Awaiting value)? awaiting,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return invalid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Awaiting value)? awaiting,
    TResult Function(_Sending value)? sending,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (invalid != null) {
      return invalid(this);
    }
    return orElse();
  }
}

abstract class _Invalid implements ReauthState {
  const factory _Invalid() = _$_Invalid;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, int ms});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$ReauthStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? ms = null,
  }) {
    return _then(_$_Error(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      ms: null == ms
          ? _value.ms
          : ms // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.message, required this.ms});

  @override
  final String message;
  @override
  final int ms;

  @override
  String toString() {
    return 'ReauthState.error(message: $message, ms: $ms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.ms, ms) || other.ms == ms));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, ms);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() awaiting,
    required TResult Function() sending,
    required TResult Function() invalid,
    required TResult Function(String message, int ms) error,
    required TResult Function() success,
  }) {
    return error(message, ms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? awaiting,
    TResult? Function()? sending,
    TResult? Function()? invalid,
    TResult? Function(String message, int ms)? error,
    TResult? Function()? success,
  }) {
    return error?.call(message, ms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? awaiting,
    TResult Function()? sending,
    TResult Function()? invalid,
    TResult Function(String message, int ms)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, ms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Awaiting value) awaiting,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Awaiting value)? awaiting,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Awaiting value)? awaiting,
    TResult Function(_Sending value)? sending,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ReauthState {
  const factory _Error({required final String message, required final int ms}) =
      _$_Error;

  String get message;
  int get ms;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$ReauthStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success();

  @override
  String toString() {
    return 'ReauthState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() awaiting,
    required TResult Function() sending,
    required TResult Function() invalid,
    required TResult Function(String message, int ms) error,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? awaiting,
    TResult? Function()? sending,
    TResult? Function()? invalid,
    TResult? Function(String message, int ms)? error,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? awaiting,
    TResult Function()? sending,
    TResult Function()? invalid,
    TResult Function(String message, int ms)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Awaiting value) awaiting,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Invalid value) invalid,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Awaiting value)? awaiting,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Invalid value)? invalid,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Awaiting value)? awaiting,
    TResult Function(_Sending value)? sending,
    TResult Function(_Invalid value)? invalid,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ReauthState {
  const factory _Success() = _$_Success;
}
