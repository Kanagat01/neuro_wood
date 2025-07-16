import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class PrimaryTextInput extends StatelessWidget {
  final String label;
  final String? hint;
  const PrimaryTextInput({
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
    this.inputFormatters,
    this.contextMenuBuilder,
  });

  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool validate;
  final bool readOnly;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;

  OutlineInputBorder get border => const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
    borderSide: BorderSide(color: NeuroWoodColors.lightGray),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 4),
          child: Text(label, style: Theme.of(context).textTheme.titleMedium),
        ),
        TextFormField(
          inputFormatters: inputFormatters,
          contextMenuBuilder: contextMenuBuilder,
          maxLength: maxLength,
          readOnly: readOnly,
          focusNode: focusNode,
          autovalidateMode: autovalidateMode,
          validator: validate ? validator : null,
          textAlign: textAlign,
          controller: controller,
          keyboardType: keyboardType,
          cursorColor: NeuroWoodColors.green,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            counterText: "",
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
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
      ],
    );
  }
}
