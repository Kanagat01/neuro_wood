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
    super.key,
    required this.paddingBottom,
    required this.backPressed,
    required this.sendPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124 + paddingBottom,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 8,
      ).copyWith(bottom: paddingBottom + 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              _PanelIconButton(
                icon: const Icon(
                  NeuroWoodIcons.arrowLeft,
                  size: 24,
                  color: NeuroWoodColors.white,
                ),
                onPressed: backPressed,
              ),
              Text(
                'backButton'.tr(),
                style: const TextStyle(color: NeuroWoodColors.white),
              ),
            ],
          ),
          Column(
            children: [
              _PanelIconButton(
                icon: const Icon(
                  NeuroWoodIcons.arrowRight,
                  size: 24,
                  color: NeuroWoodColors.white,
                ),
                onPressed: sendPressed,
              ),
              Text(
                'measureButton'.tr(),
                style: const TextStyle(color: NeuroWoodColors.white),
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
    super.key,
    required this.paddingBottom,
    this.backPressed,
    this.galleryPressed,
    this.takePhotoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124 + paddingBottom,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 8,
      ).copyWith(bottom: paddingBottom + 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _PanelIconButton(
            icon: const Icon(
              NeuroWoodIcons.arrowLeft,
              size: 24,
              color: NeuroWoodColors.white,
            ),
            onPressed: backPressed,
          ),
          _TakeShotButton(onPressed: takePhotoPressed),
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
            const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class _TakeShotButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const _TakeShotButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 76,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: NeuroWoodColors.white.withValues(alpha: 0.3),
      ),
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: onPressed != null
                  ? NeuroWoodColors.white
                  : NeuroWoodColors.white.withValues(alpha: 0.1),
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

  const _PanelIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: NeuroWoodColors.white.withValues(alpha: 0.3),
        ),
        padding: const EdgeInsets.all(12),
        child: icon,
      ),
    );
  }
}
