import 'package:flutter/material.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class HowItWorkButton extends StatelessWidget {
  final LinearGradient backgroundGradient;
  final String backgroundImage;
  final String title;
  final VoidCallback onPressed;
  final double width;
  final double height;
  const HowItWorkButton({
    super.key,
    required this.backgroundGradient,
    required this.backgroundImage,
    required this.title,
    required this.onPressed,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Ink(
                decoration: BoxDecoration(
                  gradient: backgroundGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/images/$backgroundImage',
                  alignment: Alignment.bottomRight,
                ),
              ),
              InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(12),
                child: Ink(
                  width: width,
                  height: height,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                      height: 1.2,
                      color: NeuroWoodColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
