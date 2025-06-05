part of 'subscribtions_cubit.dart';

@freezed
class SubscribtionsState with _$SubscribtionsState {
  const factory SubscribtionsState.initial() = _Initial;
  const factory SubscribtionsState.loading() = _Loading;
  const factory SubscribtionsState.loaded(List<TariffEntity> tariffs) = _Loaded;
  const factory SubscribtionsState.error() = _Error;
}
