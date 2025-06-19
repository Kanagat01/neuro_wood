part of 'report_saver_cubit.dart';

@freezed
class ReportSaverState with _$ReportSaverState {
  const factory ReportSaverState.initial() = ReportSaverInitial;
  const factory ReportSaverState.inProgress() = ReportSaverInProgress;
  const factory ReportSaverState.saved() = ReportSaved;
  const factory ReportSaverState.error() = ReportSaverError;
}
