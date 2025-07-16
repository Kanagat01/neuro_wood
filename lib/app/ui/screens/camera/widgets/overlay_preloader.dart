import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:neuro_wood/app/ui/widgets/rotating_logo.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class CameraOverlay extends StatelessWidget {
  final Widget child;
  final Stream<int?>? countdownStream;
  final Color bgColor;
  final bool canPop;
  final String subtitle;
  const CameraOverlay({
    super.key,
    required this.child,
    this.bgColor = const Color(0x88000000),
    required this.countdownStream,
    required this.subtitle,
    this.canPop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        StreamBuilder<int?>(
          stream: countdownStream,
          builder: (context, snapshot) {
            if (countdownStream == null ||
                !snapshot.hasData ||
                snapshot.data == null) {
              return const SizedBox();
            }

            return PopScope(
              canPop: canPop,
              child: Container(
                alignment: Alignment.center,
                color: bgColor,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const RotatingLogo(
                          color: NeuroWoodColors.white,
                          size: 116,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "preloaderCameraTitle".tr(
                            args: [snapshot.data.toString()],
                          ),
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(color: NeuroWoodColors.white),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: NeuroWoodColors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
