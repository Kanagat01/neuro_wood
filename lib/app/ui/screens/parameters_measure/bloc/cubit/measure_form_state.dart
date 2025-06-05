part of 'measure_form_cubit.dart';

// enum MeasureFormState {
//   initial,
//   invalid,
//   valid,
// }

@freezed
class MeasureFormState with _$MeasureFormState {
  const factory MeasureFormState.initial() = Initial;
  const factory MeasureFormState.invalid() = Invalid;
  const factory MeasureFormState.valid() = Valid;
}
