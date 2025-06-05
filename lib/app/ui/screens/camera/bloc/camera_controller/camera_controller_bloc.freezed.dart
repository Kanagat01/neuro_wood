// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'camera_controller_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CameraControllerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() init,
    required TResult Function() reinit,
    required TResult Function() takePhoto,
    required TResult Function() playPauseToggle,
    required TResult Function() disposeCamera,
    required TResult Function(Offset offset) onViewFinderTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? init,
    TResult? Function()? reinit,
    TResult? Function()? takePhoto,
    TResult? Function()? playPauseToggle,
    TResult? Function()? disposeCamera,
    TResult? Function(Offset offset)? onViewFinderTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? init,
    TResult Function()? reinit,
    TResult Function()? takePhoto,
    TResult Function()? playPauseToggle,
    TResult Function()? disposeCamera,
    TResult Function(Offset offset)? onViewFinderTap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Init value) init,
    required TResult Function(_Reinit value) reinit,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_TogglePause value) playPauseToggle,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Init value)? init,
    TResult? Function(_Reinit value)? reinit,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_TogglePause value)? playPauseToggle,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Init value)? init,
    TResult Function(_Reinit value)? reinit,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_TogglePause value)? playPauseToggle,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraControllerEventCopyWith<$Res> {
  factory $CameraControllerEventCopyWith(CameraControllerEvent value,
          $Res Function(CameraControllerEvent) then) =
      _$CameraControllerEventCopyWithImpl<$Res, CameraControllerEvent>;
}

/// @nodoc
class _$CameraControllerEventCopyWithImpl<$Res,
        $Val extends CameraControllerEvent>
    implements $CameraControllerEventCopyWith<$Res> {
  _$CameraControllerEventCopyWithImpl(this._value, this._then);

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
    extends _$CameraControllerEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'CameraControllerEvent.started()';
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
    required TResult Function() init,
    required TResult Function() reinit,
    required TResult Function() takePhoto,
    required TResult Function() playPauseToggle,
    required TResult Function() disposeCamera,
    required TResult Function(Offset offset) onViewFinderTap,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? init,
    TResult? Function()? reinit,
    TResult? Function()? takePhoto,
    TResult? Function()? playPauseToggle,
    TResult? Function()? disposeCamera,
    TResult? Function(Offset offset)? onViewFinderTap,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? init,
    TResult Function()? reinit,
    TResult Function()? takePhoto,
    TResult Function()? playPauseToggle,
    TResult Function()? disposeCamera,
    TResult Function(Offset offset)? onViewFinderTap,
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
    required TResult Function(_Init value) init,
    required TResult Function(_Reinit value) reinit,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_TogglePause value) playPauseToggle,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Init value)? init,
    TResult? Function(_Reinit value)? reinit,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_TogglePause value)? playPauseToggle,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Init value)? init,
    TResult Function(_Reinit value)? reinit,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_TogglePause value)? playPauseToggle,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CameraControllerEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$CameraControllerEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'CameraControllerEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() init,
    required TResult Function() reinit,
    required TResult Function() takePhoto,
    required TResult Function() playPauseToggle,
    required TResult Function() disposeCamera,
    required TResult Function(Offset offset) onViewFinderTap,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? init,
    TResult? Function()? reinit,
    TResult? Function()? takePhoto,
    TResult? Function()? playPauseToggle,
    TResult? Function()? disposeCamera,
    TResult? Function(Offset offset)? onViewFinderTap,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? init,
    TResult Function()? reinit,
    TResult Function()? takePhoto,
    TResult Function()? playPauseToggle,
    TResult Function()? disposeCamera,
    TResult Function(Offset offset)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Init value) init,
    required TResult Function(_Reinit value) reinit,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_TogglePause value) playPauseToggle,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Init value)? init,
    TResult? Function(_Reinit value)? reinit,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_TogglePause value)? playPauseToggle,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Init value)? init,
    TResult Function(_Reinit value)? reinit,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_TogglePause value)? playPauseToggle,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements CameraControllerEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_ReinitCopyWith<$Res> {
  factory _$$_ReinitCopyWith(_$_Reinit value, $Res Function(_$_Reinit) then) =
      __$$_ReinitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReinitCopyWithImpl<$Res>
    extends _$CameraControllerEventCopyWithImpl<$Res, _$_Reinit>
    implements _$$_ReinitCopyWith<$Res> {
  __$$_ReinitCopyWithImpl(_$_Reinit _value, $Res Function(_$_Reinit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Reinit implements _Reinit {
  const _$_Reinit();

  @override
  String toString() {
    return 'CameraControllerEvent.reinit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Reinit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() init,
    required TResult Function() reinit,
    required TResult Function() takePhoto,
    required TResult Function() playPauseToggle,
    required TResult Function() disposeCamera,
    required TResult Function(Offset offset) onViewFinderTap,
  }) {
    return reinit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? init,
    TResult? Function()? reinit,
    TResult? Function()? takePhoto,
    TResult? Function()? playPauseToggle,
    TResult? Function()? disposeCamera,
    TResult? Function(Offset offset)? onViewFinderTap,
  }) {
    return reinit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? init,
    TResult Function()? reinit,
    TResult Function()? takePhoto,
    TResult Function()? playPauseToggle,
    TResult Function()? disposeCamera,
    TResult Function(Offset offset)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (reinit != null) {
      return reinit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Init value) init,
    required TResult Function(_Reinit value) reinit,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_TogglePause value) playPauseToggle,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
  }) {
    return reinit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Init value)? init,
    TResult? Function(_Reinit value)? reinit,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_TogglePause value)? playPauseToggle,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
  }) {
    return reinit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Init value)? init,
    TResult Function(_Reinit value)? reinit,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_TogglePause value)? playPauseToggle,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (reinit != null) {
      return reinit(this);
    }
    return orElse();
  }
}

abstract class _Reinit implements CameraControllerEvent {
  const factory _Reinit() = _$_Reinit;
}

/// @nodoc
abstract class _$$_TakePhotoCopyWith<$Res> {
  factory _$$_TakePhotoCopyWith(
          _$_TakePhoto value, $Res Function(_$_TakePhoto) then) =
      __$$_TakePhotoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TakePhotoCopyWithImpl<$Res>
    extends _$CameraControllerEventCopyWithImpl<$Res, _$_TakePhoto>
    implements _$$_TakePhotoCopyWith<$Res> {
  __$$_TakePhotoCopyWithImpl(
      _$_TakePhoto _value, $Res Function(_$_TakePhoto) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_TakePhoto implements _TakePhoto {
  const _$_TakePhoto();

  @override
  String toString() {
    return 'CameraControllerEvent.takePhoto()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TakePhoto);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() init,
    required TResult Function() reinit,
    required TResult Function() takePhoto,
    required TResult Function() playPauseToggle,
    required TResult Function() disposeCamera,
    required TResult Function(Offset offset) onViewFinderTap,
  }) {
    return takePhoto();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? init,
    TResult? Function()? reinit,
    TResult? Function()? takePhoto,
    TResult? Function()? playPauseToggle,
    TResult? Function()? disposeCamera,
    TResult? Function(Offset offset)? onViewFinderTap,
  }) {
    return takePhoto?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? init,
    TResult Function()? reinit,
    TResult Function()? takePhoto,
    TResult Function()? playPauseToggle,
    TResult Function()? disposeCamera,
    TResult Function(Offset offset)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (takePhoto != null) {
      return takePhoto();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Init value) init,
    required TResult Function(_Reinit value) reinit,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_TogglePause value) playPauseToggle,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
  }) {
    return takePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Init value)? init,
    TResult? Function(_Reinit value)? reinit,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_TogglePause value)? playPauseToggle,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
  }) {
    return takePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Init value)? init,
    TResult Function(_Reinit value)? reinit,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_TogglePause value)? playPauseToggle,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (takePhoto != null) {
      return takePhoto(this);
    }
    return orElse();
  }
}

abstract class _TakePhoto implements CameraControllerEvent {
  const factory _TakePhoto() = _$_TakePhoto;
}

/// @nodoc
abstract class _$$_TogglePauseCopyWith<$Res> {
  factory _$$_TogglePauseCopyWith(
          _$_TogglePause value, $Res Function(_$_TogglePause) then) =
      __$$_TogglePauseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TogglePauseCopyWithImpl<$Res>
    extends _$CameraControllerEventCopyWithImpl<$Res, _$_TogglePause>
    implements _$$_TogglePauseCopyWith<$Res> {
  __$$_TogglePauseCopyWithImpl(
      _$_TogglePause _value, $Res Function(_$_TogglePause) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_TogglePause implements _TogglePause {
  const _$_TogglePause();

  @override
  String toString() {
    return 'CameraControllerEvent.playPauseToggle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_TogglePause);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() init,
    required TResult Function() reinit,
    required TResult Function() takePhoto,
    required TResult Function() playPauseToggle,
    required TResult Function() disposeCamera,
    required TResult Function(Offset offset) onViewFinderTap,
  }) {
    return playPauseToggle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? init,
    TResult? Function()? reinit,
    TResult? Function()? takePhoto,
    TResult? Function()? playPauseToggle,
    TResult? Function()? disposeCamera,
    TResult? Function(Offset offset)? onViewFinderTap,
  }) {
    return playPauseToggle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? init,
    TResult Function()? reinit,
    TResult Function()? takePhoto,
    TResult Function()? playPauseToggle,
    TResult Function()? disposeCamera,
    TResult Function(Offset offset)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (playPauseToggle != null) {
      return playPauseToggle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Init value) init,
    required TResult Function(_Reinit value) reinit,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_TogglePause value) playPauseToggle,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
  }) {
    return playPauseToggle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Init value)? init,
    TResult? Function(_Reinit value)? reinit,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_TogglePause value)? playPauseToggle,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
  }) {
    return playPauseToggle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Init value)? init,
    TResult Function(_Reinit value)? reinit,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_TogglePause value)? playPauseToggle,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (playPauseToggle != null) {
      return playPauseToggle(this);
    }
    return orElse();
  }
}

abstract class _TogglePause implements CameraControllerEvent {
  const factory _TogglePause() = _$_TogglePause;
}

/// @nodoc
abstract class _$$_DisposeCameraCopyWith<$Res> {
  factory _$$_DisposeCameraCopyWith(
          _$_DisposeCamera value, $Res Function(_$_DisposeCamera) then) =
      __$$_DisposeCameraCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisposeCameraCopyWithImpl<$Res>
    extends _$CameraControllerEventCopyWithImpl<$Res, _$_DisposeCamera>
    implements _$$_DisposeCameraCopyWith<$Res> {
  __$$_DisposeCameraCopyWithImpl(
      _$_DisposeCamera _value, $Res Function(_$_DisposeCamera) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DisposeCamera implements _DisposeCamera {
  const _$_DisposeCamera();

  @override
  String toString() {
    return 'CameraControllerEvent.disposeCamera()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DisposeCamera);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() init,
    required TResult Function() reinit,
    required TResult Function() takePhoto,
    required TResult Function() playPauseToggle,
    required TResult Function() disposeCamera,
    required TResult Function(Offset offset) onViewFinderTap,
  }) {
    return disposeCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? init,
    TResult? Function()? reinit,
    TResult? Function()? takePhoto,
    TResult? Function()? playPauseToggle,
    TResult? Function()? disposeCamera,
    TResult? Function(Offset offset)? onViewFinderTap,
  }) {
    return disposeCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? init,
    TResult Function()? reinit,
    TResult Function()? takePhoto,
    TResult Function()? playPauseToggle,
    TResult Function()? disposeCamera,
    TResult Function(Offset offset)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (disposeCamera != null) {
      return disposeCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Init value) init,
    required TResult Function(_Reinit value) reinit,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_TogglePause value) playPauseToggle,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
  }) {
    return disposeCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Init value)? init,
    TResult? Function(_Reinit value)? reinit,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_TogglePause value)? playPauseToggle,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
  }) {
    return disposeCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Init value)? init,
    TResult Function(_Reinit value)? reinit,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_TogglePause value)? playPauseToggle,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (disposeCamera != null) {
      return disposeCamera(this);
    }
    return orElse();
  }
}

abstract class _DisposeCamera implements CameraControllerEvent {
  const factory _DisposeCamera() = _$_DisposeCamera;
}

/// @nodoc
abstract class _$$_OnViewFinderTapCopyWith<$Res> {
  factory _$$_OnViewFinderTapCopyWith(
          _$_OnViewFinderTap value, $Res Function(_$_OnViewFinderTap) then) =
      __$$_OnViewFinderTapCopyWithImpl<$Res>;
  @useResult
  $Res call({Offset offset});
}

/// @nodoc
class __$$_OnViewFinderTapCopyWithImpl<$Res>
    extends _$CameraControllerEventCopyWithImpl<$Res, _$_OnViewFinderTap>
    implements _$$_OnViewFinderTapCopyWith<$Res> {
  __$$_OnViewFinderTapCopyWithImpl(
      _$_OnViewFinderTap _value, $Res Function(_$_OnViewFinderTap) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
  }) {
    return _then(_$_OnViewFinderTap(
      null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$_OnViewFinderTap implements _OnViewFinderTap {
  const _$_OnViewFinderTap(this.offset);

  @override
  final Offset offset;

  @override
  String toString() {
    return 'CameraControllerEvent.onViewFinderTap(offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnViewFinderTap &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnViewFinderTapCopyWith<_$_OnViewFinderTap> get copyWith =>
      __$$_OnViewFinderTapCopyWithImpl<_$_OnViewFinderTap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() init,
    required TResult Function() reinit,
    required TResult Function() takePhoto,
    required TResult Function() playPauseToggle,
    required TResult Function() disposeCamera,
    required TResult Function(Offset offset) onViewFinderTap,
  }) {
    return onViewFinderTap(offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? init,
    TResult? Function()? reinit,
    TResult? Function()? takePhoto,
    TResult? Function()? playPauseToggle,
    TResult? Function()? disposeCamera,
    TResult? Function(Offset offset)? onViewFinderTap,
  }) {
    return onViewFinderTap?.call(offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? init,
    TResult Function()? reinit,
    TResult Function()? takePhoto,
    TResult Function()? playPauseToggle,
    TResult Function()? disposeCamera,
    TResult Function(Offset offset)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (onViewFinderTap != null) {
      return onViewFinderTap(offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Init value) init,
    required TResult Function(_Reinit value) reinit,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_TogglePause value) playPauseToggle,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
  }) {
    return onViewFinderTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Init value)? init,
    TResult? Function(_Reinit value)? reinit,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_TogglePause value)? playPauseToggle,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
  }) {
    return onViewFinderTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Init value)? init,
    TResult Function(_Reinit value)? reinit,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_TogglePause value)? playPauseToggle,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    required TResult orElse(),
  }) {
    if (onViewFinderTap != null) {
      return onViewFinderTap(this);
    }
    return orElse();
  }
}

abstract class _OnViewFinderTap implements CameraControllerEvent {
  const factory _OnViewFinderTap(final Offset offset) = _$_OnViewFinderTap;

  Offset get offset;
  @JsonKey(ignore: true)
  _$$_OnViewFinderTapCopyWith<_$_OnViewFinderTap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CameraControllerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparation,
    required TResult Function() ready,
    required TResult Function(CameraErrorType error) error,
    required TResult Function(XFile photo) takedPhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? preparation,
    TResult? Function()? ready,
    TResult? Function(CameraErrorType error)? error,
    TResult? Function(XFile photo)? takedPhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparation,
    TResult Function()? ready,
    TResult Function(CameraErrorType error)? error,
    TResult Function(XFile photo)? takedPhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparation value) preparation,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Error value) error,
    required TResult Function(_TakedPhoto value) takedPhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Preparation value)? preparation,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Error value)? error,
    TResult? Function(_TakedPhoto value)? takedPhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparation value)? preparation,
    TResult Function(_Ready value)? ready,
    TResult Function(_Error value)? error,
    TResult Function(_TakedPhoto value)? takedPhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraControllerStateCopyWith<$Res> {
  factory $CameraControllerStateCopyWith(CameraControllerState value,
          $Res Function(CameraControllerState) then) =
      _$CameraControllerStateCopyWithImpl<$Res, CameraControllerState>;
}

/// @nodoc
class _$CameraControllerStateCopyWithImpl<$Res,
        $Val extends CameraControllerState>
    implements $CameraControllerStateCopyWith<$Res> {
  _$CameraControllerStateCopyWithImpl(this._value, this._then);

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
    extends _$CameraControllerStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CameraControllerState.initial()';
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
    required TResult Function() preparation,
    required TResult Function() ready,
    required TResult Function(CameraErrorType error) error,
    required TResult Function(XFile photo) takedPhoto,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? preparation,
    TResult? Function()? ready,
    TResult? Function(CameraErrorType error)? error,
    TResult? Function(XFile photo)? takedPhoto,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparation,
    TResult Function()? ready,
    TResult Function(CameraErrorType error)? error,
    TResult Function(XFile photo)? takedPhoto,
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
    required TResult Function(_Preparation value) preparation,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Error value) error,
    required TResult Function(_TakedPhoto value) takedPhoto,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Preparation value)? preparation,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Error value)? error,
    TResult? Function(_TakedPhoto value)? takedPhoto,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparation value)? preparation,
    TResult Function(_Ready value)? ready,
    TResult Function(_Error value)? error,
    TResult Function(_TakedPhoto value)? takedPhoto,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CameraControllerState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_PreparationCopyWith<$Res> {
  factory _$$_PreparationCopyWith(
          _$_Preparation value, $Res Function(_$_Preparation) then) =
      __$$_PreparationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PreparationCopyWithImpl<$Res>
    extends _$CameraControllerStateCopyWithImpl<$Res, _$_Preparation>
    implements _$$_PreparationCopyWith<$Res> {
  __$$_PreparationCopyWithImpl(
      _$_Preparation _value, $Res Function(_$_Preparation) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Preparation implements _Preparation {
  const _$_Preparation();

  @override
  String toString() {
    return 'CameraControllerState.preparation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Preparation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparation,
    required TResult Function() ready,
    required TResult Function(CameraErrorType error) error,
    required TResult Function(XFile photo) takedPhoto,
  }) {
    return preparation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? preparation,
    TResult? Function()? ready,
    TResult? Function(CameraErrorType error)? error,
    TResult? Function(XFile photo)? takedPhoto,
  }) {
    return preparation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparation,
    TResult Function()? ready,
    TResult Function(CameraErrorType error)? error,
    TResult Function(XFile photo)? takedPhoto,
    required TResult orElse(),
  }) {
    if (preparation != null) {
      return preparation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparation value) preparation,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Error value) error,
    required TResult Function(_TakedPhoto value) takedPhoto,
  }) {
    return preparation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Preparation value)? preparation,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Error value)? error,
    TResult? Function(_TakedPhoto value)? takedPhoto,
  }) {
    return preparation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparation value)? preparation,
    TResult Function(_Ready value)? ready,
    TResult Function(_Error value)? error,
    TResult Function(_TakedPhoto value)? takedPhoto,
    required TResult orElse(),
  }) {
    if (preparation != null) {
      return preparation(this);
    }
    return orElse();
  }
}

abstract class _Preparation implements CameraControllerState {
  const factory _Preparation() = _$_Preparation;
}

/// @nodoc
abstract class _$$_ReadyCopyWith<$Res> {
  factory _$$_ReadyCopyWith(_$_Ready value, $Res Function(_$_Ready) then) =
      __$$_ReadyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ReadyCopyWithImpl<$Res>
    extends _$CameraControllerStateCopyWithImpl<$Res, _$_Ready>
    implements _$$_ReadyCopyWith<$Res> {
  __$$_ReadyCopyWithImpl(_$_Ready _value, $Res Function(_$_Ready) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Ready implements _Ready {
  const _$_Ready();

  @override
  String toString() {
    return 'CameraControllerState.ready()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Ready);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparation,
    required TResult Function() ready,
    required TResult Function(CameraErrorType error) error,
    required TResult Function(XFile photo) takedPhoto,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? preparation,
    TResult? Function()? ready,
    TResult? Function(CameraErrorType error)? error,
    TResult? Function(XFile photo)? takedPhoto,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparation,
    TResult Function()? ready,
    TResult Function(CameraErrorType error)? error,
    TResult Function(XFile photo)? takedPhoto,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparation value) preparation,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Error value) error,
    required TResult Function(_TakedPhoto value) takedPhoto,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Preparation value)? preparation,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Error value)? error,
    TResult? Function(_TakedPhoto value)? takedPhoto,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparation value)? preparation,
    TResult Function(_Ready value)? ready,
    TResult Function(_Error value)? error,
    TResult Function(_TakedPhoto value)? takedPhoto,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _Ready implements CameraControllerState {
  const factory _Ready() = _$_Ready;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({CameraErrorType error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$CameraControllerStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_Error(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CameraErrorType,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final CameraErrorType error;

  @override
  String toString() {
    return 'CameraControllerState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparation,
    required TResult Function() ready,
    required TResult Function(CameraErrorType error) error,
    required TResult Function(XFile photo) takedPhoto,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? preparation,
    TResult? Function()? ready,
    TResult? Function(CameraErrorType error)? error,
    TResult? Function(XFile photo)? takedPhoto,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparation,
    TResult Function()? ready,
    TResult Function(CameraErrorType error)? error,
    TResult Function(XFile photo)? takedPhoto,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparation value) preparation,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Error value) error,
    required TResult Function(_TakedPhoto value) takedPhoto,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Preparation value)? preparation,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Error value)? error,
    TResult? Function(_TakedPhoto value)? takedPhoto,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparation value)? preparation,
    TResult Function(_Ready value)? ready,
    TResult Function(_Error value)? error,
    TResult Function(_TakedPhoto value)? takedPhoto,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CameraControllerState {
  const factory _Error(final CameraErrorType error) = _$_Error;

  CameraErrorType get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TakedPhotoCopyWith<$Res> {
  factory _$$_TakedPhotoCopyWith(
          _$_TakedPhoto value, $Res Function(_$_TakedPhoto) then) =
      __$$_TakedPhotoCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile photo});
}

/// @nodoc
class __$$_TakedPhotoCopyWithImpl<$Res>
    extends _$CameraControllerStateCopyWithImpl<$Res, _$_TakedPhoto>
    implements _$$_TakedPhotoCopyWith<$Res> {
  __$$_TakedPhotoCopyWithImpl(
      _$_TakedPhoto _value, $Res Function(_$_TakedPhoto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo = null,
  }) {
    return _then(_$_TakedPhoto(
      null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$_TakedPhoto implements _TakedPhoto {
  const _$_TakedPhoto(this.photo);

  @override
  final XFile photo;

  @override
  String toString() {
    return 'CameraControllerState.takedPhoto(photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TakedPhoto &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TakedPhotoCopyWith<_$_TakedPhoto> get copyWith =>
      __$$_TakedPhotoCopyWithImpl<_$_TakedPhoto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() preparation,
    required TResult Function() ready,
    required TResult Function(CameraErrorType error) error,
    required TResult Function(XFile photo) takedPhoto,
  }) {
    return takedPhoto(photo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? preparation,
    TResult? Function()? ready,
    TResult? Function(CameraErrorType error)? error,
    TResult? Function(XFile photo)? takedPhoto,
  }) {
    return takedPhoto?.call(photo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? preparation,
    TResult Function()? ready,
    TResult Function(CameraErrorType error)? error,
    TResult Function(XFile photo)? takedPhoto,
    required TResult orElse(),
  }) {
    if (takedPhoto != null) {
      return takedPhoto(photo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Preparation value) preparation,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Error value) error,
    required TResult Function(_TakedPhoto value) takedPhoto,
  }) {
    return takedPhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Preparation value)? preparation,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Error value)? error,
    TResult? Function(_TakedPhoto value)? takedPhoto,
  }) {
    return takedPhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Preparation value)? preparation,
    TResult Function(_Ready value)? ready,
    TResult Function(_Error value)? error,
    TResult Function(_TakedPhoto value)? takedPhoto,
    required TResult orElse(),
  }) {
    if (takedPhoto != null) {
      return takedPhoto(this);
    }
    return orElse();
  }
}

abstract class _TakedPhoto implements CameraControllerState {
  const factory _TakedPhoto(final XFile photo) = _$_TakedPhoto;

  XFile get photo;
  @JsonKey(ignore: true)
  _$$_TakedPhotoCopyWith<_$_TakedPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}
