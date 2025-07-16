import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neuro_wood/core/services/sensors/sensor.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class InclineOverlay extends StatelessWidget {
  const InclineOverlay({
    super.key,
    required this.stream,
    required this.constraints,
    required this.scale,
  });
  final Stream<InclineMeasure> stream;
  final BoxConstraints constraints;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: -2),
      child: StreamBuilder<InclineMeasure?>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            InclineMeasure incline = snapshot.data!;
            int pitch = incline.pitch;
            int roll = incline.roll;
            double rotate = (roll / 360);
            double pithcAlignY;
            double pitchAlignX;
            if (pitch > 45) {
              pithcAlignY = 1;
            } else if (pitch < -45) {
              pithcAlignY = -1;
            } else {
              pithcAlignY = pitch / 45;
            }
            if (roll > 45) {
              pitchAlignX = 1;
            } else if (roll < -45) {
              pitchAlignX = -1;
            } else {
              pitchAlignX = roll / 45;
            }

            /*
            ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: -1),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: (28 + MediaQuery.of(context).viewPadding.top) *
                            scale,
                        right: 24,
                        left: 24,
                      ),
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(52, 55, 56, 0.55),
                      ),
                      child: const Text(
                        'Держите телефон прямо',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
            */
            Alignment alignPitch = Alignment(pitchAlignX, pithcAlignY);
            return RepaintBoundary(
              child: Stack(
                children: [
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: -1),
                      child: Container(
                        margin: EdgeInsets.only(
                          top:
                              (28 + MediaQuery.of(context).viewPadding.top) *
                              scale,
                          right: 24,
                          left: 24,
                        ),
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(52, 55, 56, 0.55),
                        ),
                        child: const Text(
                          'Держите телефон прямо',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter: InclinePainter(constraints: constraints),
                    child: Center(
                      child: SizedBox(
                        width: 118,
                        height: 118,
                        child: ClipOval(
                          child: AnimatedRotation(
                            turns: rotate,
                            duration: const Duration(milliseconds: 100),
                            child: Stack(
                              children: [
                                AnimatedAlign(
                                  alignment: alignPitch,
                                  duration: const Duration(milliseconds: 100),
                                  child: Divider(
                                    thickness: 2,
                                    color: incline.isAllowablePitch
                                        ? Colors.white
                                        : NeuroWoodColors.red,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "$pitch°",
                                    style: TextStyle(
                                      color: incline.isAllowableRoll
                                          ? Colors.white
                                          : NeuroWoodColors.red,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class InclinePainter extends CustomPainter {
  final BoxConstraints constraints;
  const InclinePainter({required this.constraints});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final Offset center = Offset(size.width / 2, size.height / 2);
    double r = size.width / 2 - 32;
    r = r > 60 ? 60 : r;
    final ll = Offset(size.width / 2 - r, size.height / 2);
    final rl = Offset(size.width / 2 + r, size.height / 2);
    canvas
      ..drawCircle(center, r, paint)
      ..drawLine(ll, Offset(ll.dx - 11, ll.dy), paint)
      ..drawLine(rl, Offset(rl.dx + 11, rl.dy), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
