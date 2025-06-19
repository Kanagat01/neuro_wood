import 'dart:io';
import 'dart:math' as math;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:neuro_wood/app/ui/screens/camera/widgets/camera_mask.dart';
import 'package:neuro_wood/core/services/sensors/sensor.dart';
import 'package:neuro_wood/core/ui/theme.dart';

import 'incline_overlay.dart';

class CameraPreviewWidget extends StatelessWidget {
  final CameraController? cameraController;
  final Function(TapDownDetails, BoxConstraints) onViewFinderTap;
  final Stream<InclineMeasure>? streamIncline;
  const CameraPreviewWidget({
    super.key,
    required this.cameraController,
    this.streamIncline,
    required this.onViewFinderTap,
  });

  @override
  Widget build(BuildContext context) {
    if (cameraController == null ||
        !(cameraController?.value.isInitialized ?? false)) {
      return Container(color: Colors.black87);
    }
    var camera = cameraController!.value;
    return LayoutBuilder(
      builder: (context, constraints) {
        final deviceRatio = constraints.maxWidth / constraints.maxHeight;

        double previewW = camera.previewSize!.width,
            previewH = camera.previewSize!.height;

        if (previewW > previewH) {
          final tmp = previewW;
          previewW = previewH;
          previewH = tmp;
        }
        // final cameraRatio =
        //     previewH < previewW ? previewH / previewW : previewW / previewH;
        final cameraRatio = previewW / previewH;
        // final cameraRatio = ph < pw ? ph / pw : pw / ph;

        final scale =
            math.max(deviceRatio, cameraRatio) /
            math.min(deviceRatio, cameraRatio);

        final newConstraints = BoxConstraints(
          minWidth: constraints.minWidth / scale,
          maxWidth: constraints.maxWidth / scale,
          minHeight: constraints.minHeight / scale,
          maxHeight: constraints.maxHeight / scale,
        );

        return Transform.scale(
          scale: scale,
          child: CameraPreview(
            cameraController!,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: (TapDownDetails details) =>
                  onViewFinderTap(details, constraints),
              child: Container(
                decoration: streamIncline == null
                    ? ShapeDecoration(
                        shape: CameraMask(
                          constraints: newConstraints,
                          maskPadding: const EdgeInsets.fromLTRB(
                            24,
                            80,
                            24,
                            50,
                          ),
                          overlayColor: Colors.black.withValues(alpha: 0.5),
                          borderColor: NeuroWoodColors.green,
                        ),
                      )
                    : BoxDecoration(
                        gradient: RadialGradient(
                          radius: 0.8,
                          colors: [
                            Colors.black.withValues(alpha: 0),
                            Colors.black.withValues(alpha: 0.6),
                          ],
                          stops: const [0, 81],
                        ),
                      ),
                child: streamIncline != null
                    ? InclineOverlay(
                        stream: streamIncline!,
                        constraints: newConstraints,
                        scale: scale,
                      )
                    : null,
              ),
            ),
          ),
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (cameraController == null ||
  //       !(cameraController?.value.isInitialized ?? false)) {
  //     return Container(
  //       color: Colors.black87,
  //     );
  //   }
  //   var camera = cameraController!.value;
  //   return LayoutBuilder(
  //     builder: (context, constraints) {
  //       final deviceRatio = constraints.maxWidth / constraints.maxHeight;
  //       double pw = camera.previewSize!.width, ph = camera.previewSize!.height;
  //       if (pw > ph) {
  //         final tmp = pw;
  //         pw = ph;
  //         ph = tmp;
  //       }
  //       final cameraRatio = ph < pw ? ph / pw : pw / ph;
  //       final scale = math.max(deviceRatio, cameraRatio) /
  //           math.min(deviceRatio, cameraRatio);
  //       return Transform.scale(
  //         scale: scale,
  //         child: Center(
  //           child: CameraPreview(
  //             cameraController!,
  //             child: GestureDetector(
  //               behavior: HitTestBehavior.opaque,
  //               onTapDown: (TapDownDetails details) =>
  //                   onViewFinderTap(details, constraints),
  //               child: Transform.scale(
  //                 scale: 1 / scale,
  //                 child: Container(
  //                   decoration: streamIncline == null
  //                       ? ShapeDecoration(
  //                           shape: CameraMask(
  //                             constraints: constraints,
  //                             maskPadding:
  //                                 const EdgeInsets.fromLTRB(24, 80, 24, 50),
  //                             overlayColor: Colors.black.withValues(alpha: 0.5),
  //                             borderColor: NeuroWoodColors.green,
  //                           ),
  //                         )
  //                       : BoxDecoration(
  //                           gradient: RadialGradient(
  //                             colors: [
  //                               Colors.black.withValues(alpha: 0.2),
  //                               Colors.black,
  //                             ],
  //                           ),
  //                         ),
  //                   child: streamIncline != null
  //                       ? InclineOverlay(
  //                           stream: streamIncline!,
  //                           constraints: constraints,
  //                         )
  //                       : null,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}

class ImagePreview extends StatelessWidget {
  final XFile imageFile;
  const ImagePreview({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned.fill(
              child: Image.file(
                File(imageFile.path),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                shape: CameraMask(
                  constraints: constraints,
                  maskPadding: const EdgeInsets.fromLTRB(24, 80, 24, 50),
                  overlayColor: Colors.black.withValues(alpha: 0.5),
                  borderColor: NeuroWoodColors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
