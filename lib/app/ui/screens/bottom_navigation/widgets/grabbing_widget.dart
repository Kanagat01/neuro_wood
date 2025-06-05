import 'package:flutter/material.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class GrabbingWidget extends StatelessWidget {
  const GrabbingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        width: 80,
        height: 4,
        decoration: BoxDecoration(
          color: NeuroWoodColors.darkGray.withOpacity(0.4),
          borderRadius: BorderRadius.circular(5),
        ),
        
      ),
    );
  }
}
