part of 'parameters_measure_bloc.dart';

@freezed
sealed class ParametersMeasureState with _$ParametersMeasureState {
  const factory ParametersMeasureState.initial() = ParametersMeasureInitial;
  const factory ParametersMeasureState.loading() = ParametersMeasureLoading;
  const factory ParametersMeasureState.loaded({
    required List<InputSelectAdapterLocation> locations,
    required List<InputSelectAdapterSortiment> sortiment,
    required List<InputSelectAdapterBread> bread,
    required List<InputSelectAdapterVehicleType> vehicleType,
    // SaveError? error,
  }) = ParametersMeasureLoaded;
  const factory ParametersMeasureState.error() = ParametersMeasureErrorLoading;
}

class SaveSubstate {}
