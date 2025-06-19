import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/app/domain/entities/measure_type.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_parameters_measure_repository.dart';
import 'package:neuro_wood/app/ui/screens/camera/widgets/overlay_preloader.dart';
import 'package:neuro_wood/app/ui/screens/main/cubit/cubit/measure_limit_cubit.dart';
import 'package:neuro_wood/app/ui/screens/parameters_measure/bloc/parameters_measure_bloc.dart';
import 'package:neuro_wood/app/ui/screens/parameters_measure/cubit/selector_dictionary_cubit.dart';
import 'package:neuro_wood/app/ui/screens/parameters_measure/widgets/input_select.dart';
import 'package:neuro_wood/app/ui/widgets/leading_button.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';
import 'package:neuro_wood/app/ui/widgets/primary_text_input.dart';
import 'package:neuro_wood/core/buisness_constraints.dart';
import 'package:neuro_wood/core/injection.dart';

import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';

import 'adapters/adapters.dart';
import 'cubit/multi_selector_dictionary_cubit.dart';

class ParametersMeasureScreen extends StatelessWidget {
  final Stream<MeasureResultEntityBase?>? resultStream;
  final MeasureResultEntityBase measure;

  const ParametersMeasureScreen({
    super.key,
    this.resultStream,
    required this.measure,
  });

  Future _showErrorRecognize({
    required BuildContext context,
    required String text,
  }) {
    return Dialogs.showDialogMessage(
      context: context,
      barrierDismissible: false,
      title: "thereWasAnErrorTitle".tr(),
      text: text,
      actions: [
        DialogAction(
          onPressed: () => Navigator.of(context).pop(true),
          title: "okButton".tr(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double pt = MediaQuery.of(context).viewPadding.top;
    return BlocProvider(
      create: (context) => ParametersMeasureBloc(
        parametersMeasureRepository: getIt.get<IParametersMeasureRepository>(),
        measureLimitCubit: getIt.get<MeasureLimitCubit>(),
        resultStream: resultStream,
        measure: measure,
      )..add(const ParametersMeasureEvent.load()),
      child: BlocBuilder<ParametersMeasureBloc, ParametersMeasureState>(
        builder: (context, parametersMeasureState) {
          final bloc = context.read<ParametersMeasureBloc>();
          return BlocConsumer<ProgressStateCubit, ProgressState>(
            bloc: bloc.progressStateCubit,
            listener: (context, progressState) {
              switch (progressState) {
                case Finish(:final result):
                  bloc.addRecognition(result.woodVolumeEllipse);
                  while (GoRouter.of(context).canPop()) {
                    final current = GoRouter.of(
                      context,
                    ).routerDelegate.currentConfiguration;
                    final location = current.uri.toString();
                    if (location == '/main' ||
                        location == '/profile' ||
                        location == '/measurements') {
                      break;
                    }
                    context.pop();
                  }
                  context.push('/measure-result', extra: {'result': result});
                  break;
                case ProgressError(:final message):
                  _showErrorRecognize(text: message, context: context);
                  break;
              }
            },
            builder: (context, progressState) {
              Stream<int?>? stream = switch (progressState) {
                InProgress(:final sendingProgress) => sendingProgress,
                _ => null,
              };
              return CameraOverlay(
                countdownStream: stream,
                subtitle: "preloaderCameraSubtitle".tr(),
                canPop: true,
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    title: const Text("parametersMeasure").tr(),
                    leading: const LeadingButton(),
                  ),
                  body: switch (parametersMeasureState) {
                    ParametersMeasureErrorLoading() => Center(
                      child: Text("thereWasAnErrorTitle".tr()),
                    ),
                    ParametersMeasureInitial() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    ParametersMeasureLoaded(
                      :final locations,
                      :final bread,
                      :final vehicleType,
                      :final sortiment,
                    ) =>
                      BlocListener<MeasureFormCubit, MeasureFormState>(
                        bloc: bloc.formLogic,
                        listener: (context, state) {
                          if (state is Valid) {
                            FocusScope.of(context).unfocus();
                            // context.push('/camera', extra: {'type': ''});
                          }
                        },
                        child: Center(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 48,
                            ).copyWith(top: pt + 70),
                            child: Column(
                              children: [
                                BlocBuilder<
                                  SelectorDictionaryCubit<
                                    InputSelectAdapterLocation?
                                  >,
                                  InputSelectAdapterLocation?
                                >(
                                  bloc: bloc.locationValue,
                                  builder: (context, s) {
                                    return InputSelect(
                                      values: locations,
                                      selectedValue: s,
                                      label: "locationLabel".tr(),
                                      onChange: (c) => bloc.locationValue.set(
                                        c as InputSelectAdapterLocation,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 16),
                                BlocBuilder<
                                  MultiSelectorDictionaryCubit<
                                    InputSelectAdapterBread
                                  >,
                                  List<InputSelectAdapterBread>?
                                >(
                                  bloc: bloc.breadValue,
                                  builder: (context, s) {
                                    return BlocBuilder<
                                      MeasureFormCubit,
                                      MeasureFormState
                                    >(
                                      bloc: bloc.formLogic,
                                      builder: (context, fs) {
                                        return InputMultiSelect(
                                          values: bread,
                                          selectedValues: s,
                                          label: "breadLabel".tr(),
                                          errorText: fs is Invalid
                                              ? (s?.isEmpty ?? true)
                                                    ? 'Выберите породу'
                                                    : null
                                              : null,
                                          onChange: (c) {
                                            return bloc.breadValue.set(
                                              List<
                                                InputSelectAdapterBread
                                              >.from(c),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(height: 16),
                                BlocBuilder<
                                  SelectorDictionaryCubit<
                                    InputSelectAdapterSortiment?
                                  >,
                                  InputSelectAdapterSortiment?
                                >(
                                  bloc: bloc.sortimentValue,
                                  builder: (context, s) {
                                    return InputSelect(
                                      values: sortiment,
                                      selectedValue: s,
                                      label: "sortimentLabel".tr(),
                                      onChange: (c) => bloc.sortimentValue.set(
                                        c as InputSelectAdapterSortiment,
                                      ),
                                    );
                                  },
                                ),
                                if (bloc.measure.type ==
                                    MeasureType.timberCarrier) ...[
                                  const SizedBox(height: 16),
                                  BlocBuilder<
                                    SelectorDictionaryCubit<
                                      InputSelectAdapterVehicleType?
                                    >,
                                    InputSelectAdapterVehicleType?
                                  >(
                                    bloc: bloc.vehicleTypeValue,
                                    builder: (context, s) {
                                      return InputSelect(
                                        values: vehicleType,
                                        selectedValue: s,
                                        label: "vehicleType".tr(),
                                        onChange: (c) =>
                                            bloc.vehicleTypeValue.set(
                                              c as InputSelectAdapterVehicleType,
                                            ),
                                      );
                                    },
                                  ),
                                ],
                                const SizedBox(height: 16),
                                BlocBuilder<MeasureFormCubit, MeasureFormState>(
                                  bloc: bloc.formLogic,
                                  builder: (context, state) {
                                    return Column(
                                      children: [
                                        PrimaryTextInput(
                                          controller: bloc.lengthController,
                                          label: "woodLengthLabel".tr(),
                                          hint:
                                              'От ${BuisnessConstraints.minLengthLoggingTruck} до ${BuisnessConstraints.maxLengthLoggingTruck}',
                                          autovalidateMode: state is Invalid
                                              ? AutovalidateMode.always
                                              : AutovalidateMode.disabled,
                                          validate: state is Invalid,
                                          validator: (s) {
                                            String value = (s ?? '').replaceAll(
                                              RegExp(r'[^0-9]'),
                                              '',
                                            );
                                            int numb = int.tryParse(value) ?? 0;
                                            return value.isEmpty
                                                ? "fieldMustNotBeEmpty".tr()
                                                : numb <
                                                          BuisnessConstraints
                                                              .minLengthLoggingTruck ||
                                                      numb >
                                                          BuisnessConstraints
                                                              .maxLengthLoggingTruck
                                                ? "loggingTruckLengthError".tr(
                                                    args: [
                                                      BuisnessConstraints
                                                          .minLengthLoggingTruck
                                                          .toString(),
                                                      BuisnessConstraints
                                                          .maxLengthLoggingTruck
                                                          .toString(),
                                                    ],
                                                  )
                                                : null;
                                          },
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          keyboardType: TextInputType.number,
                                        ),
                                        const SizedBox(height: 16),
                                        PrimaryTextInput(
                                          controller: bloc.providerController,
                                          label: "providerLabel".tr(),
                                          keyboardType: TextInputType.name,
                                        ),
                                        if (bloc.measure.type ==
                                            MeasureType.timberCarrier) ...[
                                          const SizedBox(height: 16),
                                          BlocBuilder<
                                            SelectorDictionaryCubit<
                                              InputSelectAdapterVehicleType?
                                            >,
                                            InputSelectAdapterVehicleType?
                                          >(
                                            bloc: bloc.vehicleTypeValue,
                                            builder: (context, s) {
                                              return PrimaryTextInput(
                                                controller:
                                                    bloc.carNumberController,
                                                label:
                                                    "carNumberLabel".tr() +
                                                    ((s != null)
                                                        ? " ${bloc.vehicleTypeValue.state!.title.toLowerCase()}а"
                                                        : ""),
                                                keyboardType:
                                                    TextInputType.text,
                                              );
                                            },
                                          ),
                                        ],
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(height: 24),
                                PrimaryButton(
                                  text: "nextButton".tr(),
                                  onPressed: () async {
                                    bloc.add(
                                      const ParametersMeasureEvent.apply(),
                                    );
                                    final fls =
                                        await bloc.formLogic.stream.first;
                                    if (fls is Valid && context.mounted) {
                                      FocusScope.of(context).unfocus();
                                    }
                                  },
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  "parametersCaption".tr(),
                                  style: Theme.of(context).textTheme.titleSmall,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ParametersMeasureLoading() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
