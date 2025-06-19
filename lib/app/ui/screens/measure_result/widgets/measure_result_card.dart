import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/core/helpers/extensions.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class MeasureResultCard extends StatelessWidget {
  final MeasureResultEntityFinish result;

  const MeasureResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('dd.MM.y   HH:mm');
    final data = result.data;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: NeuroWoodColors.lightGray,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                result.type.name.tr(),
                // result.licensePlateText.toUpperCase(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                format.format(result.dateTime),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: NeuroWoodColors.darkGray,
                ),
              ),
            ],
          ),
          _MeasurePropertyBloc(
            name: "generalMeasureInfo".tr(),
            values: [
              MapEntry(
                "breadLabel".tr(),
                result.breed ?? result.breeds?.join(', '),
              ),
              if (result.sortiment.isNotEmpty)
                MapEntry("sortimentLabel".tr(), result.sortiment),
              MapEntry("countLogs".tr(), "${result.data.count} ${'pcs'.tr()}"),
              if (result.length != null)
                MapEntry("Номинальная длина", "${result.length} см."),
              if (result.provider?.isNotEmpty ?? false)
                MapEntry("Поставщик", "${result.provider}"),
              MapEntry("Локация", result.location),
              if (result.vehicleType?.isNotEmpty ?? false)
                MapEntry("Тип транспортного средства", "${result.vehicleType}"),
            ],
          ),
          if (((result.breeds?.isEmpty ?? true) || result.breed == 'Береза') &&
              data is MeasureResultDataTimberCarrierEntity)
            _MeasurePropertyBloc(
              name: "grade".tr(),
              values: data.sortPercent
                  .map((key, value) {
                    double volume = result.woodVolumeEllipse * (value / 100);
                    String sort;
                    switch (key) {
                      case "1":
                        sort = "firstSort".tr();
                        break;
                      case "3":
                        sort = "thirdSord".tr();
                        break;
                      case "d":
                        sort = "lastSort".tr();
                        break;
                      default:
                        sort = "unrecognizedSort".tr();
                    }
                    return MapEntry(
                      sort,
                      "volumeOrPerc".tr(
                        args: [volume.toStringAsFixed(1), "$value"],
                      ),
                    );
                  })
                  .entries
                  .toList(),
            ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "volumeLog".tr(),
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: NeuroWoodColors.green),
              ),
              Expanded(
                child: Text(
                  "${result.woodVolumeEllipse.toStringAsFixed(2)} м³",
                  textAlign: TextAlign.right,
                  style: Theme.of(
                    context,
                  ).textTheme.displayMedium?.copyWith(fontSize: 22),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MeasurePropertyBloc extends StatelessWidget {
  final String name;
  final List<MapEntry> values;
  const _MeasurePropertyBloc({required this.name, required this.values});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          name,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: NeuroWoodColors.green),
        ),
        const SizedBox(height: 12),
        ...intersperse(
          const SizedBox(height: 8),
          values.map((e) => _MeasurePropertyItem(name: e.key, value: e.value)),
        ),
      ],
    );
  }
}

class _MeasurePropertyItem extends StatelessWidget {
  final String name;
  final String value;
  const _MeasurePropertyItem({required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: NeuroWoodColors.darkGray),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ],
    );
  }
}
