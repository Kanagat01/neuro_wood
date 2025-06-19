import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_wood/app/domain/entities/measure_type.dart';
import 'package:neuro_wood/core/ui/theme.dart';

import '../cubit/permission_cubit/main_screen_cubit.dart';

class MeasureTypeButton extends StatelessWidget {
  final String title;
  final String image;
  final MeasureType type;
  final String? subtitle;
  final double width;
  final double height;

  const MeasureTypeButton({
    super.key,
    required this.title,
    required this.image,
    required this.type,
    this.subtitle,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Ink(
              decoration: BoxDecoration(
                color: NeuroWoodColors.green,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/$image',
                alignment: Alignment.bottomRight,
              ),
            ),
            BlocBuilder<MainScreenCubit, MainScreenState>(
              builder: (context, state) {
                return InkWell(
                  onTap: state == MainScreenState.initial
                      ? () {
                          context.read<MainScreenCubit>().checkPermissions(
                            type,
                          );
                        }
                      : () {},
                  borderRadius: BorderRadius.circular(16),
                  child: Ink(
                    width: width,
                    height: height,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans',
                            height: 1.2,
                            color: NeuroWoodColors.white,
                          ),
                        ),
                        if (subtitle?.isNotEmpty ?? false) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 8,
                            ),
                            margin: const EdgeInsets.only(top: 9),
                            decoration: BoxDecoration(
                              color: NeuroWoodColors.white,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Text(
                              subtitle!,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'OpenSans',
                                height: 1.2,
                                color: NeuroWoodColors.black,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
