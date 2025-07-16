import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/core/helpers/extensions.dart';

import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';
import 'package:neuro_wood/core/ui/theme.dart';

import 'cubit/measurements_cubit.dart';

class MeasurementsScreen extends StatelessWidget {
  const MeasurementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('HH:mm');
    // final timeFormat = DateFormat.jm();
    return Scaffold(
      body: BlocBuilder<MeasurementsCubit, MeasurementsState>(
        builder: (context, state) {
          switch (state) {
            case MeasurementsInitial():
              return const SizedBox();

            case MeasurementsLoaded(:final list):
              final items = list.entries.toList();
              return ListView.separated(
                padding: const EdgeInsets.all(
                  16,
                ).copyWith(top: 16 + MediaQuery.of(context).padding.top),
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: items.length,
                itemBuilder: (context, i) {
                  return _ListGroupedByDay(
                    list: items[i].value,
                    day: items[i].key,
                    timeFormat: timeFormat,
                  );
                },
              );

            case MeasurementsLoading():
              return const Center(child: CircularProgressIndicator());
            case MeasurementsEmpty():
              return Center(child: Text("emptyMeasureResults".tr()));
          }
        },
      ),
    );
  }
}

class _ListGroupedByDay extends StatelessWidget {
  final List<MeasureResultEntityBase> list;
  final DateTime day;
  final DateFormat timeFormat;
  const _ListGroupedByDay({
    required this.list,
    required this.day,
    required this.timeFormat,
  });

  String getDate() {
    DateTime now = DateTime.now();
    if (day.isEqualDay(now)) {
      return "today".tr();
    } else if (day
        .add(const Duration(days: 1))
        .getDate
        .isEqualDay(now.getDate)) {
      return "yesterday".tr();
    } else {
      var format = DateFormat('dd.MM.y');
      return format.format(day);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getDate(),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: NeuroWoodColors.darkGray),
        ),
        ListView.separated(
          separatorBuilder: (_, i) => const SizedBox(height: 16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, i) =>
              _MeasureCard(result: list[i], timeFormat: timeFormat),
        ),
      ],
    );
  }
}

class _MeasureCard extends StatelessWidget {
  const _MeasureCard({required this.result, required this.timeFormat});
  final MeasureResultEntityBase result;
  final DateFormat timeFormat;

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
    String topLeftText;
    String? volume;
    String? bread;
    TextStyle? topLeftTextStyle = Theme.of(context).textTheme.displayMedium;
    VoidCallback onTapCard;
    if (result is MeasureResultEntityInProgress) {
      topLeftText = 'В обработке';
      topLeftTextStyle = topLeftTextStyle?.copyWith(color: NeuroWoodColors.red);
      onTapCard = result.hasFrontData
          ? () {}
          : () =>
                context.push('/parameters-measure', extra: {'measure': result});
    } else if (result is MeasureResultEntityError) {
      topLeftText = 'Ошибка обработки';
      topLeftTextStyle = topLeftTextStyle?.copyWith(color: NeuroWoodColors.red);
      onTapCard = () {
        _showErrorRecognize(
          context: context,
          text:
              (result as MeasureResultEntityError).errorMessage ??
              'Возникла ошибка во время распознавания',
        );
      };
    } else if (result is MeasureResultEntityFinish) {
      final res = result as MeasureResultEntityFinish;
      // topLeftText = res.licensePlateText.toUpperCase();
      topLeftText = res.type.name.tr();
      volume = "${res.woodVolumeEllipse.toStringAsFixed(2)} м³";
      bread = res.breed;
      onTapCard = () => context.push('/measure-result', extra: {'result': res});
    } else {
      // final res = result as MeasureResultEntitySucess;
      topLeftText = 'Не заполнен';
      topLeftTextStyle = topLeftTextStyle?.copyWith(color: NeuroWoodColors.red);
      onTapCard = () =>
          context.push('/parameters-measure', extra: {'measure': result});
    }
    return InkWell(
      onTap: onTapCard,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: NeuroWoodColors.lightGray,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(topLeftText, style: topLeftTextStyle),
                Text(
                  timeFormat.format(result.dateTime),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: NeuroWoodColors.darkGray,
                  ),
                ),
              ],
            ),
            if (volume != null) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bread ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: NeuroWoodColors.green,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      volume,
                      textAlign: TextAlign.right,
                      style: Theme.of(
                        context,
                      ).textTheme.displayMedium?.copyWith(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
