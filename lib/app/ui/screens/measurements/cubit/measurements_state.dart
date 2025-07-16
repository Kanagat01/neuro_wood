part of 'measurements_cubit.dart';

@freezed
sealed class MeasurementsState with _$MeasurementsState {
  const factory MeasurementsState.initial() = MeasurementsInitial;
  const factory MeasurementsState.loaded(
    Map<DateTime, List<MeasureResultEntityBase>> list,
  ) = MeasurementsLoaded;
  const factory MeasurementsState.loading() = MeasurementsLoading;
  const factory MeasurementsState.empty() = MeasurementsEmpty;
}
