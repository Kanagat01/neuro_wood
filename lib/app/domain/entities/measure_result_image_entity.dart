import 'package:flutter/rendering.dart';

class MeasureResultImageEntity {
  final ImageProvider image;
  final ImageInfo imageInfo;
  final List<ResultItem> items;
  final double pixelRatio;
  final int selected;

  MeasureResultImageEntity({
    required this.image,
    required this.items,
    required this.imageInfo,
    required this.pixelRatio,
    required this.selected,
  });

  MeasureResultImageEntity setSelected(int i)=>MeasureResultImageEntity(
    image: image,
    items: items,
    pixelRatio: pixelRatio,
    imageInfo: imageInfo,
    selected: i
  );
}

class ResultItem {
  final CustomPainter foregroundPainter;
  final String fileName;
  final String title;

  ResultItem({
    required this.foregroundPainter,
    required this.fileName,
    required this.title,
  });
}
