import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PDFReaderScreen extends StatelessWidget {
  final String pdfPath;
  final bool isAsset;
  const PDFReaderScreen({Key? key, required this.pdfPath, this.isAsset = true})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NeuroWoodColors.white,
        elevation: 0,
        leadingWidth: 90,
        leading: Row(
          children: [
            IconButton(
              color: NeuroWoodColors.black,
              splashRadius: 24,
              onPressed: () {
                context.router.pop();
              },
              icon: const Icon(NeuroWoodIcons.arrow_left),
            ),
            Text(
              "backButton".tr(),
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: NeuroWoodColors.black),
            ),
          ],
        ),
      ),
      body: isAsset
          ? PdfViewer.openAsset(
              pdfPath,
              params: const PdfViewerParams(
                maxScale: 2,
                pageDecoration: BoxDecoration(color: NeuroWoodColors.darkGray),
              ),
            )
          : PdfViewer.openFile(
              pdfPath,
              params: const PdfViewerParams(
                maxScale: 2,
                pageDecoration: BoxDecoration(color: NeuroWoodColors.darkGray),
              ),
            ),
    );
  }
}
