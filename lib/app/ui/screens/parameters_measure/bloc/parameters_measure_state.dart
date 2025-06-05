part of 'parameters_measure_bloc.dart';

@freezed
class ParametersMeasureState with _$ParametersMeasureState {
  const factory ParametersMeasureState.initial() = Initial;
  const factory ParametersMeasureState.loading() = Loading;
  const factory ParametersMeasureState.loaded({
    required List<InputSelectAdapterLocation> locations,
    required List<InputSelectAdapterSortiment> sortiment,
    required List<InputSelectAdapterBread> bread,
    required List<InputSelectAdapterVehicleType> vehicleType,
    // SaveError? error,
  }) = Loaded;
  const factory ParametersMeasureState.error() = ErrorLoading;
}

class SaveSubstate{
  
}