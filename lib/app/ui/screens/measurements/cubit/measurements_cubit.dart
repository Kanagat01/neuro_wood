import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_measurements_repository.dart';
import 'package:neuro_wood/core/helpers/extensions.dart';
part 'measurements_state.dart';
part 'measurements_cubit.freezed.dart';

class MeasurementsCubit extends Cubit<MeasurementsState> {
  MeasurementsCubit({required this.measurementsRepository})
    : super(const MeasurementsState.initial());

  final IMeasurementsRepository measurementsRepository;

  getAll() {
    emit(const MeasurementsState.loading());
    measurementsRepository.getStreamMeasurements().listen((event) {
      if (event != null && event.isNotEmpty) {
        event.sort((a, b) => b.dateTime.compareTo(a.dateTime));
        emit(MeasurementsState.loaded(_group(event)));
      } else {
        emit(const MeasurementsState.empty());
      }
    });
  }

  Map<DateTime, List<MeasureResultEntityBase>> _group(
    List<MeasureResultEntityBase> source,
  ) {
    Map<DateTime, List<MeasureResultEntityBase>> result = {};
    for (var e in source) {
      DateTime d = e.dateTime.getDate;
      if (result.containsKey(d)) {
        result[d]!.add(e);
      } else {
        result[d] = [e];
      }
    }
    return result;
  }
}
