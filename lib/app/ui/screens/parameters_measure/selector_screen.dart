import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/app/ui/screens/parameters_measure/widgets/input_select.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';
import 'package:neuro_wood/core/ui/theme.dart';

import 'cubit/multi_selector_dictionary_cubit.dart';
import 'cubit/selector_dictionary_cubit.dart';

class SelectorScreen extends StatelessWidget {
  final List<InputSelectAdapter> values;
  final InputSelectAdapter? selectedValue;
  final String label;
  const SelectorScreen({
    super.key,
    required this.values,
    required this.selectedValue,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SelectorDictionaryCubit<InputSelectAdapter?>(selectedValue),
      child: Scaffold(
        appBar: AppBar(title: Text(label)),
        body:
            BlocBuilder<
              SelectorDictionaryCubit<InputSelectAdapter?>,
              InputSelectAdapter?
            >(
              builder: (context, state) {
                final bloc = context
                    .read<SelectorDictionaryCubit<InputSelectAdapter?>>();
                return Column(
                  children: [
                    ListView.builder(
                      itemCount: values.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return _RadioButton(
                          value: values[i],
                          onChange: bloc.set,
                          selectedValue: state,
                        );
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(48, 20, 48, 30),
                      child: PrimaryButton(
                        text: "nextButton".tr(),
                        onPressed: () {
                          context.pop(state);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
      ),
    );
  }
}

class MultiSelectorScreen extends StatelessWidget {
  final List<InputSelectAdapter> values;
  final List<InputSelectAdapter>? selectedValues;
  final String label;
  const MultiSelectorScreen({
    super.key,
    required this.values,
    required this.selectedValues,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MultiSelectorDictionaryCubit<InputSelectAdapter>(selectedValues),
      child: Scaffold(
        appBar: AppBar(title: Text(label)),
        body:
            BlocBuilder<
              MultiSelectorDictionaryCubit<InputSelectAdapter>,
              List<InputSelectAdapter>?
            >(
              builder: (context, state) {
                final bloc = context
                    .read<MultiSelectorDictionaryCubit<InputSelectAdapter>>();
                return Column(
                  children: [
                    ListView.builder(
                      itemCount: values.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return _CheckboxButton(
                          value: values[i],
                          onChange: bloc.toggle,
                          selectedValue: state,
                        );
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(48, 20, 48, 30),
                      child: PrimaryButton(
                        text: "nextButton".tr(),
                        onPressed: () {
                          context.pop(state);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
      ),
    );
  }
}

class _RadioButton extends StatelessWidget {
  final InputSelectAdapter value;
  final InputSelectAdapter? selectedValue;
  final Function(InputSelectAdapter) onChange;

  const _RadioButton({
    required this.selectedValue,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value.canSelect) onChange(value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          children: [
            SizedBox(
              width: 16,
              child: Radio<InputSelectAdapter>(
                activeColor: NeuroWoodColors.green,
                value: value,
                groupValue: selectedValue,
                onChanged: (v) {
                  if (v != null && value.canSelect) onChange(v);
                },
              ),
            ),
            const SizedBox(width: 18),
            Text(
              value.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: value.canSelect
                    ? NeuroWoodColors.black
                    : NeuroWoodColors.darkGray,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckboxButton extends StatelessWidget {
  final InputSelectAdapter value;
  final List<InputSelectAdapter>? selectedValue;
  final Function(InputSelectAdapter) onChange;

  const _CheckboxButton({
    required this.selectedValue,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value.canSelect) onChange(value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          children: [
            SizedBox(
              width: 16,
              child: Checkbox(
                activeColor: NeuroWoodColors.green,
                value: selectedValue?.contains(value),
                onChanged: (v) {
                  if (v != null && value.canSelect) onChange(value);
                },
              ),
            ),
            const SizedBox(width: 18),
            Text(
              value.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: value.canSelect
                    ? NeuroWoodColors.black
                    : NeuroWoodColors.darkGray,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
