import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/app/domain/entities/measure_type.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/app/ui/screens/camera/bloc/camera_bloc.dart';
import 'package:neuro_wood/app/ui/screens/camera/widgets/camera_preview.dart';
import 'package:neuro_wood/app/ui/screens/camera/widgets/overlay_preloader.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/injection.dart';

import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';
import 'widgets/camera_panel.dart';

class CameraScreen extends StatefulWidget {
  final MeasureType type;
  const CameraScreen({super.key, required this.type});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraBloc _bloc;
  @override
  Widget build(BuildContext context) {
    _bloc = getIt.get<CameraBloc>();
    return BlocProvider(
      create: (context) => _bloc..add(CameraEvent.initCamera(widget.type)),
      child: CameraView(type: widget.type),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}

class CameraView extends StatelessWidget {
  final MeasureType type;
  const CameraView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    double pb = MediaQuery.of(context).viewPadding.bottom;
    CameraBloc cameraBloc = context.read<CameraBloc>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: BlocConsumer<CameraBloc, CameraState>(
          bloc: cameraBloc,
          listener: (context, state) {
            switch (state) {
              case CameraErrorInit():
                _showNoAccessCameraDialog(
                  context: context,
                  onCancelTap: () {
                    final router = GoRouter.of(context);

                    while (true) {
                      final location = router
                          .routerDelegate
                          .currentConfiguration
                          .uri
                          .toString();
                      if (location == '/main' ||
                          location == '/profile' ||
                          location == '/measurements') {
                        break;
                      }
                      if (!router.canPop()) {
                        break;
                      }
                      router.pop();
                    }
                  },
                  onSettingsTap: () {
                    cameraBloc.add(const CameraEvent.onSettingsTap());
                    Navigator.of(context).pop(true);
                  },
                );
                break;
              case CameraHasImage(:final substate):
                if (substate is Success) {
                  final DateFormat formatId = DateFormat('MM:dd:y_H:mm:ss');
                  final MeasureResultEntityBase result =
                      MeasureResultEntityInProgress(
                        dateTime: formatId
                            .parse(substate.result.measureId, true)
                            .toLocal(),
                        measureId: substate.result.measureId,
                        licensePlateText: substate.result.licensePlateText,
                        type: type,
                        hasFrontData: false,
                      );

                  final router = GoRouter.of(context);
                  while (true) {
                    final location = router
                        .routerDelegate
                        .currentConfiguration
                        .uri
                        .toString();
                    if (location == '/main' ||
                        location == '/profile' ||
                        location == '/measurements') {
                      break;
                    }
                    if (!router.canPop()) {
                      break;
                    }
                    router.pop();
                  }

                  final location = router
                      .routerDelegate
                      .currentConfiguration
                      .uri
                      .toString();
                  if (!(location == '/main' ||
                      location == '/profile' ||
                      location == '/measurements')) {
                    context.go('/main');
                  }
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.push(
                      '/parameters-measure',
                      extra: {
                        'measure': result,
                        'resultStream': substate.result.measureStream,
                      },
                    );
                  });
                } else if (substate is ErrorResponse) {
                  cameraBloc.add(const CameraEvent.interrupt());
                  _showErrorRecognize(
                    context: context,
                    code: (substate).code,
                    onCancelTap: () {
                      Navigator.of(context).pop(true);
                    },
                  );
                }
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            Stream<int?>? stream;
            switch (state) {
              case CameraHasImage(:final substate):
                if (substate is Sending) {
                  stream = substate.sendingProgress;
                } else {
                  stream = null;
                }
                break;
              case CameraReady():
                stream = null;
                break;
              default:
                stream = null;
            }
            return CameraOverlay(
              countdownStream: stream,
              subtitle: "preloaderCameraSubtitle2".tr(),
              child: Column(
                children: [
                  Expanded(
                    child: switch (state) {
                      CameraHasImage(:final substate) => ImagePreview(
                        imageFile: substate.image,
                      ),
                      CameraReady(:final inclineStream) => CameraPreviewWidget(
                        streamIncline: inclineStream,
                        cameraController: cameraBloc.cameraController,
                        onViewFinderTap:
                            (
                              TapDownDetails details,
                              BoxConstraints constraints,
                            ) {
                              cameraBloc.add(
                                CameraEvent.onViewFinderTap(
                                  Offset(
                                    details.localPosition.dx /
                                        constraints.maxWidth,
                                    details.localPosition.dy /
                                        constraints.maxHeight,
                                  ),
                                ),
                              );
                            },
                      ),
                      _ => Container(color: Colors.black87),
                    },
                  ),
                  switch (state) {
                    CameraHasImage _ => PreviewPanel(
                      backPressed: () =>
                          cameraBloc.add(const CameraEvent.interrupt()),
                      paddingBottom: pb,
                      sendPressed: () =>
                          cameraBloc.add(const CameraEvent.send()),
                    ),
                    CameraReady(:final inclineStream) => CameraPanel(
                      paddingBottom: pb,
                      backPressed: context.pop,
                      galleryPressed: () =>
                          cameraBloc.add(const CameraEvent.pickImage()),
                      takePhotoPressed: inclineStream == null
                          ? () => cameraBloc.add(const CameraEvent.takePhoto())
                          : null,
                    ),
                    _ => CameraPanel(
                      paddingBottom: pb,
                      backPressed: context.pop,
                      galleryPressed: () =>
                          cameraBloc.add(const CameraEvent.pickImage()),
                      takePhotoPressed: () =>
                          cameraBloc.add(const CameraEvent.takePhoto()),
                    ),
                  },
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _showNoAccessCameraDialog({
    required VoidCallback onCancelTap,
    required VoidCallback onSettingsTap,
    required BuildContext context,
  }) async {
    dynamic r = Dialogs.showDialogMessage(
      context: context,
      barrierDismissible: false,
      title: "noCameraAccessTitle".tr(),
      text: "noCameraAccessMessage".tr(),
      actions: [
        DialogAction(onPressed: onCancelTap, title: "cancelButton".tr()),
        DialogAction(
          onPressed: onSettingsTap,
          title: "goToSettingsButton".tr(),
          isDefaultAction: true,
        ),
      ],
    );
    if (r == null) {
      onCancelTap();
    }
  }

  Future _showErrorRecognize({
    required VoidCallback onCancelTap,
    required BuildContext context,
    required ServerFailureCode code,
  }) {
    String text;
    switch (code) {
      case ServerFailureCode.uknownNumber:
        text = "recognizeErrorText".tr();
        break;
      case ServerFailureCode.sendError:
        text = "sendRequestErrorText".tr();
        break;
      case ServerFailureCode.serverError:
        text = "serverErrorText".tr();
        break;
      case ServerFailureCode.parseResponseError:
        text = "parseResponseErrorText".tr();
        break;
    }
    return Dialogs.showDialogMessage(
      context: context,
      barrierDismissible: false,
      title: "thereWasAnErrorTitle".tr(),
      text: text,
      actions: [DialogAction(onPressed: onCancelTap, title: "okButton".tr())],
    );
  }
}
