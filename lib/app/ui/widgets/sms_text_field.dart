import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class SmsTextField extends StatelessWidget {
  final String label;
  final String? hint;
  const SmsTextField({
    super.key,
    this.controller,
    this.prefixIcon,
    this.hint,
    this.validator,
    this.keyboardType,
    this.focusNode,
    required this.label,
    this.validate = false,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.autovalidateMode,
    this.maxLength,
  });

  final TextEditingController? controller;
  final Widget? prefixIcon;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool validate;
  final bool readOnly;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;

  OutlineInputBorder get border => const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
    borderSide: BorderSide(color: NeuroWoodColors.lightGray),
  );

  double _getTextWidth(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: ui.TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    double textW = _getTextWidth(
      '999999',
      Theme.of(context).textTheme.bodyLarge!,
    );
    double fieldW = MediaQuery.of(context).size.width - 96;
    double padding = ((fieldW - textW) / 2) - 1.5;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 4),
          child: Text(label, style: Theme.of(context).textTheme.titleMedium),
        ),
        Center(
          child: TextFormField(
            expands: false,
            maxLength: maxLength,
            readOnly: readOnly,
            focusNode: focusNode,
            autovalidateMode: autovalidateMode,
            validator: validate ? validator : null,
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: NeuroWoodColors.green,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: padding,
              ),
              prefixIcon: prefixIcon,
              prefixIconConstraints: const BoxConstraints(),
              hintText: hint,
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: NeuroWoodColors.gray),
              fillColor: NeuroWoodColors.lightGray,
              filled: true,
              border: border,
              errorBorder: border.copyWith(
                borderSide: border.borderSide.copyWith(
                  color: NeuroWoodColors.red,
                ),
              ),
              enabledBorder: border,
              focusedBorder: border.copyWith(
                borderSide: border.borderSide.copyWith(
                  color: NeuroWoodColors.green,
                ),
              ),
              focusedErrorBorder: border.copyWith(
                borderSide: border.borderSide.copyWith(
                  color: NeuroWoodColors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
