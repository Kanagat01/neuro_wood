import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class LeadingButton extends StatelessWidget {
  final bool isBlack;
  const LeadingButton({super.key, this.isBlack = true});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 24,
      onPressed: () => GoRouter.of(context).pop(),
      icon: Icon(
        NeuroWoodIcons.arrowLeft,
        color: isBlack ? NeuroWoodColors.black : NeuroWoodColors.white,
      ),
    );
  }
}
