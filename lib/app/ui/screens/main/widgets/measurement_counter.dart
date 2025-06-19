import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';
import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';
import 'package:neuro_wood/core/ui/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MeasurementCounter extends StatelessWidget {
  final bool isFree;
  final int balance;
  final int total;
  const MeasurementCounter({
    super.key,
    required this.isFree,
    required this.balance,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final cell = total / 3;
    Color progressColor;
    if (balance < cell) {
      progressColor = NeuroWoodColors.red;
    } else if (balance < cell * 2) {
      progressColor = NeuroWoodColors.yellow;
    } else {
      progressColor = NeuroWoodColors.green;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: NeuroWoodColors.lightGray,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isFree && balance > 0) ...[
            Text(
              'trialMeasure'.tr(),
              style: const TextStyle(
                fontSize: 12,
                color: NeuroWoodColors.darkGray,
                height: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
          ],
          if (balance == 0)
            Text(
              isFree ? 'trialMeasurementsOver'.tr() : 'measurementsOver'.tr(),
              style: const TextStyle(
                fontSize: 20,
                color: NeuroWoodColors.red,
                height: 1,
                fontWeight: FontWeight.w500,
              ),
            )
          else
            Text(
              'measurementsLeft'.plural(balance),
              style: const TextStyle(
                fontSize: 20,
                color: NeuroWoodColors.black,
                height: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
          const SizedBox(height: 12),
          Material(
            child: Stack(
              children: [
                Container(
                  height: 13,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: NeuroWoodColors.darkGray2,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                Container(
                  height: 13,
                  width:
                      (MediaQuery.of(context).size.width - 64) /
                      total *
                      balance,
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'measurementsOverSubtitle'.tr(),
            style: const TextStyle(
              fontSize: 14,
              color: NeuroWoodColors.darkGray,
              height: 1.36,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          PrimaryButton(
            textColor: balance == 0
                ? NeuroWoodColors.white
                : NeuroWoodColors.green,
            primaryColor: balance == 0
                ? NeuroWoodColors.green
                : NeuroWoodColors.darkGray2,
            text: "supportService".tr(),
            onPressed: () => _showMenu(context),
          ),
        ],
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
