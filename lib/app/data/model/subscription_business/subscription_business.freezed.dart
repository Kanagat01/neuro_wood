// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subscription_business.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubscriptionBusiness _$SubscriptionBusinessFromJson(Map<String, dynamic> json) {
  return _SubscriptionBusiness.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionBusiness {
  @JsonKey(name: 'is_default')
  bool get isDefault => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_measurements')
  int get numMeasurements => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionBusinessCopyWith<SubscriptionBusiness> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionBusinessCopyWith<$Res> {
  factory $SubscriptionBusinessCopyWith(SubscriptionBusiness value,
          $Res Function(SubscriptionBusiness) then) =
      _$SubscriptionBusinessCopyWithImpl<$Res, SubscriptionBusiness>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_default') bool isDefault,
      String name,
      @JsonKey(name: 'num_measurements') int numMeasurements,
      num price,
      String unit});
}

/// @nodoc
class _$SubscriptionBusinessCopyWithImpl<$Res,
        $Val extends SubscriptionBusiness>
    implements $SubscriptionBusinessCopyWith<$Res> {
  _$SubscriptionBusinessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDefault = null,
    Object? name = null,
    Object? numMeasurements = null,
    Object? price = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numMeasurements: null == numMeasurements
          ? _value.numMeasurements
          : numMeasurements // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubscriptionBusinessCopyWith<$Res>
    implements $SubscriptionBusinessCopyWith<$Res> {
  factory _$$_SubscriptionBusinessCopyWith(_$_SubscriptionBusiness value,
          $Res Function(_$_SubscriptionBusiness) then) =
      __$$_SubscriptionBusinessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_default') bool isDefault,
      String name,
      @JsonKey(name: 'num_measurements') int numMeasurements,
      num price,
      String unit});
}

/// @nodoc
class __$$_SubscriptionBusinessCopyWithImpl<$Res>
    extends _$SubscriptionBusinessCopyWithImpl<$Res, _$_SubscriptionBusiness>
    implements _$$_SubscriptionBusinessCopyWith<$Res> {
  __$$_SubscriptionBusinessCopyWithImpl(_$_SubscriptionBusiness _value,
      $Res Function(_$_SubscriptionBusiness) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDefault = null,
    Object? name = null,
    Object? numMeasurements = null,
    Object? price = null,
    Object? unit = null,
  }) {
    return _then(_$_SubscriptionBusiness(
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numMeasurements: null == numMeasurements
          ? _value.numMeasurements
          : numMeasurements // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubscriptionBusiness implements _SubscriptionBusiness {
  _$_SubscriptionBusiness(
      {@JsonKey(name: 'is_default') this.isDefault = false,
      required this.name,
      @JsonKey(name: 'num_measurements') required this.numMeasurements,
      required this.price,
      required this.unit});

  factory _$_SubscriptionBusiness.fromJson(Map<String, dynamic> json) =>
      _$$_SubscriptionBusinessFromJson(json);

  @override
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @override
  final String name;
  @override
  @JsonKey(name: 'num_measurements')
  final int numMeasurements;
  @override
  final num price;
  @override
  final String unit;

  @override
  String toString() {
    return 'SubscriptionBusiness(isDefault: $isDefault, name: $name, numMeasurements: $numMeasurements, price: $price, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubscriptionBusiness &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.numMeasurements, numMeasurements) ||
                other.numMeasurements == numMeasurements) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isDefault, name, numMeasurements, price, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubscriptionBusinessCopyWith<_$_SubscriptionBusiness> get copyWith =>
      __$$_SubscriptionBusinessCopyWithImpl<_$_SubscriptionBusiness>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscriptionBusinessToJson(
      this,
    );
  }
}

abstract class _SubscriptionBusiness implements SubscriptionBusiness {
  factory _SubscriptionBusiness(
      {@JsonKey(name: 'is_default') final bool isDefault,
      required final String name,
      @JsonKey(name: 'num_measurements') required final int numMeasurements,
      required final num price,
      required final String unit}) = _$_SubscriptionBusiness;

  factory _SubscriptionBusiness.fromJson(Map<String, dynamic> json) =
      _$_SubscriptionBusiness.fromJson;

  @override
  @JsonKey(name: 'is_default')
  bool get isDefault;
  @override
  String get name;
  @override
  @JsonKey(name: 'num_measurements')
  int get numMeasurements;
  @override
  num get price;
  @override
  String get unit;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionBusinessCopyWith<_$_SubscriptionBusiness> get copyWith =>
      throw _privateConstructorUsedError;
}
