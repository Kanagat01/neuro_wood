part of 'measurements_cubit.dart';



@freezed
class MeasurementsState with _$MeasurementsState {
  const factory MeasurementsState.initial() = _Initial;
  const factory MeasurementsState.loaded(Map<DateTime, List<MeasureResultEntityBase>> list) = _Loaded;
  const factory MeasurementsState.loading() = _Loading;
  const factory MeasurementsState.empty() = _Empty;
}
