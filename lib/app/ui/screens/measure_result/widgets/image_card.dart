import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final VoidCallback onPressed;
  final double width;
  const ImageCard({
    super.key,
    required this.image,
    required this.name,
    required this.onPressed,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 120,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
              image: DecorationImage(image: image, fit: BoxFit.cover),
            ),
          ),
          Text(name),
        ],
      ),
    );
  }
}
