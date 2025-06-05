part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.hasData(UserEntity user) = _HasData;
  const factory ProfileState.error() = _Error;
}
