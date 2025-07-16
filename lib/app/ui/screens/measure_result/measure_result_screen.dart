import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/app/domain/entities/measure_result_image_entity.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/app/ui/screens/measure_result/cubit/report_saver/report_saver_cubit.dart';
import 'package:neuro_wood/app/ui/widgets/leading_button.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';
import 'package:neuro_wood/core/injection.dart';

import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';
import 'package:neuro_wood/core/ui/theme.dart';
import 'package:share_plus/share_plus.dart';
import 'cubit/image_loader/image_loader_cubit.dart';
import 'cubit/report_builder/report_builder_cubit.dart';
import 'widgets/image_card.dart';
import 'widgets/measure_result_card.dart';

class MeasureResultScreen extends StatefulWidget {
  const MeasureResultScreen({super.key, required this.result});
  final MeasureResultEntityFinish result;

  @override
  State<MeasureResultScreen> createState() => _MeasureResultScreenState();
}

class _MeasureResultScreenState extends State<MeasureResultScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt.get<ImageLoaderCubit>()..load(widget.result, screenWidth),
        ),
        BlocProvider(create: (context) => getIt.get<ReportBuilderCubit>()),
        BlocProvider(create: (context) => getIt.get<ReportSaverCubit>()),
      ],
      child: _MeasureResultScreen(result: widget.result),
    );
  }
}

class _MeasureResultScreen extends StatelessWidget {
  const _MeasureResultScreen({required this.result});
  final MeasureResultEntityFinish result;

  _shareFile(String filePath) async {
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(filePath)],
        text: "",
        subject: "Результат измерения",
      ),
    );
  }

  _showDialog({
    required BuildContext context,
    required String text,
    required String title,
  }) {
    Dialogs.showDialogMessage(
      title: title,
      text: text,
      context: context,
      actions: [
        DialogAction(
          title: "okButton".tr(),
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  _showMenu({
    required BuildContext context,
    required File file,
    required ReportSaverCubit cubit,
  }) {
    Dialogs.showMenu(
      context: context,
      actions: [
        // if (kDebugMode)
        //   DialogAction(
        //     title: "Посмотреть",
        //     onPressed: () {
        //       context.push('/pdf', extra: {
        //         'pdfPath': file.path,
        //         'isAsset': false,
        //       });
        //     },
        //   ),
        DialogAction(
          title: "saveReportButton".tr(),
          onPressed: () {
            cubit.saveReport(file);
            context.pop();
          },
        ),
        DialogAction(
          title: "shareReportButton".tr(),
          onPressed: () {
            _shareFile(file.path);
            context.pop();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageLoaderCubit = context.read<ImageLoaderCubit>();
    final reportSaverCubit = context.read<ReportSaverCubit>();

    return BlocListener<ReportSaverCubit, ReportSaverState>(
      listener: (context, state) {
        switch (state) {
          case ReportSaved():
            _showDialog(
              title: "successSaveFileTitle".tr(),
              text: "successSaveReportText".tr(),
              context: context,
            );
            break;
          case ReportSaverError():
            _showDialog(
              title: "thereWasAnErrorTitle".tr(),
              text: "errorSaveReportText".tr(),
              context: context,
            );
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("measure".tr()),
          leading: const LeadingButton(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: BlocBuilder<ImageLoaderCubit, ImageLoaderState>(
          bloc: imageLoaderCubit,
          builder: (context, imageLoaderState) {
            switch (imageLoaderState) {
              case ImageLoaded(:final resultImageEntity):
                return BlocConsumer<ReportBuilderCubit, ReportBuilderState>(
                  listener: (context, reportShareState) {
                    switch (reportShareState) {
                      case ReportBuilderLoaded(:final report):
                        if (Platform.isIOS) {
                          _shareFile(report.path);
                        } else {
                          _showMenu(
                            context: context,
                            file: report,
                            cubit: reportSaverCubit,
                          );
                        }
                        break;
                      case ReportBuilderError():
                        _showDialog(
                          title: "thereWasAnErrorTitle".tr(),
                          text: "errorGeneratereport".tr(),
                          context: context,
                        );
                        break;
                    }
                  },
                  builder: (context, reportShareState) {
                    final shareCubit = context.read<ReportBuilderCubit>();
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                      child: PrimaryButton(
                        text: 'Отправить отчет',
                        onPressed: () =>
                            shareCubit.getReport(result, resultImageEntity),
                        icon: switch (reportShareState) {
                          ReportBuilderLoading _ =>
                            const CupertinoActivityIndicator(
                              radius: 10,
                              color: NeuroWoodColors.white,
                            ),
                          _ => null,
                        },
                      ),
                    );
                  },
                );
              default:
                return const SizedBox();
            }
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 70),
          // padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              MeasureResultCard(result: result),
              const SizedBox(height: 16),
              BlocBuilder<ImageLoaderCubit, ImageLoaderState>(
                bloc: imageLoaderCubit,
                builder: (context, state) {
                  switch (state) {
                    case ImageLoaded(:final resultImageEntity):
                      final double width = (screenWidth - 48) / 2;
                      final items = List<ResultItem>.from(
                        resultImageEntity.items,
                      );
                      if ((result.breeds?.length ?? 0) > 1) {
                        items.removeAt(1);
                      }
                      return GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: items
                            .asMap()
                            .map((i, e) {
                              return MapEntry(
                                i,
                                ImageCard(
                                  image: resultImageEntity.image,
                                  width: width,
                                  name: e.title,
                                  onPressed: () {
                                    MeasureResultImageEntity r =
                                        resultImageEntity.setSelected(i);
                                    context.push(
                                      '/measure-result-image',
                                      extra: {'result': r},
                                    );
                                  },
                                ),
                              );
                            })
                            .values
                            .toList(),
                      );
                    case ImageLoaderError():
                      return const Center(
                        child: Text('Не удалось загрузить изображение'),
                      );
                    default:
                      return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
