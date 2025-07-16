import 'package:flutter/material.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.text,
    this.icon,
    this.primaryColor = NeuroWoodColors.green,
    this.textColor = NeuroWoodColors.white,
  });

  final VoidCallback? onPressed;
  final String text;
  final Widget? icon;
  final Color primaryColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        height: 1,
        color: onPressed != null ? textColor : NeuroWoodColors.gray,
      ),
    );
    if (icon != null) {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [child, const SizedBox(width: 12), icon!],
      );
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        disabledBackgroundColor: const Color(0xFFCCCCCC),
        elevation: 0,
        shadowColor: Colors.transparent,
        enableFeedback: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        minimumSize: const Size.fromHeight(52),
        maximumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: child,
    );
  }
}
