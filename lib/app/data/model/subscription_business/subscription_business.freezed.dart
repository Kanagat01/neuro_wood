// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_business.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionBusiness {

@JsonKey(name: 'is_default') bool get isDefault; String get name;@JsonKey(name: 'num_measurements') int get numMeasurements; num get price; String get unit;
/// Create a copy of SubscriptionBusiness
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionBusinessCopyWith<SubscriptionBusiness> get copyWith => _$SubscriptionBusinessCopyWithImpl<SubscriptionBusiness>(this as SubscriptionBusiness, _$identity);

  /// Serializes this SubscriptionBusiness to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionBusiness&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.name, name) || other.name == name)&&(identical(other.numMeasurements, numMeasurements) || other.numMeasurements == numMeasurements)&&(identical(other.price, price) || other.price == price)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDefault,name,numMeasurements,price,unit);

@override
String toString() {
  return 'SubscriptionBusiness(isDefault: $isDefault, name: $name, numMeasurements: $numMeasurements, price: $price, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $SubscriptionBusinessCopyWith<$Res>  {
  factory $SubscriptionBusinessCopyWith(SubscriptionBusiness value, $Res Function(SubscriptionBusiness) _then) = _$SubscriptionBusinessCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_default') bool isDefault, String name,@JsonKey(name: 'num_measurements') int numMeasurements, num price, String unit
});




}
/// @nodoc
class _$SubscriptionBusinessCopyWithImpl<$Res>
    implements $SubscriptionBusinessCopyWith<$Res> {
  _$SubscriptionBusinessCopyWithImpl(this._self, this._then);

  final SubscriptionBusiness _self;
  final $Res Function(SubscriptionBusiness) _then;

/// Create a copy of SubscriptionBusiness
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDefault = null,Object? name = null,Object? numMeasurements = null,Object? price = null,Object? unit = null,}) {
  return _then(_self.copyWith(
isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,numMeasurements: null == numMeasurements ? _self.numMeasurements : numMeasurements // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SubscriptionBusiness extends SubscriptionBusiness {
   _SubscriptionBusiness({@JsonKey(name: 'is_default') this.isDefault = false, required this.name, @JsonKey(name: 'num_measurements') required this.numMeasurements, required this.price, required this.unit}): super._();
  factory _SubscriptionBusiness.fromJson(Map<String, dynamic> json) => _$SubscriptionBusinessFromJson(json);

@override@JsonKey(name: 'is_default') final  bool isDefault;
@override final  String name;
@override@JsonKey(name: 'num_measurements') final  int numMeasurements;
@override final  num price;
@override final  String unit;

/// Create a copy of SubscriptionBusiness
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionBusinessCopyWith<_SubscriptionBusiness> get copyWith => __$SubscriptionBusinessCopyWithImpl<_SubscriptionBusiness>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionBusinessToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionBusiness&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.name, name) || other.name == name)&&(identical(other.numMeasurements, numMeasurements) || other.numMeasurements == numMeasurements)&&(identical(other.price, price) || other.price == price)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDefault,name,numMeasurements,price,unit);

@override
String toString() {
  return 'SubscriptionBusiness(isDefault: $isDefault, name: $name, numMeasurements: $numMeasurements, price: $price, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionBusinessCopyWith<$Res> implements $SubscriptionBusinessCopyWith<$Res> {
  factory _$SubscriptionBusinessCopyWith(_SubscriptionBusiness value, $Res Function(_SubscriptionBusiness) _then) = __$SubscriptionBusinessCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_default') bool isDefault, String name,@JsonKey(name: 'num_measurements') int numMeasurements, num price, String unit
});




}
/// @nodoc
class __$SubscriptionBusinessCopyWithImpl<$Res>
    implements _$SubscriptionBusinessCopyWith<$Res> {
  __$SubscriptionBusinessCopyWithImpl(this._self, this._then);

  final _SubscriptionBusiness _self;
  final $Res Function(_SubscriptionBusiness) _then;

/// Create a copy of SubscriptionBusiness
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDefault = null,Object? name = null,Object? numMeasurements = null,Object? price = null,Object? unit = null,}) {
  return _then(_SubscriptionBusiness(
isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,numMeasurements: null == numMeasurements ? _self.numMeasurements : numMeasurements // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
