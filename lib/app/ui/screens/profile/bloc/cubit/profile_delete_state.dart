part of 'profile_delete_cubit.dart';

@freezed
class ProfileDeleteState with _$ProfileDeleteState {
  const factory ProfileDeleteState.initial() = ProfileDeleteInitial;
  const factory ProfileDeleteState.progress() = ProfileDeleteProgress;
  const factory ProfileDeleteState.success() = ProfileDeleteSuccess;
  const factory ProfileDeleteState.needReauth() = ProfileDeleteNeedReauth;
  const factory ProfileDeleteState.errorDelete() = ProfileDeleteError;
}
