import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class LeadingButton extends StatelessWidget {
  final bool isBlack;
  const LeadingButton({
    Key? key,
    this.isBlack = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 24,
      onPressed: context.router.pop,
      icon: Icon(
        NeuroWoodIcons.arrow_left,
        color: isBlack ? NeuroWoodColors.black : NeuroWoodColors.white,
      ),
    );
  }
}
