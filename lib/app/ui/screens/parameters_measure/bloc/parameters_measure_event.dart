part of 'parameters_measure_bloc.dart';

@freezed
class ParametersMeasureEvent with _$ParametersMeasureEvent {
  const factory ParametersMeasureEvent.load() = _Load;
  const factory ParametersMeasureEvent.apply() = _Apply;
}
