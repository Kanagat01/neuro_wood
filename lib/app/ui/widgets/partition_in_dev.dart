import 'package:flutter/material.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class PartitionInDev extends StatelessWidget {
  const PartitionInDev({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.settings, size: 72, color: NeuroWoodColors.darkGray),
          const SizedBox(height: 16),
          Text(
            'Раздел находится в разработке',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
