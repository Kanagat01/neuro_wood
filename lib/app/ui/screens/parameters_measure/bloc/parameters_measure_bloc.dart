import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/measure_request_builder.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/app/domain/entities/stream_ticker.dart';

import 'package:neuro_wood/app/domain/repositories/i_parameters_measure_repository.dart';
import 'package:neuro_wood/app/ui/screens/main/cubit/cubit/measure_limit_cubit.dart';
import 'package:neuro_wood/app/ui/screens/parameters_measure/adapters/adapters.dart';
import 'package:neuro_wood/app/ui/screens/parameters_measure/cubit/multi_selector_dictionary_cubit.dart';
import 'package:neuro_wood/app/ui/screens/parameters_measure/cubit/selector_dictionary_cubit.dart';
import 'package:rxdart/subjects.dart';

import 'cubit/measure_form_cubit.dart';
export 'cubit/measure_form_cubit.dart';

part 'parameters_measure_event.dart';
part 'parameters_measure_state.dart';
part 'parameters_measure_bloc.freezed.dart';

class ProgressStateCubit extends Cubit<ProgressState> {
  ProgressStateCubit({
    ProgressState progressState = const ProgressState.started(),
  }) : super(progressState);

  set(ProgressState value) => emit(value);
}

@freezed
class ProgressState with _$ProgressState {
  const factory ProgressState.started() = Started;
  const factory ProgressState.inProgress(Stream<int> sendingProgress) =
      InProgress;
  const factory ProgressState.success() = Success;
  const factory ProgressState.finish(MeasureResultEntityFinish result) = Finish;
  const factory ProgressState.error(String message) = ProgressError;
}
// enum ProgressState {
//   inProgress,
//   success,
//   error,
//   finish,
// }

class ParametersMeasureBloc
    extends Bloc<ParametersMeasureEvent, ParametersMeasureState> {
  final IParametersMeasureRepository parametersMeasureRepository;
  Stream<MeasureResultEntityBase?>? resultStream;
  final MeasureResultEntityBase measure;

  final MeasureFormCubit formLogic = MeasureFormCubit();
  late ProgressStateCubit progressStateCubit;

  late SelectorDictionaryCubit<InputSelectAdapterLocation> locationValue;
  late SelectorDictionaryCubit<InputSelectAdapterSortiment> sortimentValue;
  late MultiSelectorDictionaryCubit<InputSelectAdapterBread> breadValue;
  late SelectorDictionaryCubit<InputSelectAdapterVehicleType?> vehicleTypeValue;
  final MeasureRequestBuilder builder = MeasureRequestBuilder();
  StreamSubscription<MeasureResultEntityBase?>? _subscriptionResult;
  final MeasureLimitCubit measureLimitCubit;

  final StreamTicker _ticker = const StreamTicker();
  StreamSubscription<int>? _subscription;
  final BehaviorSubject<int> _tickerSubject = BehaviorSubject<int>();

  TextEditingController get lengthController => formLogic.lengthController;
  TextEditingController get providerController => formLogic.providerController;
  TextEditingController get carNumberController =>
      formLogic.carNumberController;

  ParametersMeasureBloc({
    required this.parametersMeasureRepository,
    this.resultStream,
    required this.measure,
    required this.measureLimitCubit,
  }) : super(const ParametersMeasureState.initial()) {
    on<_Load>(_load2);
    on<_Apply>(_apply);
    carNumberController.text = measure.licensePlateText.trim();
    progressStateCubit = ProgressStateCubit(progressState: _mapState(measure));
    _subscriptionResult = resultStream?.listen((event) {
      log('LISTEN1: $event');
      if (event != null) {
        final s = _mapState(event);
        log('setState $s');
        progressStateCubit.set(s);
      }
    });
  }

  _startPreloader() async {
    _subscription?.cancel();
    _tickerSubject.sink.add(0);
    _subscription = _ticker.tickInk().asBroadcastStream().listen((int v) {
      if (v > 60) {
        _subscription?.cancel();
        progressStateCubit.set(
          const ProgressState.error(
            'Возникла ошибка во время распознавания. Повторите попытку позже',
          ),
        );
      } else {
        _tickerSubject.sink.add(v);
      }
    });
  }

  ProgressState _mapState(MeasureResultEntityBase m) {
    final bool hasFrontData = m.hasFrontData;
    if (m is MeasureResultEntityInProgress) {
      if (hasFrontData) {
        _startPreloader();
        return ProgressState.inProgress(_tickerSubject.stream);
      } else {
        return const ProgressState.started();
      }
    } else if (m is MeasureResultEntityError) {
      _subscription?.cancel();
      return ProgressState.error(
        m.errorMessage ?? 'Возникла ошибка во время распознавания',
      );
    } else if (m is MeasureResultEntityFinish) {
      _subscription?.cancel();
      return ProgressState.finish(m);
    } else {
      return const ProgressState.started();
    }
  }

  _load2(_Load event, Emitter<ParametersMeasureState> emit) async {
    emit(const ParametersMeasureState.loading());
    final allData = await parametersMeasureRepository.getAllParameters();

    allData.fold((l) => emit(const ParametersMeasureState.error()), (r) {
      // builder.baseUrl = r.baseUrl;
      List<InputSelectAdapterLocation> locations = r.locations
          .map((e) => InputSelectAdapterLocation(e))
          .toList();
      List<InputSelectAdapterSortiment> sortiments = r.sortiment
          .map((e) => InputSelectAdapterSortiment(e))
          .toList();
      List<InputSelectAdapterBread> breads = r.breads
          .map((e) => InputSelectAdapterBread(e))
          .toList();
      List<InputSelectAdapterVehicleType> vehicleTypes = r.vehicleTypes
          .map((e) => InputSelectAdapterVehicleType(e))
          .toList();

      final selectedLocation = locations.firstWhere((e) => e.canSelect);
      final selectedSortiment = sortiments.firstWhere((e) => e.canSelect);
      final selectedBread = breads.firstWhere((e) => e.canSelect);
      builder.location = selectedLocation.value;
      builder.timberType = selectedSortiment.value;
      builder.treeSpecies = [selectedBread.value];
      locationValue =
          SelectorDictionaryCubit<InputSelectAdapterLocation>(selectedLocation)
            ..stream.listen((event) {
              builder.location = event?.value;
            });
      sortimentValue =
          SelectorDictionaryCubit<InputSelectAdapterSortiment>(
              selectedSortiment,
            )
            ..stream.listen((event) {
              builder.timberType = event?.value;
            });
      breadValue =
          MultiSelectorDictionaryCubit<InputSelectAdapterBread>([selectedBread])
            ..stream.listen((event) {
              builder.treeSpecies = event?.map((e) => e.value).toList();
            });
      vehicleTypeValue =
          SelectorDictionaryCubit<InputSelectAdapterVehicleType>(null)
            ..stream.listen((event) {
              builder.vehicleType = event?.value;
            });
      emit(
        ParametersMeasureState.loaded(
          locations: locations,
          sortiment: sortiments,
          bread: breads,
          vehicleType: vehicleTypes,
        ),
      );
    });
  }

  _apply(_Apply event, Emitter<ParametersMeasureState> emit) async {
    formLogic.check(builder);
    final s = formLogic.state;
    // final s = await formLogic.stream.first;
    if (s is Valid) {
      final req = await builder.build(measure.type);
      _startPreloader();
      progressStateCubit.set(ProgressState.inProgress(_tickerSubject.stream));
      if (_subscriptionResult == null) {
        resultStream = parametersMeasureRepository.getStreamMeasurements(
          measure.measureId,
        );
        _subscriptionResult = resultStream?.listen((event) {
          log('LISTEN2: $event');
          if (event != null) {
            final s = _mapState(event);
            log('setState2 $s');
            progressStateCubit.set(s);
          }
        });
      }
      final res = await parametersMeasureRepository.setMeasureData(
        measure.measureId,
        req,
      );
      res.fold(
        (l) => progressStateCubit.set(
          const ProgressState.error(
            'Не удалось сохранить данные. Повторите попытку через несколько секунд',
          ),
        ),
        (r) => null,
      );
    } else {}
  }

  void addRecognition(double volume) {
    measureLimitCubit.addRecognition(volume);
  }
}
