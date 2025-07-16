part of 'report_builder_cubit.dart';

@freezed
class ReportBuilderState with _$ReportBuilderState {
  const factory ReportBuilderState.initial() = ReportBuilderInitial;
  const factory ReportBuilderState.loading() = ReportBuilderLoading;
  const factory ReportBuilderState.loaded(File report) = ReportBuilderLoaded;
  const factory ReportBuilderState.error() = ReportBuilderError;
}
