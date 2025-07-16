import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neuro_wood/app/ui/widgets/rotating_logo.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class ExportOverlay extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final Color bgColor;
  const ExportOverlay({
    super.key,
    required this.child,
    this.bgColor = const Color(0x88000000),
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (enabled)
          PopScope(
            canPop: false,
            child: Container(
              alignment: Alignment.center,
              color: bgColor,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: const Center(
                  child: RotatingLogo(color: NeuroWoodColors.white, size: 116),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
