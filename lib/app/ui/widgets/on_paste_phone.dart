import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnPastePhone {
  TextSelectionControls? getPlatform() {
    if (Platform.isIOS) {
      return AppCupertinoTextSelectionControls(
        onPaste: onPastePhone,
      );
    } else if (Platform.isAndroid) {
      return AppMaterialTextSelectionControls(
        onPaste: onPastePhone,
      );
    }
    return null;
  }

  Future<String?> onPastePhone(
    TextSelectionDelegate? delegate,
  ) async {
    final ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    String? text = data?.text;
    if (text?.isNotEmpty ?? false) {
      String value = text!.replaceAll(RegExp(r'[^0-9]'), '');
      String? pasteText;
      if (value.length == 11 && (value.startsWith('7') || value.startsWith('8'))) {
        pasteText = value.substring(1);
      } else if (value.length == 10) {
        pasteText = value;
      }
      if (pasteText != null) {
        Clipboard.setData(ClipboardData(
          text: pasteText,
        ));
        return text;
      }
      return null;
    }
    return null;
  }
}

class AppCupertinoTextSelectionControls extends CupertinoTextSelectionControls {
  AppCupertinoTextSelectionControls({
    required this.onPaste,
  });
  Future<String?> Function(TextSelectionDelegate) onPaste;
  @override
  Future<void> handlePaste(final TextSelectionDelegate delegate) async {
    String? s = await onPaste(delegate);
    return super.handlePaste(delegate).then((value) {
      Clipboard.setData(ClipboardData(text: s));
    });
  }
}

class AppMaterialTextSelectionControls extends MaterialTextSelectionControls {
  AppMaterialTextSelectionControls({
    required this.onPaste,
  });
  Future<String?> Function(TextSelectionDelegate) onPaste;
  @override
  Future<void> handlePaste(final TextSelectionDelegate delegate) async {
    String? s = await onPaste(delegate);
    return super.handlePaste(delegate).then((value) {
      Clipboard.setData(ClipboardData(text: s));
    });
  }
}
