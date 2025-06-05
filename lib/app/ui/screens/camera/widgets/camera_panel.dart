import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class PreviewPanel extends StatelessWidget {
  final double paddingBottom;
  final VoidCallback backPressed;
  final VoidCallback sendPressed;

  const PreviewPanel({
    Key? key,
    required this.paddingBottom,
    required this.backPressed,
    required this.sendPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124 + paddingBottom,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8).copyWith(bottom: paddingBottom + 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              _PanelIconButton(
                icon: const Icon(
                  NeuroWoodIcons.arrow_left,
                  size: 24,
                  color: NeuroWoodColors.white,
                ),
                onPressed: backPressed,
              ),
              Text(
                'backButton'.tr(),
                style: const TextStyle(
                  color: NeuroWoodColors.white,
                ),
              ),
            ],
          ),
          Column(
            children: [
              _PanelIconButton(
                icon: const Icon(
                  NeuroWoodIcons.arrow_right,
                  size: 24,
                  color: NeuroWoodColors.white,
                ),
                onPressed: sendPressed,
              ),
              Text(
                'measureButton'.tr(),
                style: const TextStyle(
                  color: NeuroWoodColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CameraPanel extends StatelessWidget {
  final double paddingBottom;
  final VoidCallback? backPressed;
  final VoidCallback? galleryPressed;
  final VoidCallback? takePhotoPressed;

  const CameraPanel({
    Key? key,
    required this.paddingBottom,
    this.backPressed,
    this.galleryPressed,
    this.takePhotoPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124 + paddingBottom,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8).copyWith(bottom: paddingBottom + 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _PanelIconButton(
            icon: const Icon(
              NeuroWoodIcons.arrow_left,
              size: 24,
              color: NeuroWoodColors.white,
            ),
            onPressed: backPressed,
          ),
          _TakeShotButton(
            onPressed: takePhotoPressed,
          ),
          if (kDebugMode)
            _PanelIconButton(
              icon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  NeuroWoodIcons.image,
                  size: 24,
                  color: NeuroWoodColors.white,
                ),
              ),
              onPressed: galleryPressed,
            )
          else
            const SizedBox(
              width: 48,
            )
        ],
      ),
    );
  }
}

class _TakeShotButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const _TakeShotButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 76,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: NeuroWoodColors.white.withOpacity(0.3),
      ),
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: onPressed != null ? NeuroWoodColors.white : NeuroWoodColors.white.withOpacity(0.1),
            ),
          ),
        ),
      ),
    );
  }
}

class _PanelIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const _PanelIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: NeuroWoodColors.white.withOpacity(0.3),
        ),
        padding: const EdgeInsets.all(12),
        child: icon,
      ),
    );
  }
}
