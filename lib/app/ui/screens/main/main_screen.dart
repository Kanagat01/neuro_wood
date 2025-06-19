import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:neuro_wood/app/domain/entities/measure_type.dart';
import 'package:neuro_wood/app/ui/screens/main/cubit/permission_cubit/main_screen_cubit.dart';
import 'package:neuro_wood/core/injection.dart';

import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';

import 'package:neuro_wood/core/ui/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cubit/cubit/measure_limit_cubit.dart';
import 'widgets/measure_type_button.dart';
// import 'widgets/measurement_counter.dart';
import 'widgets/measurement_counter.dart';
import 'widgets/rules_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size.width;
    final measureTypeWidth = (mq - 48) / 2;
    return BlocListener<MainScreenCubit, MainScreenState>(
      listener: (context, state) {
        if (state.checker == MainScreenStateChecker.checked &&
            context.read<MainScreenCubit>().prevState.checker !=
                MainScreenStateChecker.checked) {
          if (state.type != null) {
            context.push('/measure-onboarding', extra: {'type': state.type!});
          }
        } else if (state.checker == MainScreenStateChecker.noRecognitionLeft &&
            context.read<MainScreenCubit>().prevState.checker !=
                MainScreenStateChecker.noRecognitionLeft) {
          _showMenu(context);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                "Выберите метод измерения:".tr(), //localizw
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MeasureTypeButton(
                    title: 'Измерить древесину в лесовозе', //localize
                    image: 'btn_truck.png',
                    type: MeasureType.timberCarrier,
                    width: measureTypeWidth,
                    height: 115,
                  ),
                  MeasureTypeButton(
                    title: 'Измерить древесину в штабеле', //localize
                    image: 'btn_timbers.png', //localize
                    type: MeasureType.stack,
                    width: measureTypeWidth,
                    height: 115,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              BlocBuilder<MeasureLimitCubit, MeasureLimitState>(
                bloc: getIt.get(),
                builder: (context, state) {
                  return state.showBlock
                      ? MeasurementCounter(
                          total: state.totalCount,
                          balance: state.leftCount,
                          isFree: state.isFree,
                        )
                      : const SizedBox();
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: NeuroWoodColors.lightGray,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "shootingRules".tr(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 24),
                    RulesItem(number: 1, text: "shootingRule1".tr()),
                    const SizedBox(height: 24),
                    RulesItem(number: 2, text: "shootingRule2".tr()),
                    const SizedBox(height: 24),
                    RulesItem(number: 3, text: "shootingRule3".tr()),
                    const SizedBox(height: 24),
                    RulesItem(number: 4, text: "shootingRule4".tr()),
                    const SizedBox(height: 32),
                    Text(
                      "shootingRulesCaption".tr(),
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // BlocConsumer<MainScreenCubit, MainScreenState>(
              //   listener: (context, state) {
              //     if (state == MainScreenState.checked &&
              //         context.read<MainScreenCubit>().prevState !=
              //             MainScreenState.checked) {
              //       context.push('/measure-onboarding', extra: {'type': state.type!});
              //     }
              //   },
              //   builder: (context, state) {
              //     return PrimaryButton(
              //       text: "measureButton".tr(),
              //       icon: const Icon(NeuroWoodIcons.camera),
              //       onPressed: state == MainScreenState.initial
              //           ? () {
              //               context.read<MainScreenCubit>().checkPermissions();
              //             }
              //           : () {},
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    Dialogs.showMenu(
      context: context,
      showCancelButtonIos: true,
      title: "supportService".tr(),
      text: "supportServiceText".tr(),
      actions: actionsMenu
          .map(
            (e) => DialogAction(
              title: e.title,
              onPressed: () {
                _launch(e.uri, e.fallback, context);
                Navigator.of(context).pop();
              },
            ),
          )
          .toList(),
    );
  }

  _launch(
    Uri uri,
    Function(BuildContext)? fallback,
    BuildContext context,
  ) async {
    final shouldFallback = await launchUrl(uri);
    if (!context.mounted) return;

    if (fallback != null && !shouldFallback) {
      fallback(context);
    }
  }
}
