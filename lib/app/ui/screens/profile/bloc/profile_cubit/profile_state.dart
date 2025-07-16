part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.hasData(UserEntity user) = ProfileHasData;
  const factory ProfileState.error() = ProfileError;
}
