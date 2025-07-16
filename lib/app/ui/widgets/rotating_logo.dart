import 'package:flutter/material.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';

class RotatingLogo extends StatefulWidget {
  const RotatingLogo({
    super.key,
    required this.size,
    required this.color,
    this.duration = const Duration(milliseconds: 20000),
  });
  final double size;
  final Color color;
  final Duration duration;

  @override
  State<RotatingLogo> createState() => _RotatingLogoState();
}

class _RotatingLogoState extends State<RotatingLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Icon(NeuroWoodIcons.logo, size: widget.size, color: widget.color),
      builder: (BuildContext context, Widget? widget) {
        return Transform.rotate(angle: _controller.value * 6.3, child: widget);
      },
    );
  }
}
