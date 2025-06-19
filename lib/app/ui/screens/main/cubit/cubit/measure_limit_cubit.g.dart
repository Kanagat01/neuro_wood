// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure_limit_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MeasureLimitState _$MeasureLimitStateFromJson(Map<String, dynamic> json) =>
    _MeasureLimitState(
      totalCount: (json['totalCount'] as num).toInt(),
      leftCount: (json['leftCount'] as num).toInt(),
      showBlock: json['showBlock'] as bool,
      isFree: json['isFree'] as bool,
    );

Map<String, dynamic> _$MeasureLimitStateToJson(_MeasureLimitState instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'leftCount': instance.leftCount,
      'showBlock': instance.showBlock,
      'isFree': instance.isFree,
    };
