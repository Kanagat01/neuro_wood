part of 'report_saver_cubit.dart';

@freezed
class ReportSaverState with _$ReportSaverState {
  const factory ReportSaverState.initial() = _Initial;
  const factory ReportSaverState.inProgress() = _InProgress;
  const factory ReportSaverState.saved() = _Saved;
  const factory ReportSaverState.error() = _Error;
}
