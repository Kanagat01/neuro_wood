import 'package:flutter/material.dart';

class CameraMask extends ShapeBorder {
  const CameraMask({
    required this.constraints,
    this.borderColor = Colors.red,
    this.borderWidth = 2.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 80),
    this.maskPadding = const EdgeInsets.all(20),
    // this.distanceBetweenMasks = 10,
    this.sizeRatio = 1 / 4,
  });

  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final EdgeInsets maskPadding;
  // final double distanceBetweenMasks;
  final double sizeRatio;
  final BoxConstraints constraints;

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
    final width = rect.width;
    final height = rect.height;

    final masksWidth = width - (maskPadding.left + maskPadding.right);
    final masksHeight = height - (maskPadding.top + maskPadding.bottom);

    final mainRect = Rect.fromLTWH(
      rect.left + maskPadding.left,
      (rect.top + maskPadding.top),
      masksWidth,
      masksHeight,
    );
    final ethalonOffset = masksWidth / 3.5;
    final ethalonHeight = masksHeight / 5.2;

    final etalonRect = Rect.fromLTRB(
      mainRect.left + ethalonOffset,
      mainRect.bottom - ethalonHeight * 1.5 - ethalonHeight,
      mainRect.right - ethalonOffset,
      mainRect.bottom - ethalonHeight * 1.5,
    );

    final backgroundPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final etalonBorderPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final boxPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;
    final circlePaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill;

    canvas
      ..saveLayer(rect, backgroundPaint)
      ..drawRect(rect, backgroundPaint)
      ..drawRect(mainRect, boxPaint)
      ..drawRect(etalonRect, etalonBorderPaint)
      ..drawRect(mainRect, borderPaint)
      ..drawCircle(etalonRect.center, 5, circlePaint);
    _drawDashedLine(
      canvas,
      etalonRect.left,
      etalonRect.right,
      etalonRect.center.dy,
      Axis.horizontal,
    );
    _drawDashedLine(
      canvas,
      etalonRect.top,
      etalonRect.bottom,
      etalonRect.center.dx,
      Axis.vertical,
    );
    canvas.restore();
  }

  void _drawDashedLine(
    Canvas canvas,
    double start,
    double end,
    double point,
    Axis axis,
  ) {
    const int dashWidth = 4;
    const int dashSpace = 4;
    const int offset = 2;

    Offset getOffset(double p) {
      return axis == Axis.horizontal ? Offset(p, point) : Offset(point, p);
    }

    final width = (end - offset) - (start + offset);
    final countDash = (width - dashWidth) ~/ (dashWidth + dashSpace);
    final startDash = (width - countDash * (dashWidth + dashSpace)) / 2;

    double pointVar = start + startDash;

    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    if (startDash > dashWidth) {
      canvas.drawLine(
        getOffset(start + offset / 2),
        getOffset(start + offset / 2 + startDash - dashWidth),
        paint,
      );
      canvas.drawLine(
        getOffset(end - offset / 2),
        getOffset(end - offset / 2 - startDash + dashWidth),
        paint,
      );
    }

    while (pointVar < end - startDash) {
      canvas.drawLine(
        getOffset(pointVar),
        getOffset(pointVar + dashWidth),
        paint,
      );

      pointVar += dashWidth + dashSpace;
    }
  }

  @override
  ShapeBorder scale(double t) {
    return CameraMask(
      constraints: constraints,
      borderColor: borderColor,
      borderWidth: borderWidth,
      overlayColor: overlayColor,
    );
  }
}
