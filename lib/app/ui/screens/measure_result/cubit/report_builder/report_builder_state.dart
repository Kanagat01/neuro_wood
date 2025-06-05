part of 'report_builder_cubit.dart';

@freezed
class ReportBuilderState with _$ReportBuilderState {
  const factory ReportBuilderState.initial() = _Initial;
  const factory ReportBuilderState.loading() = _Loadng;
  const factory ReportBuilderState.loaded(File report) = _Loaded;
  const factory ReportBuilderState.error() = _Error;
}
