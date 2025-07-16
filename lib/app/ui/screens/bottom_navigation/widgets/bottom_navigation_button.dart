import 'package:flutter/material.dart';
import 'package:neuro_wood/app/domain/entities/bottom_navigation_button_entity.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({
    super.key,
    required this.data,
    required this.selectedIndex,
    required this.onTap,
  });
  final BottomNavigationButtonEntity data;
  final int selectedIndex;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final bool selected = selectedIndex == data.index;
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/${data.icon}_${selected ? "active" : "unactive"}.png',
              width: 56,
              height: 56,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 80,
            child: InkWell(
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 64),
                  Text(
                    data.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w300,
                      color: selected
                          ? NeuroWoodColors.black
                          : NeuroWoodColors.darkGray,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
