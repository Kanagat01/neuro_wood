import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_wood/app/domain/entities/measure_type.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/app/ui/screens/camera/bloc/camera_bloc.dart';
import 'package:neuro_wood/app/ui/screens/camera/widgets/camera_preview.dart';
import 'package:neuro_wood/app/ui/screens/camera/widgets/overlay_preloader.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/injection.dart';
import 'package:neuro_wood/core/router.gr.dart';
import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';
import 'widgets/camera_panel.dart';

class CameraScreen extends StatefulWidget {
  final MeasureType type;
  const CameraScreen({
    Key? key,
    required this.type,
  }) : super(key: key);

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
  const CameraView({
    Key? key,
    required this.type,
  }) : super(key: key);

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
            state.maybeMap(
              errorInit: (s) {
                _showNoAccessCameraDialog(
                  context: context,
                  onCancelTap: () {
                    context.router.popUntilRouteWithName('BottomNavigator');
                  },
                  onSettingsTap: () {
                    cameraBloc.add(const CameraEvent.onSettingsTap());
                    context.router.pop(true);
                  },
                );
              },
              hasImage: (s) {
                if (s.substate is Success) {
                  final substate = (s.substate as Success);
                  final DateFormat _formatId = DateFormat('MM:dd:y_H:mm:ss');
                  final MeasureResultEntityBase result =
                      MeasureResultEntityInProgress(
                    dateTime: _formatId
                        .parse(substate.result.measureId, true)
                        .toLocal(),
                    measureId: substate.result.measureId,
                    licensePlateText: substate.result.licensePlateText,
                    type: type,
                    hasFrontData: false,
                  );
                  context.router.pushAndPopUntil(
                    ParametersMeasureScreen(
                      resultStream: substate.result.measureStream,
                      measure: result,
                    ),
                    predicate: (route) =>
                        route.settings.name == 'BottomNavigator',
                  );
                } else if (s.substate is ErrorResponse) {
                  cameraBloc.add(const CameraEvent.interrupt());
                  _showErrorRecognize(
                      context: context,
                      code: (s.substate as ErrorResponse).code,
                      onCancelTap: () {
                        context.router.pop(true);
                      });
                }
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            Stream<int?>? stream = state.maybeMap(
              hasImage: (his) => (his.substate is Sending)
                  ? ((his.substate as Sending)).sendingProgress
                  : null,
              orElse: () => null,
            );
            return CameraOverlay(
              countdownStream: stream,
              subtitle: "preloaderCameraSubtitle2".tr(),
              child: Column(
                children: [
                  Expanded(
                    child: state.maybeWhen(
                      hasImage: (his) {
                        return ImagePreview(
                          imageFile: his.image,
                        );
                      },
                      ready: (streamIncline) {
                        return CameraPreviewWidget(
                          streamIncline: streamIncline,
                          cameraController: cameraBloc.cameraController,
                          onViewFinderTap: (TapDownDetails details,
                              BoxConstraints constraints) {
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
                        );
                      },
                      orElse: () {
                        return Container(
                          color: Colors.black87,
                        );
                      },
                    ),
                  ),
                  state.maybeWhen(
                    hasImage: (his) => PreviewPanel(
                      backPressed: () =>
                          cameraBloc.add(const CameraEvent.interrupt()),
                      paddingBottom: pb,
                      sendPressed: () =>
                          cameraBloc.add(const CameraEvent.send()),
                    ),
                    ready: (s) => CameraPanel(
                      paddingBottom: pb,
                      backPressed: context.router.pop,
                      galleryPressed: () =>
                          cameraBloc.add(const CameraEvent.pickImage()),
                      takePhotoPressed: s == null
                          ? () => cameraBloc.add(const CameraEvent.takePhoto())
                          : null,
                    ),
                    orElse: () => CameraPanel(
                      paddingBottom: pb,
                      backPressed: context.router.pop,
                      galleryPressed: () =>
                          cameraBloc.add(const CameraEvent.pickImage()),
                      takePhotoPressed: () =>
                          cameraBloc.add(const CameraEvent.takePhoto()),
                    ),
                  ),
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
        DialogAction(
          onPressed: onCancelTap,
          title: "cancelButton".tr(),
        ),
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
      actions: [
        DialogAction(
          onPressed: onCancelTap,
          title: "okButton".tr(),
        ),
      ],
    );
  }
}
