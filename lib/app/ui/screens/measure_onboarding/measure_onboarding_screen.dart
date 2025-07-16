import 'package:easy_localization/easy_localization.dart' as el;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/app/domain/entities/measure_type.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';

import 'package:neuro_wood/core/ui/theme.dart';

class MeasureOnboardingScreen extends StatelessWidget {
  final MeasureType type;
  const MeasureOnboardingScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    String image;
    String text;
    switch (type) {
      case MeasureType.timberCarrier:
        image = 'assets/images/stories/13.png';
        text =
            "Эталон попадает в ограничивающую рамку и находится как можно ближе к центру лесовоза";
        break;
      case MeasureType.stack:
        image = 'assets/images/stories/29.png';
        text = 'Разместите эталон как можно ближе к центру штабеля';
        break;
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white.withValues(alpha: .15),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).padding.top + 12,
              left: 16,
              child: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(Icons.arrow_back_ios),
                iconSize: 24,
                splashRadius: 24,
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: NeuroWoodColors.green),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, .33, .54, 1],
                    colors: [
                      Colors.black.withValues(alpha: .6),
                      Colors.black.withValues(alpha: 0),
                      Colors.black.withValues(alpha: .2),
                      Colors.black.withValues(alpha: .8),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 120,
                                child: Image.asset(image, fit: BoxFit.contain),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Column(
                                  children: [
                                    Text(
                                      text,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        height: 1.3,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    PrimaryButton(
                                      text: "continueButton".tr(),
                                      primaryColor: NeuroWoodColors.green,
                                      onPressed: () {
                                        /// TODO
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                              context.pushReplacement(
                                                '/camera',
                                                extra: {'type': type},
                                              );
                                            });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CameraMask extends ShapeBorder {
  const CameraMask({
    this.borderColor = Colors.red,
    this.borderWidth = 2.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 80),
    this.maskPadding = const EdgeInsets.all(20),
  });

  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final EdgeInsets maskPadding;

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path getLeftTopPath(Rect rect) {
      return Path()
        ..moveTo(rect.left, rect.bottom)
        ..lineTo(rect.left, rect.top)
        ..lineTo(rect.right, rect.top);
    }

    return getLeftTopPath(rect)
      ..lineTo(rect.right, rect.bottom)
      ..lineTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromLTRB(0, 0, rect.width, rect.height);
    final width = rect.width;
    final height = rect.height;

    final masksWidth = width - (maskPadding.left + maskPadding.right);
    final masksHeight = height - (maskPadding.top + maskPadding.bottom);

    final topRect = Rect.fromLTWH(
      maskPadding.left,
      (rect.top + maskPadding.top),
      masksWidth,
      masksHeight,
    );

    final backgroundPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final boxPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    canvas
      ..saveLayer(rect, backgroundPaint)
      ..drawRect(rect, backgroundPaint)
      ..drawRect(topRect, boxPaint)
      ..restore();
  }

  @override
  ShapeBorder scale(double t) {
    return CameraMask(
      borderColor: borderColor,
      borderWidth: borderWidth,
      overlayColor: overlayColor,
    );
  }
}
