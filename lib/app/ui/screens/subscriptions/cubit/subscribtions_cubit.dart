import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/tariff_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_subscriptions_repository.dart';

part 'subscribtions_state.dart';
part 'subscribtions_cubit.freezed.dart';

class SubscribtionsCubit extends Cubit<SubscribtionsState> {
  final ISubscriptionsRepository subscriptionsRepository;
  SubscribtionsCubit({required this.subscriptionsRepository})
    : super(const SubscribtionsState.initial());

  load() async {
    emit(const SubscribtionsState.loading());
    final res = await subscriptionsRepository.getSubscriptions();
    res.fold(
      (l) => emit(const SubscribtionsState.error()),
      (r) => emit(SubscribtionsState.loaded(r)),
    );
  }
}
