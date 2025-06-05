// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() send,
    required TResult Function() changeAgree,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? send,
    TResult? Function()? changeAgree,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? send,
    TResult Function()? changeAgree,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Send value) send,
    required TResult Function(_ChangeAgree value) changeAgree,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Send value)? send,
    TResult? Function(_ChangeAgree value)? changeAgree,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Send value)? send,
    TResult Function(_ChangeAgree value)? changeAgree,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SendCopyWith<$Res> {
  factory _$$_SendCopyWith(_$_Send value, $Res Function(_$_Send) then) =
      __$$_SendCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_Send>
    implements _$$_SendCopyWith<$Res> {
  __$$_SendCopyWithImpl(_$_Send _value, $Res Function(_$_Send) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Send implements _Send {
  const _$_Send();

  @override
  String toString() {
    return 'RegisterEvent.send()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Send);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() send,
    required TResult Function() changeAgree,
  }) {
    return send();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? send,
    TResult? Function()? changeAgree,
  }) {
    return send?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? send,
    TResult Function()? changeAgree,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Send value) send,
    required TResult Function(_ChangeAgree value) changeAgree,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Send value)? send,
    TResult? Function(_ChangeAgree value)? changeAgree,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Send value)? send,
    TResult Function(_ChangeAgree value)? changeAgree,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements RegisterEvent {
  const factory _Send() = _$_Send;
}

/// @nodoc
abstract class _$$_ChangeAgreeCopyWith<$Res> {
  factory _$$_ChangeAgreeCopyWith(
          _$_ChangeAgree value, $Res Function(_$_ChangeAgree) then) =
      __$$_ChangeAgreeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ChangeAgreeCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_ChangeAgree>
    implements _$$_ChangeAgreeCopyWith<$Res> {
  __$$_ChangeAgreeCopyWithImpl(
      _$_ChangeAgree _value, $Res Function(_$_ChangeAgree) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ChangeAgree implements _ChangeAgree {
  const _$_ChangeAgree();

  @override
  String toString() {
    return 'RegisterEvent.changeAgree()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ChangeAgree);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() send,
    required TResult Function() changeAgree,
  }) {
    return changeAgree();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? send,
    TResult? Function()? changeAgree,
  }) {
    return changeAgree?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? send,
    TResult Function()? changeAgree,
    required TResult orElse(),
  }) {
    if (changeAgree != null) {
      return changeAgree();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Send value) send,
    required TResult Function(_ChangeAgree value) changeAgree,
  }) {
    return changeAgree(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Send value)? send,
    TResult? Function(_ChangeAgree value)? changeAgree,
  }) {
    return changeAgree?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Send value)? send,
    TResult Function(_ChangeAgree value)? changeAgree,
    required TResult orElse(),
  }) {
    if (changeAgree != null) {
      return changeAgree(this);
    }
    return orElse();
  }
}

abstract class _ChangeAgree implements RegisterEvent {
  const factory _ChangeAgree() = _$_ChangeAgree;
}

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sending,
    required TResult Function(String e) error,
    required TResult Function() sucess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sending,
    TResult? Function(String e)? error,
    TResult? Function()? sucess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sending,
    TResult Function(String e)? error,
    TResult Function()? sucess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) sucess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? sucess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? sucess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

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
    extends _$RegisterStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'RegisterState.initial()';
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
    required TResult Function() sending,
    required TResult Function(String e) error,
    required TResult Function() sucess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sending,
    TResult? Function(String e)? error,
    TResult? Function()? sucess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sending,
    TResult Function(String e)? error,
    TResult Function()? sucess,
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
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) sucess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? sucess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? sucess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegisterState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_SendingCopyWith<$Res> {
  factory _$$_SendingCopyWith(
          _$_Sending value, $Res Function(_$_Sending) then) =
      __$$_SendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendingCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_Sending>
    implements _$$_SendingCopyWith<$Res> {
  __$$_SendingCopyWithImpl(_$_Sending _value, $Res Function(_$_Sending) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Sending implements _Sending {
  const _$_Sending();

  @override
  String toString() {
    return 'RegisterState.sending()';
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
    required TResult Function() sending,
    required TResult Function(String e) error,
    required TResult Function() sucess,
  }) {
    return sending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sending,
    TResult? Function(String e)? error,
    TResult? Function()? sucess,
  }) {
    return sending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sending,
    TResult Function(String e)? error,
    TResult Function()? sucess,
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
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) sucess,
  }) {
    return sending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? sucess,
  }) {
    return sending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? sucess,
    required TResult orElse(),
  }) {
    if (sending != null) {
      return sending(this);
    }
    return orElse();
  }
}

abstract class _Sending implements RegisterState {
  const factory _Sending() = _$_Sending;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String e});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = null,
  }) {
    return _then(_$_Error(
      e: null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.e});

  @override
  final String e;

  @override
  String toString() {
    return 'RegisterState.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.e, e) || other.e == e));
  }

  @override
  int get hashCode => Object.hash(runtimeType, e);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sending,
    required TResult Function(String e) error,
    required TResult Function() sucess,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sending,
    TResult? Function(String e)? error,
    TResult? Function()? sucess,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sending,
    TResult Function(String e)? error,
    TResult Function()? sucess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) sucess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? sucess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? sucess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements RegisterState {
  const factory _Error({required final String e}) = _$_Error;

  String get e;
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
    extends _$RegisterStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success();

  @override
  String toString() {
    return 'RegisterState.sucess()';
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
    required TResult Function() sending,
    required TResult Function(String e) error,
    required TResult Function() sucess,
  }) {
    return sucess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sending,
    TResult? Function(String e)? error,
    TResult? Function()? sucess,
  }) {
    return sucess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sending,
    TResult Function(String e)? error,
    TResult Function()? sucess,
    required TResult orElse(),
  }) {
    if (sucess != null) {
      return sucess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Sending value) sending,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) sucess,
  }) {
    return sucess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Sending value)? sending,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? sucess,
  }) {
    return sucess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Sending value)? sending,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? sucess,
    required TResult orElse(),
  }) {
    if (sucess != null) {
      return sucess(this);
    }
    return orElse();
  }
}

abstract class _Success implements RegisterState {
  const factory _Success() = _$_Success;
}
