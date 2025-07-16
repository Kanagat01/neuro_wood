import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          NeuroWoodIcons.logo,
          size: 72,
          color: NeuroWoodColors.oldGreen,
        ),
        const SizedBox(width: 15),
        const Text(
          "appName",
          style: TextStyle(
            color: NeuroWoodColors.black,
            fontSize: 30,
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.w700,
            height: 1,
          ),
          textAlign: TextAlign.center,
        ).tr(),
        const SizedBox(width: 13),
      ],
    );
  }
}
