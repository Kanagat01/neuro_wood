part of 'subscribtions_cubit.dart';

@freezed
class SubscribtionsState with _$SubscribtionsState {
  const factory SubscribtionsState.initial() = SubscribtionsInitial;
  const factory SubscribtionsState.loading() = SubscribtionsLoading;
  const factory SubscribtionsState.loaded(List<TariffEntity> tariffs) =
      SubscribtionsLoaded;
  const factory SubscribtionsState.error() = SubscribtionsError;
}
