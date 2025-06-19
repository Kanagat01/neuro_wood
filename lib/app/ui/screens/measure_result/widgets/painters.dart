import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
// import 'package:neuro_wood/core/ui/theme.dart';

class PainterBuilder {
  final ImageInfo imageInfo;
  PainterBuilder(this.imageInfo);

  CustomPainter buildLinesPainter({required List<LineCoordsEntity> lines}) {
    return LinesPainter(lines: lines, imageInfo: imageInfo);
  }

  CustomPainter buildMarkupPainter({
    required List<MarkupEntity> markups,
    required MarkupType shape,
  }) {
    return MarkupPainter(markups: markups, imageInfo: imageInfo, shape: shape);
  }
}

class LinesPainter extends CustomPainter {
  final List<LineCoordsEntity> lines;
  final ImageInfo imageInfo;

  LinesPainter({required this.lines, required this.imageInfo});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = size.width / 270
      ..strokeCap = StrokeCap.square;

    final double scale = imageInfo.image.width.toDouble() / size.width;

    canvas.save();
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint());

    canvas.restore();
    canvas.save();
    canvas.drawImageRect(
      imageInfo.image,
      Rect.fromLTWH(
        0,
        0,
        imageInfo.image.width.toDouble(),
        imageInfo.image.height.toDouble(),
      ),
      Rect.fromLTWH(
        0,
        0,
        size.width,
        imageInfo.image.height.toDouble() /
            (imageInfo.image.width.toDouble() / size.width),
      ),
      Paint(),
    );

    for (final line in lines) {
      Offset startingPoint = Offset(line.start.x / scale, line.start.y / scale);
      Offset endingPoint = Offset(line.end.x / scale, line.end.y / scale);
      canvas.drawLine(startingPoint, endingPoint, paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MarkupPainter extends CustomPainter {
  final List<MarkupEntity> markups;
  final MarkupType shape;
  final ImageInfo imageInfo;

  MarkupPainter({
    required this.markups,
    required this.imageInfo,
    required this.shape,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint());

    canvas.drawImageRect(
      imageInfo.image,
      Rect.fromLTWH(
        0,
        0,
        imageInfo.image.width.toDouble(),
        imageInfo.image.height.toDouble(),
      ),
      Rect.fromLTWH(
        0,
        0,
        size.width,
        imageInfo.image.height.toDouble() /
            (imageInfo.image.width.toDouble() / size.width),
      ),
      Paint(),
    );

    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = size.width / 270
      ..style = PaintingStyle.stroke;
    final double scale = imageInfo.image.width.toDouble() / size.width;
    final textStyle = TextStyle(color: Colors.red, fontSize: size.width / 20);

    for (final m in markups) {
      Rect rect = Rect.fromLTRB(
        m.topLeft.x / scale,
        m.topLeft.y / scale,
        m.bottomRight.x / scale,
        m.bottomRight.y / scale,
      );

      String text;
      switch (shape) {
        case MarkupType.diameter:
          text = '${(m.diameter * 100).round()}';
          break;
        case MarkupType.sort:
          text = m.woodClass ?? '';
          break;
      }
      Offset center = rect.center;
      double scaleFactor = 1.1;
      if (text.isNotEmpty) {
        TextSpan? textSpan = TextSpan(text: text, style: textStyle);
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        while (textPainter.width > rect.width * 0.8 ||
            textPainter.height > rect.height * 0.8) {
          scaleFactor -= 0.1;
          textPainter.textScaler = TextScaler.linear(scaleFactor);
          textPainter.layout();
        }

        textPainter.paint(
          canvas,
          Offset(
            (center.dx - textPainter.width * 0.5),
            (center.dy - textPainter.height * 0.5),
          ),
        );
      }

      rect.center;
      canvas.drawOval(rect, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

enum MarkupType { diameter, sort }
