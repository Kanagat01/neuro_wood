import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class InputSelect extends StatelessWidget {
  final List<InputSelectAdapter> values;
  final InputSelectAdapter? selectedValue;
  final String label;
  final Function(InputSelectAdapter) onChange;
  const InputSelect({
    super.key,
    required this.values,
    required this.selectedValue,
    required this.label,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 4),
          child: Text(label, style: Theme.of(context).textTheme.titleMedium),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () async {
            final value = await context.push(
              '/selector',
              extra: {
                'label': label,
                'values': values,
                'selectedValue': selectedValue,
              },
            );
            if (value is InputSelectAdapter) {
              onChange(value);
            }
          },
          child: Ink(
            padding: const EdgeInsets.fromLTRB(16, 12, 20, 12),
            decoration: BoxDecoration(
              color: NeuroWoodColors.lightGray,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedValue?.title ?? "",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Icon(
                  NeuroWoodIcons.arrowDown,
                  size: 24,
                  color: NeuroWoodColors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class InputMultiSelect extends StatelessWidget {
  final List<InputSelectAdapter> values;
  final List<InputSelectAdapter>? selectedValues;
  final String label;
  final String? errorText;
  final Function(List<InputSelectAdapter>) onChange;
  const InputMultiSelect({
    super.key,
    required this.values,
    required this.selectedValues,
    required this.label,
    required this.onChange,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 4),
          child: Text(label, style: Theme.of(context).textTheme.titleMedium),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () async {
            final value = await context.push(
              '/multi-selector',
              extra: {
                'label': label,
                'values': values,
                'selectedValues': selectedValues,
              },
            );
            if (value is List<InputSelectAdapter>) {
              onChange(value);
            }
          },
          child: Ink(
            padding: const EdgeInsets.fromLTRB(16, 12, 20, 12),
            decoration: BoxDecoration(
              color: NeuroWoodColors.lightGray,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    // selectedValue?.title ?? "",
                    selectedValues?.map((e) => e.title).join(', ') ?? "",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const Icon(
                  NeuroWoodIcons.arrowDown,
                  size: 24,
                  color: NeuroWoodColors.black,
                ),
              ],
            ),
          ),
        ),
        if (errorText?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: Text(
              errorText!,
              style: TextStyle(
                fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                fontWeight: FontWeight.w400,
                color: const Color(0xFfD32F2F),
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}

abstract class InputSelectAdapter<T> {
  T get value;
  String get title;
  bool get canSelect;
}
