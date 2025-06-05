// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubscriptionBusiness _$$_SubscriptionBusinessFromJson(
        Map<String, dynamic> json) =>
    _$_SubscriptionBusiness(
      isDefault: json['is_default'] as bool? ?? false,
      name: json['name'] as String,
      numMeasurements: json['num_measurements'] as int,
      price: json['price'] as num,
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$$_SubscriptionBusinessToJson(
        _$_SubscriptionBusiness instance) =>
    <String, dynamic>{
      'is_default': instance.isDefault,
      'name': instance.name,
      'num_measurements': instance.numMeasurements,
      'price': instance.price,
      'unit': instance.unit,
    };
