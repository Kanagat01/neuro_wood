import 'package:flutter/material.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class RulesItem extends StatelessWidget {
  final int number;
  final String text;
  const RulesItem({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: NeuroWoodColors.white,
          ),
          child: Text(
            '$number',
            style: const TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.2,
              color: NeuroWoodColors.darkGray,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}
