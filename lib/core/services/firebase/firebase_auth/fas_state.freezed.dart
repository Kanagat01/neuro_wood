// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fas_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FASState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String code, String? message)
        phoneVerificationError,
    required TResult Function(String? uid) phoneVerificationCompleted,
    required TResult Function(String code, String? message) signInError,
    required TResult Function(UserEntity user) authorizedWithData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String code, String? message)? phoneVerificationError,
    TResult? Function(String? uid)? phoneVerificationCompleted,
    TResult? Function(String code, String? message)? signInError,
    TResult? Function(UserEntity user)? authorizedWithData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function(String code, String? message)? phoneVerificationError,
    TResult Function(String? uid)? phoneVerificationCompleted,
    TResult Function(String code, String? message)? signInError,
    TResult Function(UserEntity user)? authorizedWithData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FAInitial value) initial,
    required TResult Function(FAUnauthorized value) unauthorized,
    required TResult Function(FAAuthorized value) authorized,
    required TResult Function(FAPhoneVerificationError value)
        phoneVerificationError,
    required TResult Function(FAPhoneVerificationCompleted value)
        phoneVerificationCompleted,
    required TResult Function(FASignInError value) signInError,
    required TResult Function(FAAuthorizedWithData value) authorizedWithData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FAInitial value)? initial,
    TResult? Function(FAUnauthorized value)? unauthorized,
    TResult? Function(FAAuthorized value)? authorized,
    TResult? Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult? Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult? Function(FASignInError value)? signInError,
    TResult? Function(FAAuthorizedWithData value)? authorizedWithData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FAInitial value)? initial,
    TResult Function(FAUnauthorized value)? unauthorized,
    TResult Function(FAAuthorized value)? authorized,
    TResult Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult Function(FASignInError value)? signInError,
    TResult Function(FAAuthorizedWithData value)? authorizedWithData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FASStateCopyWith<$Res> {
  factory $FASStateCopyWith(FASState value, $Res Function(FASState) then) =
      _$FASStateCopyWithImpl<$Res, FASState>;
}

/// @nodoc
class _$FASStateCopyWithImpl<$Res, $Val extends FASState>
    implements $FASStateCopyWith<$Res> {
  _$FASStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FAInitialCopyWith<$Res> {
  factory _$$FAInitialCopyWith(
          _$FAInitial value, $Res Function(_$FAInitial) then) =
      __$$FAInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FAInitialCopyWithImpl<$Res>
    extends _$FASStateCopyWithImpl<$Res, _$FAInitial>
    implements _$$FAInitialCopyWith<$Res> {
  __$$FAInitialCopyWithImpl(
      _$FAInitial _value, $Res Function(_$FAInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FAInitial implements FAInitial {
  const _$FAInitial();

  @override
  String toString() {
    return 'FASState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FAInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String code, String? message)
        phoneVerificationError,
    required TResult Function(String? uid) phoneVerificationCompleted,
    required TResult Function(String code, String? message) signInError,
    required TResult Function(UserEntity user) authorizedWithData,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String code, String? message)? phoneVerificationError,
    TResult? Function(String? uid)? phoneVerificationCompleted,
    TResult? Function(String code, String? message)? signInError,
    TResult? Function(UserEntity user)? authorizedWithData,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function(String code, String? message)? phoneVerificationError,
    TResult Function(String? uid)? phoneVerificationCompleted,
    TResult Function(String code, String? message)? signInError,
    TResult Function(UserEntity user)? authorizedWithData,
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
    required TResult Function(FAInitial value) initial,
    required TResult Function(FAUnauthorized value) unauthorized,
    required TResult Function(FAAuthorized value) authorized,
    required TResult Function(FAPhoneVerificationError value)
        phoneVerificationError,
    required TResult Function(FAPhoneVerificationCompleted value)
        phoneVerificationCompleted,
    required TResult Function(FASignInError value) signInError,
    required TResult Function(FAAuthorizedWithData value) authorizedWithData,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FAInitial value)? initial,
    TResult? Function(FAUnauthorized value)? unauthorized,
    TResult? Function(FAAuthorized value)? authorized,
    TResult? Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult? Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult? Function(FASignInError value)? signInError,
    TResult? Function(FAAuthorizedWithData value)? authorizedWithData,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FAInitial value)? initial,
    TResult Function(FAUnauthorized value)? unauthorized,
    TResult Function(FAAuthorized value)? authorized,
    TResult Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult Function(FASignInError value)? signInError,
    TResult Function(FAAuthorizedWithData value)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FAInitial implements FASState {
  const factory FAInitial() = _$FAInitial;
}

/// @nodoc
abstract class _$$FAUnauthorizedCopyWith<$Res> {
  factory _$$FAUnauthorizedCopyWith(
          _$FAUnauthorized value, $Res Function(_$FAUnauthorized) then) =
      __$$FAUnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FAUnauthorizedCopyWithImpl<$Res>
    extends _$FASStateCopyWithImpl<$Res, _$FAUnauthorized>
    implements _$$FAUnauthorizedCopyWith<$Res> {
  __$$FAUnauthorizedCopyWithImpl(
      _$FAUnauthorized _value, $Res Function(_$FAUnauthorized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FAUnauthorized implements FAUnauthorized {
  const _$FAUnauthorized();

  @override
  String toString() {
    return 'FASState.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FAUnauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String code, String? message)
        phoneVerificationError,
    required TResult Function(String? uid) phoneVerificationCompleted,
    required TResult Function(String code, String? message) signInError,
    required TResult Function(UserEntity user) authorizedWithData,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String code, String? message)? phoneVerificationError,
    TResult? Function(String? uid)? phoneVerificationCompleted,
    TResult? Function(String code, String? message)? signInError,
    TResult? Function(UserEntity user)? authorizedWithData,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function(String code, String? message)? phoneVerificationError,
    TResult Function(String? uid)? phoneVerificationCompleted,
    TResult Function(String code, String? message)? signInError,
    TResult Function(UserEntity user)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FAInitial value) initial,
    required TResult Function(FAUnauthorized value) unauthorized,
    required TResult Function(FAAuthorized value) authorized,
    required TResult Function(FAPhoneVerificationError value)
        phoneVerificationError,
    required TResult Function(FAPhoneVerificationCompleted value)
        phoneVerificationCompleted,
    required TResult Function(FASignInError value) signInError,
    required TResult Function(FAAuthorizedWithData value) authorizedWithData,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FAInitial value)? initial,
    TResult? Function(FAUnauthorized value)? unauthorized,
    TResult? Function(FAAuthorized value)? authorized,
    TResult? Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult? Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult? Function(FASignInError value)? signInError,
    TResult? Function(FAAuthorizedWithData value)? authorizedWithData,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FAInitial value)? initial,
    TResult Function(FAUnauthorized value)? unauthorized,
    TResult Function(FAAuthorized value)? authorized,
    TResult Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult Function(FASignInError value)? signInError,
    TResult Function(FAAuthorizedWithData value)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class FAUnauthorized implements FASState {
  const factory FAUnauthorized() = _$FAUnauthorized;
}

/// @nodoc
abstract class _$$FAAuthorizedCopyWith<$Res> {
  factory _$$FAAuthorizedCopyWith(
          _$FAAuthorized value, $Res Function(_$FAAuthorized) then) =
      __$$FAAuthorizedCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$FAAuthorizedCopyWithImpl<$Res>
    extends _$FASStateCopyWithImpl<$Res, _$FAAuthorized>
    implements _$$FAAuthorizedCopyWith<$Res> {
  __$$FAAuthorizedCopyWithImpl(
      _$FAAuthorized _value, $Res Function(_$FAAuthorized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$FAAuthorized(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$FAAuthorized implements FAAuthorized {
  const _$FAAuthorized({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'FASState.authorized(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAAuthorized &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAAuthorizedCopyWith<_$FAAuthorized> get copyWith =>
      __$$FAAuthorizedCopyWithImpl<_$FAAuthorized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String code, String? message)
        phoneVerificationError,
    required TResult Function(String? uid) phoneVerificationCompleted,
    required TResult Function(String code, String? message) signInError,
    required TResult Function(UserEntity user) authorizedWithData,
  }) {
    return authorized(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String code, String? message)? phoneVerificationError,
    TResult? Function(String? uid)? phoneVerificationCompleted,
    TResult? Function(String code, String? message)? signInError,
    TResult? Function(UserEntity user)? authorizedWithData,
  }) {
    return authorized?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function(String code, String? message)? phoneVerificationError,
    TResult Function(String? uid)? phoneVerificationCompleted,
    TResult Function(String code, String? message)? signInError,
    TResult Function(UserEntity user)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FAInitial value) initial,
    required TResult Function(FAUnauthorized value) unauthorized,
    required TResult Function(FAAuthorized value) authorized,
    required TResult Function(FAPhoneVerificationError value)
        phoneVerificationError,
    required TResult Function(FAPhoneVerificationCompleted value)
        phoneVerificationCompleted,
    required TResult Function(FASignInError value) signInError,
    required TResult Function(FAAuthorizedWithData value) authorizedWithData,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FAInitial value)? initial,
    TResult? Function(FAUnauthorized value)? unauthorized,
    TResult? Function(FAAuthorized value)? authorized,
    TResult? Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult? Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult? Function(FASignInError value)? signInError,
    TResult? Function(FAAuthorizedWithData value)? authorizedWithData,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FAInitial value)? initial,
    TResult Function(FAUnauthorized value)? unauthorized,
    TResult Function(FAAuthorized value)? authorized,
    TResult Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult Function(FASignInError value)? signInError,
    TResult Function(FAAuthorizedWithData value)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class FAAuthorized implements FASState {
  const factory FAAuthorized({required final User user}) = _$FAAuthorized;

  User get user;
  @JsonKey(ignore: true)
  _$$FAAuthorizedCopyWith<_$FAAuthorized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FAPhoneVerificationErrorCopyWith<$Res> {
  factory _$$FAPhoneVerificationErrorCopyWith(_$FAPhoneVerificationError value,
          $Res Function(_$FAPhoneVerificationError) then) =
      __$$FAPhoneVerificationErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String code, String? message});
}

/// @nodoc
class __$$FAPhoneVerificationErrorCopyWithImpl<$Res>
    extends _$FASStateCopyWithImpl<$Res, _$FAPhoneVerificationError>
    implements _$$FAPhoneVerificationErrorCopyWith<$Res> {
  __$$FAPhoneVerificationErrorCopyWithImpl(_$FAPhoneVerificationError _value,
      $Res Function(_$FAPhoneVerificationError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_$FAPhoneVerificationError(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FAPhoneVerificationError implements FAPhoneVerificationError {
  const _$FAPhoneVerificationError({required this.code, this.message});

  @override
  final String code;
  @override
  final String? message;

  @override
  String toString() {
    return 'FASState.phoneVerificationError(code: $code, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAPhoneVerificationError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAPhoneVerificationErrorCopyWith<_$FAPhoneVerificationError>
      get copyWith =>
          __$$FAPhoneVerificationErrorCopyWithImpl<_$FAPhoneVerificationError>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String code, String? message)
        phoneVerificationError,
    required TResult Function(String? uid) phoneVerificationCompleted,
    required TResult Function(String code, String? message) signInError,
    required TResult Function(UserEntity user) authorizedWithData,
  }) {
    return phoneVerificationError(code, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String code, String? message)? phoneVerificationError,
    TResult? Function(String? uid)? phoneVerificationCompleted,
    TResult? Function(String code, String? message)? signInError,
    TResult? Function(UserEntity user)? authorizedWithData,
  }) {
    return phoneVerificationError?.call(code, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function(String code, String? message)? phoneVerificationError,
    TResult Function(String? uid)? phoneVerificationCompleted,
    TResult Function(String code, String? message)? signInError,
    TResult Function(UserEntity user)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (phoneVerificationError != null) {
      return phoneVerificationError(code, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FAInitial value) initial,
    required TResult Function(FAUnauthorized value) unauthorized,
    required TResult Function(FAAuthorized value) authorized,
    required TResult Function(FAPhoneVerificationError value)
        phoneVerificationError,
    required TResult Function(FAPhoneVerificationCompleted value)
        phoneVerificationCompleted,
    required TResult Function(FASignInError value) signInError,
    required TResult Function(FAAuthorizedWithData value) authorizedWithData,
  }) {
    return phoneVerificationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FAInitial value)? initial,
    TResult? Function(FAUnauthorized value)? unauthorized,
    TResult? Function(FAAuthorized value)? authorized,
    TResult? Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult? Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult? Function(FASignInError value)? signInError,
    TResult? Function(FAAuthorizedWithData value)? authorizedWithData,
  }) {
    return phoneVerificationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FAInitial value)? initial,
    TResult Function(FAUnauthorized value)? unauthorized,
    TResult Function(FAAuthorized value)? authorized,
    TResult Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult Function(FASignInError value)? signInError,
    TResult Function(FAAuthorizedWithData value)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (phoneVerificationError != null) {
      return phoneVerificationError(this);
    }
    return orElse();
  }
}

abstract class FAPhoneVerificationError implements FASState {
  const factory FAPhoneVerificationError(
      {required final String code,
      final String? message}) = _$FAPhoneVerificationError;

  String get code;
  String? get message;
  @JsonKey(ignore: true)
  _$$FAPhoneVerificationErrorCopyWith<_$FAPhoneVerificationError>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FAPhoneVerificationCompletedCopyWith<$Res> {
  factory _$$FAPhoneVerificationCompletedCopyWith(
          _$FAPhoneVerificationCompleted value,
          $Res Function(_$FAPhoneVerificationCompleted) then) =
      __$$FAPhoneVerificationCompletedCopyWithImpl<$Res>;
  @useResult
  $Res call({String? uid});
}

/// @nodoc
class __$$FAPhoneVerificationCompletedCopyWithImpl<$Res>
    extends _$FASStateCopyWithImpl<$Res, _$FAPhoneVerificationCompleted>
    implements _$$FAPhoneVerificationCompletedCopyWith<$Res> {
  __$$FAPhoneVerificationCompletedCopyWithImpl(
      _$FAPhoneVerificationCompleted _value,
      $Res Function(_$FAPhoneVerificationCompleted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_$FAPhoneVerificationCompleted(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FAPhoneVerificationCompleted implements FAPhoneVerificationCompleted {
  const _$FAPhoneVerificationCompleted({this.uid});

  @override
  final String? uid;

  @override
  String toString() {
    return 'FASState.phoneVerificationCompleted(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAPhoneVerificationCompleted &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAPhoneVerificationCompletedCopyWith<_$FAPhoneVerificationCompleted>
      get copyWith => __$$FAPhoneVerificationCompletedCopyWithImpl<
          _$FAPhoneVerificationCompleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String code, String? message)
        phoneVerificationError,
    required TResult Function(String? uid) phoneVerificationCompleted,
    required TResult Function(String code, String? message) signInError,
    required TResult Function(UserEntity user) authorizedWithData,
  }) {
    return phoneVerificationCompleted(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String code, String? message)? phoneVerificationError,
    TResult? Function(String? uid)? phoneVerificationCompleted,
    TResult? Function(String code, String? message)? signInError,
    TResult? Function(UserEntity user)? authorizedWithData,
  }) {
    return phoneVerificationCompleted?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function(String code, String? message)? phoneVerificationError,
    TResult Function(String? uid)? phoneVerificationCompleted,
    TResult Function(String code, String? message)? signInError,
    TResult Function(UserEntity user)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (phoneVerificationCompleted != null) {
      return phoneVerificationCompleted(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FAInitial value) initial,
    required TResult Function(FAUnauthorized value) unauthorized,
    required TResult Function(FAAuthorized value) authorized,
    required TResult Function(FAPhoneVerificationError value)
        phoneVerificationError,
    required TResult Function(FAPhoneVerificationCompleted value)
        phoneVerificationCompleted,
    required TResult Function(FASignInError value) signInError,
    required TResult Function(FAAuthorizedWithData value) authorizedWithData,
  }) {
    return phoneVerificationCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FAInitial value)? initial,
    TResult? Function(FAUnauthorized value)? unauthorized,
    TResult? Function(FAAuthorized value)? authorized,
    TResult? Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult? Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult? Function(FASignInError value)? signInError,
    TResult? Function(FAAuthorizedWithData value)? authorizedWithData,
  }) {
    return phoneVerificationCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FAInitial value)? initial,
    TResult Function(FAUnauthorized value)? unauthorized,
    TResult Function(FAAuthorized value)? authorized,
    TResult Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult Function(FASignInError value)? signInError,
    TResult Function(FAAuthorizedWithData value)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (phoneVerificationCompleted != null) {
      return phoneVerificationCompleted(this);
    }
    return orElse();
  }
}

abstract class FAPhoneVerificationCompleted implements FASState {
  const factory FAPhoneVerificationCompleted({final String? uid}) =
      _$FAPhoneVerificationCompleted;

  String? get uid;
  @JsonKey(ignore: true)
  _$$FAPhoneVerificationCompletedCopyWith<_$FAPhoneVerificationCompleted>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FASignInErrorCopyWith<$Res> {
  factory _$$FASignInErrorCopyWith(
          _$FASignInError value, $Res Function(_$FASignInError) then) =
      __$$FASignInErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String code, String? message});
}

/// @nodoc
class __$$FASignInErrorCopyWithImpl<$Res>
    extends _$FASStateCopyWithImpl<$Res, _$FASignInError>
    implements _$$FASignInErrorCopyWith<$Res> {
  __$$FASignInErrorCopyWithImpl(
      _$FASignInError _value, $Res Function(_$FASignInError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_$FASignInError(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FASignInError implements FASignInError {
  const _$FASignInError({required this.code, this.message});

  @override
  final String code;
  @override
  final String? message;

  @override
  String toString() {
    return 'FASState.signInError(code: $code, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FASignInError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FASignInErrorCopyWith<_$FASignInError> get copyWith =>
      __$$FASignInErrorCopyWithImpl<_$FASignInError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String code, String? message)
        phoneVerificationError,
    required TResult Function(String? uid) phoneVerificationCompleted,
    required TResult Function(String code, String? message) signInError,
    required TResult Function(UserEntity user) authorizedWithData,
  }) {
    return signInError(code, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String code, String? message)? phoneVerificationError,
    TResult? Function(String? uid)? phoneVerificationCompleted,
    TResult? Function(String code, String? message)? signInError,
    TResult? Function(UserEntity user)? authorizedWithData,
  }) {
    return signInError?.call(code, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function(String code, String? message)? phoneVerificationError,
    TResult Function(String? uid)? phoneVerificationCompleted,
    TResult Function(String code, String? message)? signInError,
    TResult Function(UserEntity user)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (signInError != null) {
      return signInError(code, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FAInitial value) initial,
    required TResult Function(FAUnauthorized value) unauthorized,
    required TResult Function(FAAuthorized value) authorized,
    required TResult Function(FAPhoneVerificationError value)
        phoneVerificationError,
    required TResult Function(FAPhoneVerificationCompleted value)
        phoneVerificationCompleted,
    required TResult Function(FASignInError value) signInError,
    required TResult Function(FAAuthorizedWithData value) authorizedWithData,
  }) {
    return signInError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FAInitial value)? initial,
    TResult? Function(FAUnauthorized value)? unauthorized,
    TResult? Function(FAAuthorized value)? authorized,
    TResult? Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult? Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult? Function(FASignInError value)? signInError,
    TResult? Function(FAAuthorizedWithData value)? authorizedWithData,
  }) {
    return signInError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FAInitial value)? initial,
    TResult Function(FAUnauthorized value)? unauthorized,
    TResult Function(FAAuthorized value)? authorized,
    TResult Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult Function(FASignInError value)? signInError,
    TResult Function(FAAuthorizedWithData value)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (signInError != null) {
      return signInError(this);
    }
    return orElse();
  }
}

abstract class FASignInError implements FASState {
  const factory FASignInError(
      {required final String code, final String? message}) = _$FASignInError;

  String get code;
  String? get message;
  @JsonKey(ignore: true)
  _$$FASignInErrorCopyWith<_$FASignInError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FAAuthorizedWithDataCopyWith<$Res> {
  factory _$$FAAuthorizedWithDataCopyWith(_$FAAuthorizedWithData value,
          $Res Function(_$FAAuthorizedWithData) then) =
      __$$FAAuthorizedWithDataCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$FAAuthorizedWithDataCopyWithImpl<$Res>
    extends _$FASStateCopyWithImpl<$Res, _$FAAuthorizedWithData>
    implements _$$FAAuthorizedWithDataCopyWith<$Res> {
  __$$FAAuthorizedWithDataCopyWithImpl(_$FAAuthorizedWithData _value,
      $Res Function(_$FAAuthorizedWithData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$FAAuthorizedWithData(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$FAAuthorizedWithData implements FAAuthorizedWithData {
  const _$FAAuthorizedWithData(this.user);

  @override
  final UserEntity user;

  @override
  String toString() {
    return 'FASState.authorizedWithData(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAAuthorizedWithData &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAAuthorizedWithDataCopyWith<_$FAAuthorizedWithData> get copyWith =>
      __$$FAAuthorizedWithDataCopyWithImpl<_$FAAuthorizedWithData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthorized,
    required TResult Function(User user) authorized,
    required TResult Function(String code, String? message)
        phoneVerificationError,
    required TResult Function(String? uid) phoneVerificationCompleted,
    required TResult Function(String code, String? message) signInError,
    required TResult Function(UserEntity user) authorizedWithData,
  }) {
    return authorizedWithData(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unauthorized,
    TResult? Function(User user)? authorized,
    TResult? Function(String code, String? message)? phoneVerificationError,
    TResult? Function(String? uid)? phoneVerificationCompleted,
    TResult? Function(String code, String? message)? signInError,
    TResult? Function(UserEntity user)? authorizedWithData,
  }) {
    return authorizedWithData?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthorized,
    TResult Function(User user)? authorized,
    TResult Function(String code, String? message)? phoneVerificationError,
    TResult Function(String? uid)? phoneVerificationCompleted,
    TResult Function(String code, String? message)? signInError,
    TResult Function(UserEntity user)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (authorizedWithData != null) {
      return authorizedWithData(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FAInitial value) initial,
    required TResult Function(FAUnauthorized value) unauthorized,
    required TResult Function(FAAuthorized value) authorized,
    required TResult Function(FAPhoneVerificationError value)
        phoneVerificationError,
    required TResult Function(FAPhoneVerificationCompleted value)
        phoneVerificationCompleted,
    required TResult Function(FASignInError value) signInError,
    required TResult Function(FAAuthorizedWithData value) authorizedWithData,
  }) {
    return authorizedWithData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FAInitial value)? initial,
    TResult? Function(FAUnauthorized value)? unauthorized,
    TResult? Function(FAAuthorized value)? authorized,
    TResult? Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult? Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult? Function(FASignInError value)? signInError,
    TResult? Function(FAAuthorizedWithData value)? authorizedWithData,
  }) {
    return authorizedWithData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FAInitial value)? initial,
    TResult Function(FAUnauthorized value)? unauthorized,
    TResult Function(FAAuthorized value)? authorized,
    TResult Function(FAPhoneVerificationError value)? phoneVerificationError,
    TResult Function(FAPhoneVerificationCompleted value)?
        phoneVerificationCompleted,
    TResult Function(FASignInError value)? signInError,
    TResult Function(FAAuthorizedWithData value)? authorizedWithData,
    required TResult orElse(),
  }) {
    if (authorizedWithData != null) {
      return authorizedWithData(this);
    }
    return orElse();
  }
}

abstract class FAAuthorizedWithData implements FASState {
  const factory FAAuthorizedWithData(final UserEntity user) =
      _$FAAuthorizedWithData;

  UserEntity get user;
  @JsonKey(ignore: true)
  _$$FAAuthorizedWithDataCopyWith<_$FAAuthorizedWithData> get copyWith =>
      throw _privateConstructorUsedError;
}
