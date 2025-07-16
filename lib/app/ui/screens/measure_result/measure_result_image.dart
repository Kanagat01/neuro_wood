import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/app/domain/entities/measure_result_image_entity.dart';
import 'package:neuro_wood/app/ui/widgets/leading_button.dart';
import 'package:neuro_wood/core/injection.dart';
import 'package:neuro_wood/core/services/permissions/permissions.dart';
import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';

import 'cubit/image_exporter/image_exporter_cubit.dart';
import 'widgets/export_overlay.dart';

class MeasureResultImage extends StatelessWidget {
  final MeasureResultImageEntity result;

  const MeasureResultImage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final bloc = ImageExporterCubit(
      result: result,
      permissions: getIt.get<Permissions>(),
    );
    return BlocConsumer<ImageExporterCubit, ImageExporterState>(
      bloc: bloc,
      listener: (context, state) {
        switch (state) {
          case ImageExporterError(:final type):
            if (type == ErrorType.permission) {
              _showNoAccessStorageDialog(
                context: context,
                onCancelTap: () {
                  context.pop();
                },
                onSettingsTap: () async {
                  await bloc.openSettings();
                  if (context.mounted) {
                    context.pop();
                  }
                },
              );
            } else if (type == ErrorType.undefined) {
              _showDialog(context: context, type: _DialogType.error);
            }
            break;
          case ImageExporterSuccess(:final oneImage):
            _showDialog(
              context: context,
              type: oneImage == false
                  ? _DialogType.successMany
                  : _DialogType.success,
            );
            break;
        }
      },
      builder: (context, state) {
        return ExportOverlay(
          enabled: switch (state) {
            ImageExporterProcessing() => true,
            _ => false,
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                result.items[result.selected].title,
                style: const TextStyle(color: Colors.white),
              ),
              systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.dark,
              ),
              leading: const LeadingButton(isBlack: false),
              actions: [
                IconButton(
                  onPressed: () {
                    Dialogs.showMenu(
                      context: context,
                      showCancelButtonIos: true,
                      actions: [
                        DialogAction(
                          title: "downloadPhoto".tr(),
                          onPressed: () {
                            bloc.export();
                            Navigator.of(context).pop();
                          },
                        ),
                        DialogAction(
                          title: "downloadAllPhoto".tr(
                            args: ['${result.items.length}'],
                          ),
                          onPressed: () {
                            bloc.exportAll();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                  icon: const Icon(NeuroWoodIcons.download),
                  color: NeuroWoodColors.white,
                  splashRadius: 24,
                ),
              ],
            ),
            body: InteractiveViewer(
              minScale: 1,
              maxScale: 4,
              child: RepaintBoundary(
                child: CustomPaint(
                  foregroundPainter:
                      result.items[result.selected].foregroundPainter,
                  child: SizedBox(
                    width: result.imageInfo.image.width.toDouble(),
                    height: result.imageInfo.image.height.toDouble(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _showDialog({required BuildContext context, required _DialogType type}) {
    String title;
    String text;
    switch (type) {
      case _DialogType.error:
        title = "thereWasAnErrorTitle";
        text = "errorSaveFileText";
        break;
      case _DialogType.success:
        title = "successSaveFileTitle";
        text = "successSaveFileText";
        break;
      case _DialogType.successMany:
        title = "successSaveFileTitle";
        text = "successSaveFilesText";
        break;
    }
    Dialogs.showDialogMessage(
      context: context,
      barrierDismissible: false,
      title: title.tr(),
      text: text.tr(),
      actions: [
        DialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          title: "okButton".tr(),
        ),
      ],
    );
  }

  _showNoAccessStorageDialog({
    required VoidCallback onCancelTap,
    required VoidCallback onSettingsTap,
    required BuildContext context,
  }) async {
    dynamic r = Dialogs.showDialogMessage(
      context: context,
      barrierDismissible: false,
      title: "noStorageAccessTitle".tr(),
      text: "noStorageAccessMessage".tr(),
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
}

enum _DialogType { error, success, successMany }
