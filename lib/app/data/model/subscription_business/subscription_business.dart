// import 'package:freezed_annotation/freezed_annotation.dart';

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_business.freezed.dart';
part 'subscription_business.g.dart';

@freezed
abstract class SubscriptionBusiness with _$SubscriptionBusiness {
  const SubscriptionBusiness._();

  factory SubscriptionBusiness({
    @JsonKey(name: 'is_default') @Default(false) bool isDefault,
    required String name,
    @JsonKey(name: 'num_measurements') required int numMeasurements,
    required num price,
    required String unit,
  }) = _SubscriptionBusiness;

  factory SubscriptionBusiness.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionBusinessFromJson(json);
}
