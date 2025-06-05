part of 'profile_delete_cubit.dart';

@freezed
class ProfileDeleteState with _$ProfileDeleteState {
  const factory ProfileDeleteState.initial() = _Initial;
  const factory ProfileDeleteState.progress() = _Progress;
  const factory ProfileDeleteState.success() = _Success;
  const factory ProfileDeleteState.needReauth() = _NeedReauth;
  const factory ProfileDeleteState.errorDelete() = _ErrorDelete;
}
