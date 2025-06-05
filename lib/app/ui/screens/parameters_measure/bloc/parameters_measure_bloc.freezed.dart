// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'parameters_measure_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProgressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Stream<int> sendingProgress) inProgress,
    required TResult Function() success,
    required TResult Function(MeasureResultEntityFinish result) finish,
    required TResult Function(String meaasge) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Stream<int> sendingProgress)? inProgress,
    TResult? Function()? success,
    TResult? Function(MeasureResultEntityFinish result)? finish,
    TResult? Function(String meaasge)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Stream<int> sendingProgress)? inProgress,
    TResult Function()? success,
    TResult Function(MeasureResultEntityFinish result)? finish,
    TResult Function(String meaasge)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(Success value) success,
    required TResult Function(Finish value) finish,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(InProgress value)? inProgress,
    TResult? Function(Success value)? success,
    TResult? Function(Finish value)? finish,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Success value)? success,
    TResult Function(Finish value)? finish,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressStateCopyWith<$Res> {
  factory $ProgressStateCopyWith(
          ProgressState value, $Res Function(ProgressState) then) =
      _$ProgressStateCopyWithImpl<$Res, ProgressState>;
}

/// @nodoc
class _$ProgressStateCopyWithImpl<$Res, $Val extends ProgressState>
    implements $ProgressStateCopyWith<$Res> {
  _$ProgressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedCopyWith<$Res> {
  factory _$$StartedCopyWith(_$Started value, $Res Function(_$Started) then) =
      __$$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedCopyWithImpl<$Res>
    extends _$ProgressStateCopyWithImpl<$Res, _$Started>
    implements _$$StartedCopyWith<$Res> {
  __$$StartedCopyWithImpl(_$Started _value, $Res Function(_$Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Started implements Started {
  const _$Started();

  @override
  String toString() {
    return 'ProgressState.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Stream<int> sendingProgress) inProgress,
    required TResult Function() success,
    required TResult Function(MeasureResultEntityFinish result) finish,
    required TResult Function(String meaasge) error,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Stream<int> sendingProgress)? inProgress,
    TResult? Function()? success,
    TResult? Function(MeasureResultEntityFinish result)? finish,
    TResult? Function(String meaasge)? error,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Stream<int> sendingProgress)? inProgress,
    TResult Function()? success,
    TResult Function(MeasureResultEntityFinish result)? finish,
    TResult Function(String meaasge)? error,
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
    required TResult Function(Started value) started,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(Success value) success,
    required TResult Function(Finish value) finish,
    required TResult Function(Error value) error,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(InProgress value)? inProgress,
    TResult? Function(Success value)? success,
    TResult? Function(Finish value)? finish,
    TResult? Function(Error value)? error,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Success value)? success,
    TResult Function(Finish value)? finish,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class Started implements ProgressState {
  const factory Started() = _$Started;
}

/// @nodoc
abstract class _$$InProgressCopyWith<$Res> {
  factory _$$InProgressCopyWith(
          _$InProgress value, $Res Function(_$InProgress) then) =
      __$$InProgressCopyWithImpl<$Res>;
  @useResult
  $Res call({Stream<int> sendingProgress});
}

/// @nodoc
class __$$InProgressCopyWithImpl<$Res>
    extends _$ProgressStateCopyWithImpl<$Res, _$InProgress>
    implements _$$InProgressCopyWith<$Res> {
  __$$InProgressCopyWithImpl(
      _$InProgress _value, $Res Function(_$InProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendingProgress = null,
  }) {
    return _then(_$InProgress(
      null == sendingProgress
          ? _value.sendingProgress
          : sendingProgress // ignore: cast_nullable_to_non_nullable
              as Stream<int>,
    ));
  }
}

/// @nodoc

class _$InProgress implements InProgress {
  const _$InProgress(this.sendingProgress);

  @override
  final Stream<int> sendingProgress;

  @override
  String toString() {
    return 'ProgressState.inProgress(sendingProgress: $sendingProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InProgress &&
            (identical(other.sendingProgress, sendingProgress) ||
                other.sendingProgress == sendingProgress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendingProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InProgressCopyWith<_$InProgress> get copyWith =>
      __$$InProgressCopyWithImpl<_$InProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Stream<int> sendingProgress) inProgress,
    required TResult Function() success,
    required TResult Function(MeasureResultEntityFinish result) finish,
    required TResult Function(String meaasge) error,
  }) {
    return inProgress(sendingProgress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Stream<int> sendingProgress)? inProgress,
    TResult? Function()? success,
    TResult? Function(MeasureResultEntityFinish result)? finish,
    TResult? Function(String meaasge)? error,
  }) {
    return inProgress?.call(sendingProgress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Stream<int> sendingProgress)? inProgress,
    TResult Function()? success,
    TResult Function(MeasureResultEntityFinish result)? finish,
    TResult Function(String meaasge)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(sendingProgress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(Success value) success,
    required TResult Function(Finish value) finish,
    required TResult Function(Error value) error,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(InProgress value)? inProgress,
    TResult? Function(Success value)? success,
    TResult? Function(Finish value)? finish,
    TResult? Function(Error value)? error,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Success value)? success,
    TResult Function(Finish value)? finish,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class InProgress implements ProgressState {
  const factory InProgress(final Stream<int> sendingProgress) = _$InProgress;

  Stream<int> get sendingProgress;
  @JsonKey(ignore: true)
  _$$InProgressCopyWith<_$InProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCopyWith<$Res> {
  factory _$$SuccessCopyWith(_$Success value, $Res Function(_$Success) then) =
      __$$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessCopyWithImpl<$Res>
    extends _$ProgressStateCopyWithImpl<$Res, _$Success>
    implements _$$SuccessCopyWith<$Res> {
  __$$SuccessCopyWithImpl(_$Success _value, $Res Function(_$Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Success implements Success {
  const _$Success();

  @override
  String toString() {
    return 'ProgressState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Stream<int> sendingProgress) inProgress,
    required TResult Function() success,
    required TResult Function(MeasureResultEntityFinish result) finish,
    required TResult Function(String meaasge) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Stream<int> sendingProgress)? inProgress,
    TResult? Function()? success,
    TResult? Function(MeasureResultEntityFinish result)? finish,
    TResult? Function(String meaasge)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Stream<int> sendingProgress)? inProgress,
    TResult Function()? success,
    TResult Function(MeasureResultEntityFinish result)? finish,
    TResult Function(String meaasge)? error,
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
    required TResult Function(Started value) started,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(Success value) success,
    required TResult Function(Finish value) finish,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(InProgress value)? inProgress,
    TResult? Function(Success value)? success,
    TResult? Function(Finish value)? finish,
    TResult? Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Success value)? success,
    TResult Function(Finish value)? finish,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements ProgressState {
  const factory Success() = _$Success;
}

/// @nodoc
abstract class _$$FinishCopyWith<$Res> {
  factory _$$FinishCopyWith(_$Finish value, $Res Function(_$Finish) then) =
      __$$FinishCopyWithImpl<$Res>;
  @useResult
  $Res call({MeasureResultEntityFinish result});
}

/// @nodoc
class __$$FinishCopyWithImpl<$Res>
    extends _$ProgressStateCopyWithImpl<$Res, _$Finish>
    implements _$$FinishCopyWith<$Res> {
  __$$FinishCopyWithImpl(_$Finish _value, $Res Function(_$Finish) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$Finish(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as MeasureResultEntityFinish,
    ));
  }
}

/// @nodoc

class _$Finish implements Finish {
  const _$Finish(this.result);

  @override
  final MeasureResultEntityFinish result;

  @override
  String toString() {
    return 'ProgressState.finish(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Finish &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinishCopyWith<_$Finish> get copyWith =>
      __$$FinishCopyWithImpl<_$Finish>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Stream<int> sendingProgress) inProgress,
    required TResult Function() success,
    required TResult Function(MeasureResultEntityFinish result) finish,
    required TResult Function(String meaasge) error,
  }) {
    return finish(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Stream<int> sendingProgress)? inProgress,
    TResult? Function()? success,
    TResult? Function(MeasureResultEntityFinish result)? finish,
    TResult? Function(String meaasge)? error,
  }) {
    return finish?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Stream<int> sendingProgress)? inProgress,
    TResult Function()? success,
    TResult Function(MeasureResultEntityFinish result)? finish,
    TResult Function(String meaasge)? error,
    required TResult orElse(),
  }) {
    if (finish != null) {
      return finish(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(Success value) success,
    required TResult Function(Finish value) finish,
    required TResult Function(Error value) error,
  }) {
    return finish(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(InProgress value)? inProgress,
    TResult? Function(Success value)? success,
    TResult? Function(Finish value)? finish,
    TResult? Function(Error value)? error,
  }) {
    return finish?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Success value)? success,
    TResult Function(Finish value)? finish,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (finish != null) {
      return finish(this);
    }
    return orElse();
  }
}

abstract class Finish implements ProgressState {
  const factory Finish(final MeasureResultEntityFinish result) = _$Finish;

  MeasureResultEntityFinish get result;
  @JsonKey(ignore: true)
  _$$FinishCopyWith<_$Finish> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String meaasge});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$ProgressStateCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meaasge = null,
  }) {
    return _then(_$Error(
      null == meaasge
          ? _value.meaasge
          : meaasge // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error(this.meaasge);

  @override
  final String meaasge;

  @override
  String toString() {
    return 'ProgressState.error(meaasge: $meaasge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            (identical(other.meaasge, meaasge) || other.meaasge == meaasge));
  }

  @override
  int get hashCode => Object.hash(runtimeType, meaasge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Stream<int> sendingProgress) inProgress,
    required TResult Function() success,
    required TResult Function(MeasureResultEntityFinish result) finish,
    required TResult Function(String meaasge) error,
  }) {
    return error(meaasge);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Stream<int> sendingProgress)? inProgress,
    TResult? Function()? success,
    TResult? Function(MeasureResultEntityFinish result)? finish,
    TResult? Function(String meaasge)? error,
  }) {
    return error?.call(meaasge);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Stream<int> sendingProgress)? inProgress,
    TResult Function()? success,
    TResult Function(MeasureResultEntityFinish result)? finish,
    TResult Function(String meaasge)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(meaasge);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Started value) started,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(Success value) success,
    required TResult Function(Finish value) finish,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Started value)? started,
    TResult? Function(InProgress value)? inProgress,
    TResult? Function(Success value)? success,
    TResult? Function(Finish value)? finish,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Started value)? started,
    TResult Function(InProgress value)? inProgress,
    TResult Function(Success value)? success,
    TResult Function(Finish value)? finish,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ProgressState {
  const factory Error(final String meaasge) = _$Error;

  String get meaasge;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ParametersMeasureEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() apply,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? apply,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? apply,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Apply value) apply,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Apply value)? apply,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Apply value)? apply,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParametersMeasureEventCopyWith<$Res> {
  factory $ParametersMeasureEventCopyWith(ParametersMeasureEvent value,
          $Res Function(ParametersMeasureEvent) then) =
      _$ParametersMeasureEventCopyWithImpl<$Res, ParametersMeasureEvent>;
}

/// @nodoc
class _$ParametersMeasureEventCopyWithImpl<$Res,
        $Val extends ParametersMeasureEvent>
    implements $ParametersMeasureEventCopyWith<$Res> {
  _$ParametersMeasureEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadCopyWith<$Res> {
  factory _$$_LoadCopyWith(_$_Load value, $Res Function(_$_Load) then) =
      __$$_LoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadCopyWithImpl<$Res>
    extends _$ParametersMeasureEventCopyWithImpl<$Res, _$_Load>
    implements _$$_LoadCopyWith<$Res> {
  __$$_LoadCopyWithImpl(_$_Load _value, $Res Function(_$_Load) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Load implements _Load {
  const _$_Load();

  @override
  String toString() {
    return 'ParametersMeasureEvent.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Load);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() apply,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? apply,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? apply,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Apply value) apply,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Apply value)? apply,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Apply value)? apply,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements ParametersMeasureEvent {
  const factory _Load() = _$_Load;
}

/// @nodoc
abstract class _$$_ApplyCopyWith<$Res> {
  factory _$$_ApplyCopyWith(_$_Apply value, $Res Function(_$_Apply) then) =
      __$$_ApplyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ApplyCopyWithImpl<$Res>
    extends _$ParametersMeasureEventCopyWithImpl<$Res, _$_Apply>
    implements _$$_ApplyCopyWith<$Res> {
  __$$_ApplyCopyWithImpl(_$_Apply _value, $Res Function(_$_Apply) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Apply implements _Apply {
  const _$_Apply();

  @override
  String toString() {
    return 'ParametersMeasureEvent.apply()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Apply);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() apply,
  }) {
    return apply();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? apply,
  }) {
    return apply?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? apply,
    required TResult orElse(),
  }) {
    if (apply != null) {
      return apply();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Apply value) apply,
  }) {
    return apply(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Apply value)? apply,
  }) {
    return apply?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Apply value)? apply,
    required TResult orElse(),
  }) {
    if (apply != null) {
      return apply(this);
    }
    return orElse();
  }
}

abstract class _Apply implements ParametersMeasureEvent {
  const factory _Apply() = _$_Apply;
}

/// @nodoc
mixin _$ParametersMeasureState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)
        loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)?
        loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(ErrorLoading value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(ErrorLoading value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(ErrorLoading value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParametersMeasureStateCopyWith<$Res> {
  factory $ParametersMeasureStateCopyWith(ParametersMeasureState value,
          $Res Function(ParametersMeasureState) then) =
      _$ParametersMeasureStateCopyWithImpl<$Res, ParametersMeasureState>;
}

/// @nodoc
class _$ParametersMeasureStateCopyWithImpl<$Res,
        $Val extends ParametersMeasureState>
    implements $ParametersMeasureStateCopyWith<$Res> {
  _$ParametersMeasureStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$ParametersMeasureStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ParametersMeasureState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)
        loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)?
        loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)?
        loaded,
    TResult Function()? error,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(ErrorLoading value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(ErrorLoading value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(ErrorLoading value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ParametersMeasureState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$ParametersMeasureStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'ParametersMeasureState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)
        loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)?
        loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(ErrorLoading value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(ErrorLoading value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(ErrorLoading value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ParametersMeasureState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$LoadedCopyWith<$Res> {
  factory _$$LoadedCopyWith(_$Loaded value, $Res Function(_$Loaded) then) =
      __$$LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<InputSelectAdapterLocation> locations,
      List<InputSelectAdapterSortiment> sortiment,
      List<InputSelectAdapterBread> bread,
      List<InputSelectAdapterVehicleType> vehicleType});
}

/// @nodoc
class __$$LoadedCopyWithImpl<$Res>
    extends _$ParametersMeasureStateCopyWithImpl<$Res, _$Loaded>
    implements _$$LoadedCopyWith<$Res> {
  __$$LoadedCopyWithImpl(_$Loaded _value, $Res Function(_$Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
    Object? sortiment = null,
    Object? bread = null,
    Object? vehicleType = null,
  }) {
    return _then(_$Loaded(
      locations: null == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<InputSelectAdapterLocation>,
      sortiment: null == sortiment
          ? _value._sortiment
          : sortiment // ignore: cast_nullable_to_non_nullable
              as List<InputSelectAdapterSortiment>,
      bread: null == bread
          ? _value._bread
          : bread // ignore: cast_nullable_to_non_nullable
              as List<InputSelectAdapterBread>,
      vehicleType: null == vehicleType
          ? _value._vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as List<InputSelectAdapterVehicleType>,
    ));
  }
}

/// @nodoc

class _$Loaded implements Loaded {
  const _$Loaded(
      {required final List<InputSelectAdapterLocation> locations,
      required final List<InputSelectAdapterSortiment> sortiment,
      required final List<InputSelectAdapterBread> bread,
      required final List<InputSelectAdapterVehicleType> vehicleType})
      : _locations = locations,
        _sortiment = sortiment,
        _bread = bread,
        _vehicleType = vehicleType;

  final List<InputSelectAdapterLocation> _locations;
  @override
  List<InputSelectAdapterLocation> get locations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  final List<InputSelectAdapterSortiment> _sortiment;
  @override
  List<InputSelectAdapterSortiment> get sortiment {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sortiment);
  }

  final List<InputSelectAdapterBread> _bread;
  @override
  List<InputSelectAdapterBread> get bread {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bread);
  }

  final List<InputSelectAdapterVehicleType> _vehicleType;
  @override
  List<InputSelectAdapterVehicleType> get vehicleType {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vehicleType);
  }

  @override
  String toString() {
    return 'ParametersMeasureState.loaded(locations: $locations, sortiment: $sortiment, bread: $bread, vehicleType: $vehicleType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loaded &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations) &&
            const DeepCollectionEquality()
                .equals(other._sortiment, _sortiment) &&
            const DeepCollectionEquality().equals(other._bread, _bread) &&
            const DeepCollectionEquality()
                .equals(other._vehicleType, _vehicleType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_locations),
      const DeepCollectionEquality().hash(_sortiment),
      const DeepCollectionEquality().hash(_bread),
      const DeepCollectionEquality().hash(_vehicleType));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedCopyWith<_$Loaded> get copyWith =>
      __$$LoadedCopyWithImpl<_$Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)
        loaded,
    required TResult Function() error,
  }) {
    return loaded(locations, sortiment, bread, vehicleType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)?
        loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(locations, sortiment, bread, vehicleType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(locations, sortiment, bread, vehicleType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(ErrorLoading value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(ErrorLoading value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(ErrorLoading value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements ParametersMeasureState {
  const factory Loaded(
          {required final List<InputSelectAdapterLocation> locations,
          required final List<InputSelectAdapterSortiment> sortiment,
          required final List<InputSelectAdapterBread> bread,
          required final List<InputSelectAdapterVehicleType> vehicleType}) =
      _$Loaded;

  List<InputSelectAdapterLocation> get locations;
  List<InputSelectAdapterSortiment> get sortiment;
  List<InputSelectAdapterBread> get bread;
  List<InputSelectAdapterVehicleType> get vehicleType;
  @JsonKey(ignore: true)
  _$$LoadedCopyWith<_$Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorLoadingCopyWith<$Res> {
  factory _$$ErrorLoadingCopyWith(
          _$ErrorLoading value, $Res Function(_$ErrorLoading) then) =
      __$$ErrorLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorLoadingCopyWithImpl<$Res>
    extends _$ParametersMeasureStateCopyWithImpl<$Res, _$ErrorLoading>
    implements _$$ErrorLoadingCopyWith<$Res> {
  __$$ErrorLoadingCopyWithImpl(
      _$ErrorLoading _value, $Res Function(_$ErrorLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorLoading implements ErrorLoading {
  const _$ErrorLoading();

  @override
  String toString() {
    return 'ParametersMeasureState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)
        loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)?
        loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<InputSelectAdapterLocation> locations,
            List<InputSelectAdapterSortiment> sortiment,
            List<InputSelectAdapterBread> bread,
            List<InputSelectAdapterVehicleType> vehicleType)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(ErrorLoading value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(ErrorLoading value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(ErrorLoading value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorLoading implements ParametersMeasureState {
  const factory ErrorLoading() = _$ErrorLoading;
}
