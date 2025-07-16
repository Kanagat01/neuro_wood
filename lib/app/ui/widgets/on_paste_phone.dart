import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnPastePhone {
  Widget Function(BuildContext, EditableTextState) getContextMenuBuilder() {
    return (BuildContext context, EditableTextState editableTextState) {
      return AdaptiveTextSelectionToolbar.buttonItems(
        anchors: editableTextState.contextMenuAnchors,
        buttonItems: [
          ContextMenuButtonItem(
            label: 'Paste',
            onPressed: () async {
              Navigator.of(context).pop();
              final ClipboardData? data = await Clipboard.getData(
                Clipboard.kTextPlain,
              );
              final String? text = data?.text;
              if (text?.isNotEmpty ?? false) {
                String value = text!.replaceAll(RegExp(r'[^0-9]'), '');
                String? pasteText;
                if (value.length == 11 &&
                    (value.startsWith('7') || value.startsWith('8'))) {
                  pasteText = value.substring(1);
                } else if (value.length == 10) {
                  pasteText = value;
                }

                if (pasteText != null) {
                  editableTextState.userUpdateTextEditingValue(
                    TextEditingValue(
                      text: pasteText,
                      selection: TextSelection.collapsed(
                        offset: pasteText.length,
                      ),
                    ),
                    SelectionChangedCause.toolbar,
                  );
                }
              }
            },
          ),
        ],
      );
    };
  }
}
