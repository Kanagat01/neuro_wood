import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/measure_request_builder.dart';
import 'package:neuro_wood/core/buisness_constraints.dart';

part 'measure_form_state.dart';
part 'measure_form_cubit.freezed.dart';

class MeasureFormCubit extends Cubit<MeasureFormState> {
  MeasureFormCubit() : super(const MeasureFormState.initial());
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController providerController = TextEditingController();
  final TextEditingController carNumberController = TextEditingController();

  void check(MeasureRequestBuilder builder) {
    String length = lengthController.text.replaceAll(RegExp(r'[^0-9]'), '');
    int numb = int.tryParse(length) ?? 0;
    String provider = providerController.text.trim();
    String carNumber = carNumberController.text.trim();
    if (length.isEmpty ||
        numb < BuisnessConstraints.minLengthLoggingTruck ||
        numb > BuisnessConstraints.maxLengthLoggingTruck) {
      emit(const MeasureFormState.invalid());
    } else {
      // int val = int.parse(length);
      builder.length = numb;
      builder.provider = provider;
      builder.carNumber = carNumber;
      if (builder.treeSpecies?.isEmpty ?? true) {
        emit(const MeasureFormState.invalid());
        return;
      }
      emit(const MeasureFormState.valid());
      // emit(const MeasureFormState.initial());
    }
  }
}
