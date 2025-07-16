part of 'measure_limit_cubit.dart';

@freezed
abstract class MeasureLimitState with _$MeasureLimitState {
  const factory MeasureLimitState({
    required int totalCount,
    required int leftCount,
    required bool showBlock,
    required bool isFree,
  }) = _MeasureLimitState;

  factory MeasureLimitState.fromJson(Map<String, dynamic> json) =>
      _$MeasureLimitStateFromJson(json);
}
