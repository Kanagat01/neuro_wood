import 'package:pdfrx/pdfrx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class PDFReaderScreen extends StatelessWidget {
  final String pdfPath;
  final bool isAsset;
  const PDFReaderScreen({
    super.key,
    required this.pdfPath,
    this.isAsset = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeuroWoodColors.darkGray,
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
                GoRouter.of(context).pop();
              },
              icon: const Icon(NeuroWoodIcons.arrowLeft),
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
          ? PdfViewer.asset(pdfPath, params: const PdfViewerParams(maxScale: 2))
          : PdfViewer.file(pdfPath, params: const PdfViewerParams(maxScale: 2)),
    );
  }
}
