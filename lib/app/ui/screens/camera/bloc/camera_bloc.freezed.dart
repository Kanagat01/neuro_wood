// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'camera_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CameraEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MeasureType type) initCamera,
    required TResult Function() takePhoto,
    required TResult Function() pickImage,
    required TResult Function(Stream<InclineMeasure>? stream)
        changeAllowTakePhoto,
    required TResult Function() send,
    required TResult Function(Offset offset) onViewFinderTap,
    required TResult Function(CameraControllerState ccState)
        cameraControllerEvent,
    required TResult Function() interrupt,
    required TResult Function() onSettingsTap,
    required TResult Function() dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MeasureType type)? initCamera,
    TResult? Function()? takePhoto,
    TResult? Function()? pickImage,
    TResult? Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult? Function()? send,
    TResult? Function(Offset offset)? onViewFinderTap,
    TResult? Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult? Function()? interrupt,
    TResult? Function()? onSettingsTap,
    TResult? Function()? dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MeasureType type)? initCamera,
    TResult Function()? takePhoto,
    TResult Function()? pickImage,
    TResult Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult Function()? send,
    TResult Function(Offset offset)? onViewFinderTap,
    TResult Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult Function()? interrupt,
    TResult Function()? onSettingsTap,
    TResult Function()? dispose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitCamera value) initCamera,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangeAllowTakePhoto value) changeAllowTakePhoto,
    required TResult Function(_Send value) send,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
    required TResult Function(_CameraControllerEvent value)
        cameraControllerEvent,
    required TResult Function(_Interrupt value) interrupt,
    required TResult Function(_OnSettingsTap value) onSettingsTap,
    required TResult Function(_Dispose value) dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitCamera value)? initCamera,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult? Function(_Send value)? send,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult? Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult? Function(_Interrupt value)? interrupt,
    TResult? Function(_OnSettingsTap value)? onSettingsTap,
    TResult? Function(_Dispose value)? dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCamera value)? initCamera,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult Function(_Send value)? send,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult Function(_Interrupt value)? interrupt,
    TResult Function(_OnSettingsTap value)? onSettingsTap,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraEventCopyWith<$Res> {
  factory $CameraEventCopyWith(
          CameraEvent value, $Res Function(CameraEvent) then) =
      _$CameraEventCopyWithImpl<$Res, CameraEvent>;
}

/// @nodoc
class _$CameraEventCopyWithImpl<$Res, $Val extends CameraEvent>
    implements $CameraEventCopyWith<$Res> {
  _$CameraEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitCameraCopyWith<$Res> {
  factory _$$_InitCameraCopyWith(
          _$_InitCamera value, $Res Function(_$_InitCamera) then) =
      __$$_InitCameraCopyWithImpl<$Res>;
  @useResult
  $Res call({MeasureType type});
}

/// @nodoc
class __$$_InitCameraCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res, _$_InitCamera>
    implements _$$_InitCameraCopyWith<$Res> {
  __$$_InitCameraCopyWithImpl(
      _$_InitCamera _value, $Res Function(_$_InitCamera) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$_InitCamera(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MeasureType,
    ));
  }
}

/// @nodoc

class _$_InitCamera implements _InitCamera {
  const _$_InitCamera(this.type);

  @override
  final MeasureType type;

  @override
  String toString() {
    return 'CameraEvent.initCamera(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitCamera &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitCameraCopyWith<_$_InitCamera> get copyWith =>
      __$$_InitCameraCopyWithImpl<_$_InitCamera>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MeasureType type) initCamera,
    required TResult Function() takePhoto,
    required TResult Function() pickImage,
    required TResult Function(Stream<InclineMeasure>? stream)
        changeAllowTakePhoto,
    required TResult Function() send,
    required TResult Function(Offset offset) onViewFinderTap,
    required TResult Function(CameraControllerState ccState)
        cameraControllerEvent,
    required TResult Function() interrupt,
    required TResult Function() onSettingsTap,
    required TResult Function() dispose,
  }) {
    return initCamera(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MeasureType type)? initCamera,
    TResult? Function()? takePhoto,
    TResult? Function()? pickImage,
    TResult? Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult? Function()? send,
    TResult? Function(Offset offset)? onViewFinderTap,
    TResult? Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult? Function()? interrupt,
    TResult? Function()? onSettingsTap,
    TResult? Function()? dispose,
  }) {
    return initCamera?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MeasureType type)? initCamera,
    TResult Function()? takePhoto,
    TResult Function()? pickImage,
    TResult Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult Function()? send,
    TResult Function(Offset offset)? onViewFinderTap,
    TResult Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult Function()? interrupt,
    TResult Function()? onSettingsTap,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (initCamera != null) {
      return initCamera(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitCamera value) initCamera,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangeAllowTakePhoto value) changeAllowTakePhoto,
    required TResult Function(_Send value) send,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
    required TResult Function(_CameraControllerEvent value)
        cameraControllerEvent,
    required TResult Function(_Interrupt value) interrupt,
    required TResult Function(_OnSettingsTap value) onSettingsTap,
    required TResult Function(_Dispose value) dispose,
  }) {
    return initCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitCamera value)? initCamera,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult? Function(_Send value)? send,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult? Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult? Function(_Interrupt value)? interrupt,
    TResult? Function(_OnSettingsTap value)? onSettingsTap,
    TResult? Function(_Dispose value)? dispose,
  }) {
    return initCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCamera value)? initCamera,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult Function(_Send value)? send,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult Function(_Interrupt value)? interrupt,
    TResult Function(_OnSettingsTap value)? onSettingsTap,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (initCamera != null) {
      return initCamera(this);
    }
    return orElse();
  }
}

abstract class _InitCamera implements CameraEvent {
  const factory _InitCamera(final MeasureType type) = _$_InitCamera;

  MeasureType get type;
  @JsonKey(ignore: true)
  _$$_InitCameraCopyWith<_$_InitCamera> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TakePhotoCopyWith<$Res> {
  factory _$$_TakePhotoCopyWith(
          _$_TakePhoto value, $Res Function(_$_TakePhoto) then) =
      __$$_TakePhotoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TakePhotoCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res, _$_TakePhoto>
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
    return 'CameraEvent.takePhoto()';
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
    required TResult Function(MeasureType type) initCamera,
    required TResult Function() takePhoto,
    required TResult Function() pickImage,
    required TResult Function(Stream<InclineMeasure>? stream)
        changeAllowTakePhoto,
    required TResult Function() send,
    required TResult Function(Offset offset) onViewFinderTap,
    required TResult Function(CameraControllerState ccState)
        cameraControllerEvent,
    required TResult Function() interrupt,
    required TResult Function() onSettingsTap,
    required TResult Function() dispose,
  }) {
    return takePhoto();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MeasureType type)? initCamera,
    TResult? Function()? takePhoto,
    TResult? Function()? pickImage,
    TResult? Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult? Function()? send,
    TResult? Function(Offset offset)? onViewFinderTap,
    TResult? Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult? Function()? interrupt,
    TResult? Function()? onSettingsTap,
    TResult? Function()? dispose,
  }) {
    return takePhoto?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MeasureType type)? initCamera,
    TResult Function()? takePhoto,
    TResult Function()? pickImage,
    TResult Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult Function()? send,
    TResult Function(Offset offset)? onViewFinderTap,
    TResult Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult Function()? interrupt,
    TResult Function()? onSettingsTap,
    TResult Function()? dispose,
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
    required TResult Function(_InitCamera value) initCamera,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangeAllowTakePhoto value) changeAllowTakePhoto,
    required TResult Function(_Send value) send,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
    required TResult Function(_CameraControllerEvent value)
        cameraControllerEvent,
    required TResult Function(_Interrupt value) interrupt,
    required TResult Function(_OnSettingsTap value) onSettingsTap,
    required TResult Function(_Dispose value) dispose,
  }) {
    return takePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitCamera value)? initCamera,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult? Function(_Send value)? send,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult? Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult? Function(_Interrupt value)? interrupt,
    TResult? Function(_OnSettingsTap value)? onSettingsTap,
    TResult? Function(_Dispose value)? dispose,
  }) {
    return takePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCamera value)? initCamera,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult Function(_Send value)? send,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult Function(_Interrupt value)? interrupt,
    TResult Function(_OnSettingsTap value)? onSettingsTap,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (takePhoto != null) {
      return takePhoto(this);
    }
    return orElse();
  }
}

abstract class _TakePhoto implements CameraEvent {
  const factory _TakePhoto() = _$_TakePhoto;
}

/// @nodoc
abstract class _$$_PickImageCopyWith<$Res> {
  factory _$$_PickImageCopyWith(
          _$_PickImage value, $Res Function(_$_PickImage) then) =
      __$$_PickImageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PickImageCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res, _$_PickImage>
    implements _$$_PickImageCopyWith<$Res> {
  __$$_PickImageCopyWithImpl(
      _$_PickImage _value, $Res Function(_$_PickImage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PickImage implements _PickImage {
  const _$_PickImage();

  @override
  String toString() {
    return 'CameraEvent.pickImage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PickImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MeasureType type) initCamera,
    required TResult Function() takePhoto,
    required TResult Function() pickImage,
    required TResult Function(Stream<InclineMeasure>? stream)
        changeAllowTakePhoto,
    required TResult Function() send,
    required TResult Function(Offset offset) onViewFinderTap,
    required TResult Function(CameraControllerState ccState)
        cameraControllerEvent,
    required TResult Function() interrupt,
    required TResult Function() onSettingsTap,
    required TResult Function() dispose,
  }) {
    return pickImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MeasureType type)? initCamera,
    TResult? Function()? takePhoto,
    TResult? Function()? pickImage,
    TResult? Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult? Function()? send,
    TResult? Function(Offset offset)? onViewFinderTap,
    TResult? Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult? Function()? interrupt,
    TResult? Function()? onSettingsTap,
    TResult? Function()? dispose,
  }) {
    return pickImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MeasureType type)? initCamera,
    TResult Function()? takePhoto,
    TResult Function()? pickImage,
    TResult Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult Function()? send,
    TResult Function(Offset offset)? onViewFinderTap,
    TResult Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult Function()? interrupt,
    TResult Function()? onSettingsTap,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitCamera value) initCamera,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangeAllowTakePhoto value) changeAllowTakePhoto,
    required TResult Function(_Send value) send,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
    required TResult Function(_CameraControllerEvent value)
        cameraControllerEvent,
    required TResult Function(_Interrupt value) interrupt,
    required TResult Function(_OnSettingsTap value) onSettingsTap,
    required TResult Function(_Dispose value) dispose,
  }) {
    return pickImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitCamera value)? initCamera,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult? Function(_Send value)? send,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult? Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult? Function(_Interrupt value)? interrupt,
    TResult? Function(_OnSettingsTap value)? onSettingsTap,
    TResult? Function(_Dispose value)? dispose,
  }) {
    return pickImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCamera value)? initCamera,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult Function(_Send value)? send,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult Function(_Interrupt value)? interrupt,
    TResult Function(_OnSettingsTap value)? onSettingsTap,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage(this);
    }
    return orElse();
  }
}

abstract class _PickImage implements CameraEvent {
  const factory _PickImage() = _$_PickImage;
}

/// @nodoc
abstract class _$$_ChangeAllowTakePhotoCopyWith<$Res> {
  factory _$$_ChangeAllowTakePhotoCopyWith(_$_ChangeAllowTakePhoto value,
          $Res Function(_$_ChangeAllowTakePhoto) then) =
      __$$_ChangeAllowTakePhotoCopyWithImpl<$Res>;
  @useResult
  $Res call({Stream<InclineMeasure>? stream});
}

/// @nodoc
class __$$_ChangeAllowTakePhotoCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res, _$_ChangeAllowTakePhoto>
    implements _$$_ChangeAllowTakePhotoCopyWith<$Res> {
  __$$_ChangeAllowTakePhotoCopyWithImpl(_$_ChangeAllowTakePhoto _value,
      $Res Function(_$_ChangeAllowTakePhoto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stream = freezed,
  }) {
    return _then(_$_ChangeAllowTakePhoto(
      freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Stream<InclineMeasure>?,
    ));
  }
}

/// @nodoc

class _$_ChangeAllowTakePhoto implements _ChangeAllowTakePhoto {
  const _$_ChangeAllowTakePhoto([this.stream]);

  @override
  final Stream<InclineMeasure>? stream;

  @override
  String toString() {
    return 'CameraEvent.changeAllowTakePhoto(stream: $stream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeAllowTakePhoto &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeAllowTakePhotoCopyWith<_$_ChangeAllowTakePhoto> get copyWith =>
      __$$_ChangeAllowTakePhotoCopyWithImpl<_$_ChangeAllowTakePhoto>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MeasureType type) initCamera,
    required TResult Function() takePhoto,
    required TResult Function() pickImage,
    required TResult Function(Stream<InclineMeasure>? stream)
        changeAllowTakePhoto,
    required TResult Function() send,
    required TResult Function(Offset offset) onViewFinderTap,
    required TResult Function(CameraControllerState ccState)
        cameraControllerEvent,
    required TResult Function() interrupt,
    required TResult Function() onSettingsTap,
    required TResult Function() dispose,
  }) {
    return changeAllowTakePhoto(stream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MeasureType type)? initCamera,
    TResult? Function()? takePhoto,
    TResult? Function()? pickImage,
    TResult? Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult? Function()? send,
    TResult? Function(Offset offset)? onViewFinderTap,
    TResult? Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult? Function()? interrupt,
    TResult? Function()? onSettingsTap,
    TResult? Function()? dispose,
  }) {
    return changeAllowTakePhoto?.call(stream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MeasureType type)? initCamera,
    TResult Function()? takePhoto,
    TResult Function()? pickImage,
    TResult Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult Function()? send,
    TResult Function(Offset offset)? onViewFinderTap,
    TResult Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult Function()? interrupt,
    TResult Function()? onSettingsTap,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (changeAllowTakePhoto != null) {
      return changeAllowTakePhoto(stream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitCamera value) initCamera,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangeAllowTakePhoto value) changeAllowTakePhoto,
    required TResult Function(_Send value) send,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
    required TResult Function(_CameraControllerEvent value)
        cameraControllerEvent,
    required TResult Function(_Interrupt value) interrupt,
    required TResult Function(_OnSettingsTap value) onSettingsTap,
    required TResult Function(_Dispose value) dispose,
  }) {
    return changeAllowTakePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitCamera value)? initCamera,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult? Function(_Send value)? send,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult? Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult? Function(_Interrupt value)? interrupt,
    TResult? Function(_OnSettingsTap value)? onSettingsTap,
    TResult? Function(_Dispose value)? dispose,
  }) {
    return changeAllowTakePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCamera value)? initCamera,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult Function(_Send value)? send,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult Function(_Interrupt value)? interrupt,
    TResult Function(_OnSettingsTap value)? onSettingsTap,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (changeAllowTakePhoto != null) {
      return changeAllowTakePhoto(this);
    }
    return orElse();
  }
}

abstract class _ChangeAllowTakePhoto implements CameraEvent {
  const factory _ChangeAllowTakePhoto([final Stream<InclineMeasure>? stream]) =
      _$_ChangeAllowTakePhoto;

  Stream<InclineMeasure>? get stream;
  @JsonKey(ignore: true)
  _$$_ChangeAllowTakePhotoCopyWith<_$_ChangeAllowTakePhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendCopyWith<$Res> {
  factory _$$_SendCopyWith(_$_Send value, $Res Function(_$_Send) then) =
      __$$_SendCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res, _$_Send>
    implements _$$_SendCopyWith<$Res> {
  __$$_SendCopyWithImpl(_$_Send _value, $Res Function(_$_Send) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Send implements _Send {
  const _$_Send();

  @override
  String toString() {
    return 'CameraEvent.send()';
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
    required TResult Function(MeasureType type) initCamera,
    required TResult Function() takePhoto,
    required TResult Function() pickImage,
    required TResult Function(Stream<InclineMeasure>? stream)
        changeAllowTakePhoto,
    required TResult Function() send,
    required TResult Function(Offset offset) onViewFinderTap,
    required TResult Function(CameraControllerState ccState)
        cameraControllerEvent,
    required TResult Function() interrupt,
    required TResult Function() onSettingsTap,
    required TResult Function() dispose,
  }) {
    return send();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MeasureType type)? initCamera,
    TResult? Function()? takePhoto,
    TResult? Function()? pickImage,
    TResult? Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult? Function()? send,
    TResult? Function(Offset offset)? onViewFinderTap,
    TResult? Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult? Function()? interrupt,
    TResult? Function()? onSettingsTap,
    TResult? Function()? dispose,
  }) {
    return send?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MeasureType type)? initCamera,
    TResult Function()? takePhoto,
    TResult Function()? pickImage,
    TResult Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult Function()? send,
    TResult Function(Offset offset)? onViewFinderTap,
    TResult Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult Function()? interrupt,
    TResult Function()? onSettingsTap,
    TResult Function()? dispose,
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
    required TResult Function(_InitCamera value) initCamera,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangeAllowTakePhoto value) changeAllowTakePhoto,
    required TResult Function(_Send value) send,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
    required TResult Function(_CameraControllerEvent value)
        cameraControllerEvent,
    required TResult Function(_Interrupt value) interrupt,
    required TResult Function(_OnSettingsTap value) onSettingsTap,
    required TResult Function(_Dispose value) dispose,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitCamera value)? initCamera,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult? Function(_Send value)? send,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult? Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult? Function(_Interrupt value)? interrupt,
    TResult? Function(_OnSettingsTap value)? onSettingsTap,
    TResult? Function(_Dispose value)? dispose,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCamera value)? initCamera,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult Function(_Send value)? send,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult Function(_Interrupt value)? interrupt,
    TResult Function(_OnSettingsTap value)? onSettingsTap,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements CameraEvent {
  const factory _Send() = _$_Send;
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
    extends _$CameraEventCopyWithImpl<$Res, _$_OnViewFinderTap>
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
    return 'CameraEvent.onViewFinderTap(offset: $offset)';
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
    required TResult Function(MeasureType type) initCamera,
    required TResult Function() takePhoto,
    required TResult Function() pickImage,
    required TResult Function(Stream<InclineMeasure>? stream)
        changeAllowTakePhoto,
    required TResult Function() send,
    required TResult Function(Offset offset) onViewFinderTap,
    required TResult Function(CameraControllerState ccState)
        cameraControllerEvent,
    required TResult Function() interrupt,
    required TResult Function() onSettingsTap,
    required TResult Function() dispose,
  }) {
    return onViewFinderTap(offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MeasureType type)? initCamera,
    TResult? Function()? takePhoto,
    TResult? Function()? pickImage,
    TResult? Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult? Function()? send,
    TResult? Function(Offset offset)? onViewFinderTap,
    TResult? Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult? Function()? interrupt,
    TResult? Function()? onSettingsTap,
    TResult? Function()? dispose,
  }) {
    return onViewFinderTap?.call(offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MeasureType type)? initCamera,
    TResult Function()? takePhoto,
    TResult Function()? pickImage,
    TResult Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult Function()? send,
    TResult Function(Offset offset)? onViewFinderTap,
    TResult Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult Function()? interrupt,
    TResult Function()? onSettingsTap,
    TResult Function()? dispose,
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
    required TResult Function(_InitCamera value) initCamera,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangeAllowTakePhoto value) changeAllowTakePhoto,
    required TResult Function(_Send value) send,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
    required TResult Function(_CameraControllerEvent value)
        cameraControllerEvent,
    required TResult Function(_Interrupt value) interrupt,
    required TResult Function(_OnSettingsTap value) onSettingsTap,
    required TResult Function(_Dispose value) dispose,
  }) {
    return onViewFinderTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitCamera value)? initCamera,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult? Function(_Send value)? send,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult? Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult? Function(_Interrupt value)? interrupt,
    TResult? Function(_OnSettingsTap value)? onSettingsTap,
    TResult? Function(_Dispose value)? dispose,
  }) {
    return onViewFinderTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCamera value)? initCamera,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult Function(_Send value)? send,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult Function(_Interrupt value)? interrupt,
    TResult Function(_OnSettingsTap value)? onSettingsTap,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (onViewFinderTap != null) {
      return onViewFinderTap(this);
    }
    return orElse();
  }
}

abstract class _OnViewFinderTap implements CameraEvent {
  const factory _OnViewFinderTap(final Offset offset) = _$_OnViewFinderTap;

  Offset get offset;
  @JsonKey(ignore: true)
  _$$_OnViewFinderTapCopyWith<_$_OnViewFinderTap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CameraControllerEventCopyWith<$Res> {
  factory _$$_CameraControllerEventCopyWith(_$_CameraControllerEvent value,
          $Res Function(_$_CameraControllerEvent) then) =
      __$$_CameraControllerEventCopyWithImpl<$Res>;
  @useResult
  $Res call({CameraControllerState ccState});

  $CameraControllerStateCopyWith<$Res> get ccState;
}

/// @nodoc
class __$$_CameraControllerEventCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res, _$_CameraControllerEvent>
    implements _$$_CameraControllerEventCopyWith<$Res> {
  __$$_CameraControllerEventCopyWithImpl(_$_CameraControllerEvent _value,
      $Res Function(_$_CameraControllerEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ccState = null,
  }) {
    return _then(_$_CameraControllerEvent(
      null == ccState
          ? _value.ccState
          : ccState // ignore: cast_nullable_to_non_nullable
              as CameraControllerState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CameraControllerStateCopyWith<$Res> get ccState {
    return $CameraControllerStateCopyWith<$Res>(_value.ccState, (value) {
      return _then(_value.copyWith(ccState: value));
    });
  }
}

/// @nodoc

class _$_CameraControllerEvent implements _CameraControllerEvent {
  const _$_CameraControllerEvent(this.ccState);

  @override
  final CameraControllerState ccState;

  @override
  String toString() {
    return 'CameraEvent.cameraControllerEvent(ccState: $ccState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CameraControllerEvent &&
            (identical(other.ccState, ccState) || other.ccState == ccState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ccState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CameraControllerEventCopyWith<_$_CameraControllerEvent> get copyWith =>
      __$$_CameraControllerEventCopyWithImpl<_$_CameraControllerEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MeasureType type) initCamera,
    required TResult Function() takePhoto,
    required TResult Function() pickImage,
    required TResult Function(Stream<InclineMeasure>? stream)
        changeAllowTakePhoto,
    required TResult Function() send,
    required TResult Function(Offset offset) onViewFinderTap,
    required TResult Function(CameraControllerState ccState)
        cameraControllerEvent,
    required TResult Function() interrupt,
    required TResult Function() onSettingsTap,
    required TResult Function() dispose,
  }) {
    return cameraControllerEvent(ccState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MeasureType type)? initCamera,
    TResult? Function()? takePhoto,
    TResult? Function()? pickImage,
    TResult? Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult? Function()? send,
    TResult? Function(Offset offset)? onViewFinderTap,
    TResult? Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult? Function()? interrupt,
    TResult? Function()? onSettingsTap,
    TResult? Function()? dispose,
  }) {
    return cameraControllerEvent?.call(ccState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MeasureType type)? initCamera,
    TResult Function()? takePhoto,
    TResult Function()? pickImage,
    TResult Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult Function()? send,
    TResult Function(Offset offset)? onViewFinderTap,
    TResult Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult Function()? interrupt,
    TResult Function()? onSettingsTap,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (cameraControllerEvent != null) {
      return cameraControllerEvent(ccState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitCamera value) initCamera,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangeAllowTakePhoto value) changeAllowTakePhoto,
    required TResult Function(_Send value) send,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
    required TResult Function(_CameraControllerEvent value)
        cameraControllerEvent,
    required TResult Function(_Interrupt value) interrupt,
    required TResult Function(_OnSettingsTap value) onSettingsTap,
    required TResult Function(_Dispose value) dispose,
  }) {
    return cameraControllerEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitCamera value)? initCamera,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult? Function(_Send value)? send,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult? Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult? Function(_Interrupt value)? interrupt,
    TResult? Function(_OnSettingsTap value)? onSettingsTap,
    TResult? Function(_Dispose value)? dispose,
  }) {
    return cameraControllerEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCamera value)? initCamera,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult Function(_Send value)? send,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult Function(_Interrupt value)? interrupt,
    TResult Function(_OnSettingsTap value)? onSettingsTap,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (cameraControllerEvent != null) {
      return cameraControllerEvent(this);
    }
    return orElse();
  }
}

abstract class _CameraControllerEvent implements CameraEvent {
  const factory _CameraControllerEvent(final CameraControllerState ccState) =
      _$_CameraControllerEvent;

  CameraControllerState get ccState;
  @JsonKey(ignore: true)
  _$$_CameraControllerEventCopyWith<_$_CameraControllerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InterruptCopyWith<$Res> {
  factory _$$_InterruptCopyWith(
          _$_Interrupt value, $Res Function(_$_Interrupt) then) =
      __$$_InterruptCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InterruptCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res, _$_Interrupt>
    implements _$$_InterruptCopyWith<$Res> {
  __$$_InterruptCopyWithImpl(
      _$_Interrupt _value, $Res Function(_$_Interrupt) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Interrupt implements _Interrupt {
  const _$_Interrupt();

  @override
  String toString() {
    return 'CameraEvent.interrupt()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Interrupt);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MeasureType type) initCamera,
    required TResult Function() takePhoto,
    required TResult Function() pickImage,
    required TResult Function(Stream<InclineMeasure>? stream)
        changeAllowTakePhoto,
    required TResult Function() send,
    required TResult Function(Offset offset) onViewFinderTap,
    required TResult Function(CameraControllerState ccState)
        cameraControllerEvent,
    required TResult Function() interrupt,
    required TResult Function() onSettingsTap,
    required TResult Function() dispose,
  }) {
    return interrupt();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MeasureType type)? initCamera,
    TResult? Function()? takePhoto,
    TResult? Function()? pickImage,
    TResult? Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult? Function()? send,
    TResult? Function(Offset offset)? onViewFinderTap,
    TResult? Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult? Function()? interrupt,
    TResult? Function()? onSettingsTap,
    TResult? Function()? dispose,
  }) {
    return interrupt?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MeasureType type)? initCamera,
    TResult Function()? takePhoto,
    TResult Function()? pickImage,
    TResult Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult Function()? send,
    TResult Function(Offset offset)? onViewFinderTap,
    TResult Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult Function()? interrupt,
    TResult Function()? onSettingsTap,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (interrupt != null) {
      return interrupt();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitCamera value) initCamera,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangeAllowTakePhoto value) changeAllowTakePhoto,
    required TResult Function(_Send value) send,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
    required TResult Function(_CameraControllerEvent value)
        cameraControllerEvent,
    required TResult Function(_Interrupt value) interrupt,
    required TResult Function(_OnSettingsTap value) onSettingsTap,
    required TResult Function(_Dispose value) dispose,
  }) {
    return interrupt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitCamera value)? initCamera,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult? Function(_Send value)? send,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult? Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult? Function(_Interrupt value)? interrupt,
    TResult? Function(_OnSettingsTap value)? onSettingsTap,
    TResult? Function(_Dispose value)? dispose,
  }) {
    return interrupt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCamera value)? initCamera,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult Function(_Send value)? send,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult Function(_Interrupt value)? interrupt,
    TResult Function(_OnSettingsTap value)? onSettingsTap,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (interrupt != null) {
      return interrupt(this);
    }
    return orElse();
  }
}

abstract class _Interrupt implements CameraEvent {
  const factory _Interrupt() = _$_Interrupt;
}

/// @nodoc
abstract class _$$_OnSettingsTapCopyWith<$Res> {
  factory _$$_OnSettingsTapCopyWith(
          _$_OnSettingsTap value, $Res Function(_$_OnSettingsTap) then) =
      __$$_OnSettingsTapCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnSettingsTapCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res, _$_OnSettingsTap>
    implements _$$_OnSettingsTapCopyWith<$Res> {
  __$$_OnSettingsTapCopyWithImpl(
      _$_OnSettingsTap _value, $Res Function(_$_OnSettingsTap) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OnSettingsTap implements _OnSettingsTap {
  const _$_OnSettingsTap();

  @override
  String toString() {
    return 'CameraEvent.onSettingsTap()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnSettingsTap);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MeasureType type) initCamera,
    required TResult Function() takePhoto,
    required TResult Function() pickImage,
    required TResult Function(Stream<InclineMeasure>? stream)
        changeAllowTakePhoto,
    required TResult Function() send,
    required TResult Function(Offset offset) onViewFinderTap,
    required TResult Function(CameraControllerState ccState)
        cameraControllerEvent,
    required TResult Function() interrupt,
    required TResult Function() onSettingsTap,
    required TResult Function() dispose,
  }) {
    return onSettingsTap();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MeasureType type)? initCamera,
    TResult? Function()? takePhoto,
    TResult? Function()? pickImage,
    TResult? Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult? Function()? send,
    TResult? Function(Offset offset)? onViewFinderTap,
    TResult? Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult? Function()? interrupt,
    TResult? Function()? onSettingsTap,
    TResult? Function()? dispose,
  }) {
    return onSettingsTap?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MeasureType type)? initCamera,
    TResult Function()? takePhoto,
    TResult Function()? pickImage,
    TResult Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult Function()? send,
    TResult Function(Offset offset)? onViewFinderTap,
    TResult Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult Function()? interrupt,
    TResult Function()? onSettingsTap,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (onSettingsTap != null) {
      return onSettingsTap();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitCamera value) initCamera,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangeAllowTakePhoto value) changeAllowTakePhoto,
    required TResult Function(_Send value) send,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
    required TResult Function(_CameraControllerEvent value)
        cameraControllerEvent,
    required TResult Function(_Interrupt value) interrupt,
    required TResult Function(_OnSettingsTap value) onSettingsTap,
    required TResult Function(_Dispose value) dispose,
  }) {
    return onSettingsTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitCamera value)? initCamera,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult? Function(_Send value)? send,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult? Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult? Function(_Interrupt value)? interrupt,
    TResult? Function(_OnSettingsTap value)? onSettingsTap,
    TResult? Function(_Dispose value)? dispose,
  }) {
    return onSettingsTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCamera value)? initCamera,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult Function(_Send value)? send,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult Function(_Interrupt value)? interrupt,
    TResult Function(_OnSettingsTap value)? onSettingsTap,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (onSettingsTap != null) {
      return onSettingsTap(this);
    }
    return orElse();
  }
}

abstract class _OnSettingsTap implements CameraEvent {
  const factory _OnSettingsTap() = _$_OnSettingsTap;
}

/// @nodoc
abstract class _$$_DisposeCopyWith<$Res> {
  factory _$$_DisposeCopyWith(
          _$_Dispose value, $Res Function(_$_Dispose) then) =
      __$$_DisposeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisposeCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res, _$_Dispose>
    implements _$$_DisposeCopyWith<$Res> {
  __$$_DisposeCopyWithImpl(_$_Dispose _value, $Res Function(_$_Dispose) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Dispose implements _Dispose {
  const _$_Dispose();

  @override
  String toString() {
    return 'CameraEvent.dispose()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Dispose);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MeasureType type) initCamera,
    required TResult Function() takePhoto,
    required TResult Function() pickImage,
    required TResult Function(Stream<InclineMeasure>? stream)
        changeAllowTakePhoto,
    required TResult Function() send,
    required TResult Function(Offset offset) onViewFinderTap,
    required TResult Function(CameraControllerState ccState)
        cameraControllerEvent,
    required TResult Function() interrupt,
    required TResult Function() onSettingsTap,
    required TResult Function() dispose,
  }) {
    return dispose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MeasureType type)? initCamera,
    TResult? Function()? takePhoto,
    TResult? Function()? pickImage,
    TResult? Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult? Function()? send,
    TResult? Function(Offset offset)? onViewFinderTap,
    TResult? Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult? Function()? interrupt,
    TResult? Function()? onSettingsTap,
    TResult? Function()? dispose,
  }) {
    return dispose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MeasureType type)? initCamera,
    TResult Function()? takePhoto,
    TResult Function()? pickImage,
    TResult Function(Stream<InclineMeasure>? stream)? changeAllowTakePhoto,
    TResult Function()? send,
    TResult Function(Offset offset)? onViewFinderTap,
    TResult Function(CameraControllerState ccState)? cameraControllerEvent,
    TResult Function()? interrupt,
    TResult Function()? onSettingsTap,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitCamera value) initCamera,
    required TResult Function(_TakePhoto value) takePhoto,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_ChangeAllowTakePhoto value) changeAllowTakePhoto,
    required TResult Function(_Send value) send,
    required TResult Function(_OnViewFinderTap value) onViewFinderTap,
    required TResult Function(_CameraControllerEvent value)
        cameraControllerEvent,
    required TResult Function(_Interrupt value) interrupt,
    required TResult Function(_OnSettingsTap value) onSettingsTap,
    required TResult Function(_Dispose value) dispose,
  }) {
    return dispose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitCamera value)? initCamera,
    TResult? Function(_TakePhoto value)? takePhoto,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult? Function(_Send value)? send,
    TResult? Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult? Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult? Function(_Interrupt value)? interrupt,
    TResult? Function(_OnSettingsTap value)? onSettingsTap,
    TResult? Function(_Dispose value)? dispose,
  }) {
    return dispose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitCamera value)? initCamera,
    TResult Function(_TakePhoto value)? takePhoto,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_ChangeAllowTakePhoto value)? changeAllowTakePhoto,
    TResult Function(_Send value)? send,
    TResult Function(_OnViewFinderTap value)? onViewFinderTap,
    TResult Function(_CameraControllerEvent value)? cameraControllerEvent,
    TResult Function(_Interrupt value)? interrupt,
    TResult Function(_OnSettingsTap value)? onSettingsTap,
    TResult Function(_Dispose value)? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose(this);
    }
    return orElse();
  }
}

abstract class _Dispose implements CameraEvent {
  const factory _Dispose() = _$_Dispose;
}

/// @nodoc
mixin _$CameraState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() empty,
    required TResult Function() errorInit,
    required TResult Function(Stream<InclineMeasure>? inclineStream) ready,
    required TResult Function(HasImageSubState substate) hasImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? empty,
    TResult? Function()? errorInit,
    TResult? Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult? Function(HasImageSubState substate)? hasImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? empty,
    TResult Function()? errorInit,
    TResult Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult Function(HasImageSubState substate)? hasImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Empty value) empty,
    required TResult Function(_ErrorInit value) errorInit,
    required TResult Function(_Ready value) ready,
    required TResult Function(_HasImage value) hasImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_ErrorInit value)? errorInit,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_HasImage value)? hasImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Empty value)? empty,
    TResult Function(_ErrorInit value)? errorInit,
    TResult Function(_Ready value)? ready,
    TResult Function(_HasImage value)? hasImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraStateCopyWith<$Res> {
  factory $CameraStateCopyWith(
          CameraState value, $Res Function(CameraState) then) =
      _$CameraStateCopyWithImpl<$Res, CameraState>;
}

/// @nodoc
class _$CameraStateCopyWithImpl<$Res, $Val extends CameraState>
    implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializeCopyWith<$Res> {
  factory _$$_InitializeCopyWith(
          _$_Initialize value, $Res Function(_$_Initialize) then) =
      __$$_InitializeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializeCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res, _$_Initialize>
    implements _$$_InitializeCopyWith<$Res> {
  __$$_InitializeCopyWithImpl(
      _$_Initialize _value, $Res Function(_$_Initialize) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialize implements _Initialize {
  const _$_Initialize();

  @override
  String toString() {
    return 'CameraState.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() empty,
    required TResult Function() errorInit,
    required TResult Function(Stream<InclineMeasure>? inclineStream) ready,
    required TResult Function(HasImageSubState substate) hasImage,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? empty,
    TResult? Function()? errorInit,
    TResult? Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult? Function(HasImageSubState substate)? hasImage,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? empty,
    TResult Function()? errorInit,
    TResult Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult Function(HasImageSubState substate)? hasImage,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Empty value) empty,
    required TResult Function(_ErrorInit value) errorInit,
    required TResult Function(_Ready value) ready,
    required TResult Function(_HasImage value) hasImage,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_ErrorInit value)? errorInit,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_HasImage value)? hasImage,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Empty value)? empty,
    TResult Function(_ErrorInit value)? errorInit,
    TResult Function(_Ready value)? ready,
    TResult Function(_HasImage value)? hasImage,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements CameraState {
  const factory _Initialize() = _$_Initialize;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<$Res> {
  factory _$$_EmptyCopyWith(_$_Empty value, $Res Function(_$_Empty) then) =
      __$$_EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmptyCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res, _$_Empty>
    implements _$$_EmptyCopyWith<$Res> {
  __$$_EmptyCopyWithImpl(_$_Empty _value, $Res Function(_$_Empty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'CameraState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() empty,
    required TResult Function() errorInit,
    required TResult Function(Stream<InclineMeasure>? inclineStream) ready,
    required TResult Function(HasImageSubState substate) hasImage,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? empty,
    TResult? Function()? errorInit,
    TResult? Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult? Function(HasImageSubState substate)? hasImage,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? empty,
    TResult Function()? errorInit,
    TResult Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult Function(HasImageSubState substate)? hasImage,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Empty value) empty,
    required TResult Function(_ErrorInit value) errorInit,
    required TResult Function(_Ready value) ready,
    required TResult Function(_HasImage value) hasImage,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_ErrorInit value)? errorInit,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_HasImage value)? hasImage,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Empty value)? empty,
    TResult Function(_ErrorInit value)? errorInit,
    TResult Function(_Ready value)? ready,
    TResult Function(_HasImage value)? hasImage,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements CameraState {
  const factory _Empty() = _$_Empty;
}

/// @nodoc
abstract class _$$_ErrorInitCopyWith<$Res> {
  factory _$$_ErrorInitCopyWith(
          _$_ErrorInit value, $Res Function(_$_ErrorInit) then) =
      __$$_ErrorInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ErrorInitCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res, _$_ErrorInit>
    implements _$$_ErrorInitCopyWith<$Res> {
  __$$_ErrorInitCopyWithImpl(
      _$_ErrorInit _value, $Res Function(_$_ErrorInit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ErrorInit implements _ErrorInit {
  const _$_ErrorInit();

  @override
  String toString() {
    return 'CameraState.errorInit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ErrorInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() empty,
    required TResult Function() errorInit,
    required TResult Function(Stream<InclineMeasure>? inclineStream) ready,
    required TResult Function(HasImageSubState substate) hasImage,
  }) {
    return errorInit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? empty,
    TResult? Function()? errorInit,
    TResult? Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult? Function(HasImageSubState substate)? hasImage,
  }) {
    return errorInit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? empty,
    TResult Function()? errorInit,
    TResult Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult Function(HasImageSubState substate)? hasImage,
    required TResult orElse(),
  }) {
    if (errorInit != null) {
      return errorInit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Empty value) empty,
    required TResult Function(_ErrorInit value) errorInit,
    required TResult Function(_Ready value) ready,
    required TResult Function(_HasImage value) hasImage,
  }) {
    return errorInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_ErrorInit value)? errorInit,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_HasImage value)? hasImage,
  }) {
    return errorInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Empty value)? empty,
    TResult Function(_ErrorInit value)? errorInit,
    TResult Function(_Ready value)? ready,
    TResult Function(_HasImage value)? hasImage,
    required TResult orElse(),
  }) {
    if (errorInit != null) {
      return errorInit(this);
    }
    return orElse();
  }
}

abstract class _ErrorInit implements CameraState {
  const factory _ErrorInit() = _$_ErrorInit;
}

/// @nodoc
abstract class _$$_ReadyCopyWith<$Res> {
  factory _$$_ReadyCopyWith(_$_Ready value, $Res Function(_$_Ready) then) =
      __$$_ReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({Stream<InclineMeasure>? inclineStream});
}

/// @nodoc
class __$$_ReadyCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res, _$_Ready>
    implements _$$_ReadyCopyWith<$Res> {
  __$$_ReadyCopyWithImpl(_$_Ready _value, $Res Function(_$_Ready) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inclineStream = freezed,
  }) {
    return _then(_$_Ready(
      freezed == inclineStream
          ? _value.inclineStream
          : inclineStream // ignore: cast_nullable_to_non_nullable
              as Stream<InclineMeasure>?,
    ));
  }
}

/// @nodoc

class _$_Ready implements _Ready {
  const _$_Ready([this.inclineStream]);

  @override
  final Stream<InclineMeasure>? inclineStream;

  @override
  String toString() {
    return 'CameraState.ready(inclineStream: $inclineStream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ready &&
            (identical(other.inclineStream, inclineStream) ||
                other.inclineStream == inclineStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, inclineStream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadyCopyWith<_$_Ready> get copyWith =>
      __$$_ReadyCopyWithImpl<_$_Ready>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() empty,
    required TResult Function() errorInit,
    required TResult Function(Stream<InclineMeasure>? inclineStream) ready,
    required TResult Function(HasImageSubState substate) hasImage,
  }) {
    return ready(inclineStream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? empty,
    TResult? Function()? errorInit,
    TResult? Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult? Function(HasImageSubState substate)? hasImage,
  }) {
    return ready?.call(inclineStream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? empty,
    TResult Function()? errorInit,
    TResult Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult Function(HasImageSubState substate)? hasImage,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(inclineStream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Empty value) empty,
    required TResult Function(_ErrorInit value) errorInit,
    required TResult Function(_Ready value) ready,
    required TResult Function(_HasImage value) hasImage,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_ErrorInit value)? errorInit,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_HasImage value)? hasImage,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Empty value)? empty,
    TResult Function(_ErrorInit value)? errorInit,
    TResult Function(_Ready value)? ready,
    TResult Function(_HasImage value)? hasImage,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _Ready implements CameraState {
  const factory _Ready([final Stream<InclineMeasure>? inclineStream]) =
      _$_Ready;

  Stream<InclineMeasure>? get inclineStream;
  @JsonKey(ignore: true)
  _$$_ReadyCopyWith<_$_Ready> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_HasImageCopyWith<$Res> {
  factory _$$_HasImageCopyWith(
          _$_HasImage value, $Res Function(_$_HasImage) then) =
      __$$_HasImageCopyWithImpl<$Res>;
  @useResult
  $Res call({HasImageSubState substate});
}

/// @nodoc
class __$$_HasImageCopyWithImpl<$Res>
    extends _$CameraStateCopyWithImpl<$Res, _$_HasImage>
    implements _$$_HasImageCopyWith<$Res> {
  __$$_HasImageCopyWithImpl(
      _$_HasImage _value, $Res Function(_$_HasImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? substate = null,
  }) {
    return _then(_$_HasImage(
      null == substate
          ? _value.substate
          : substate // ignore: cast_nullable_to_non_nullable
              as HasImageSubState,
    ));
  }
}

/// @nodoc

class _$_HasImage implements _HasImage {
  const _$_HasImage(this.substate);

  @override
  final HasImageSubState substate;

  @override
  String toString() {
    return 'CameraState.hasImage(substate: $substate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HasImage &&
            (identical(other.substate, substate) ||
                other.substate == substate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, substate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HasImageCopyWith<_$_HasImage> get copyWith =>
      __$$_HasImageCopyWithImpl<_$_HasImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() empty,
    required TResult Function() errorInit,
    required TResult Function(Stream<InclineMeasure>? inclineStream) ready,
    required TResult Function(HasImageSubState substate) hasImage,
  }) {
    return hasImage(substate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? empty,
    TResult? Function()? errorInit,
    TResult? Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult? Function(HasImageSubState substate)? hasImage,
  }) {
    return hasImage?.call(substate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? empty,
    TResult Function()? errorInit,
    TResult Function(Stream<InclineMeasure>? inclineStream)? ready,
    TResult Function(HasImageSubState substate)? hasImage,
    required TResult orElse(),
  }) {
    if (hasImage != null) {
      return hasImage(substate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Empty value) empty,
    required TResult Function(_ErrorInit value) errorInit,
    required TResult Function(_Ready value) ready,
    required TResult Function(_HasImage value) hasImage,
  }) {
    return hasImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_ErrorInit value)? errorInit,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_HasImage value)? hasImage,
  }) {
    return hasImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Empty value)? empty,
    TResult Function(_ErrorInit value)? errorInit,
    TResult Function(_Ready value)? ready,
    TResult Function(_HasImage value)? hasImage,
    required TResult orElse(),
  }) {
    if (hasImage != null) {
      return hasImage(this);
    }
    return orElse();
  }
}

abstract class _HasImage implements CameraState {
  const factory _HasImage(final HasImageSubState substate) = _$_HasImage;

  HasImageSubState get substate;
  @JsonKey(ignore: true)
  _$$_HasImageCopyWith<_$_HasImage> get copyWith =>
      throw _privateConstructorUsedError;
}
