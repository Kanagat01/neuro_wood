import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:neuro_wood/app/ui/screens/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';
import 'package:neuro_wood/app/ui/widgets/sms_text_field.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class CodeForm extends StatelessWidget {
  const CodeForm({
    super.key,
    required this.controller,
    required this.ticker,
    required this.resendCode,
    required this.nextAction,
    // required this.substate,
    required this.sending,
  });
  final TextEditingController controller;
  // final AuthSubstate substate;
  final bool sending;
  final Stream<int?> ticker;
  final VoidCallback resendCode;
  final VoidCallback nextAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmsTextField(
          maxLength: 6,
          controller: controller,
          // readOnly: substate.maybeWhen(orElse: () => false, sending: () => true),
          readOnly: sending,
          label: "phoneCodeLabel".tr(),
          textAlign: TextAlign.center,
          hint: '000000',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24),
        StreamBuilder<int?>(
          stream: ticker,
          builder: (context, snapshot) {
            int? data = snapshot.data;
            if (data == 0 || data == null) {
              return RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "requestSmsCodeButton".tr(),
                  style: const TextStyle(
                    color: NeuroWoodColors.green,
                    fontSize: 12,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      resendCode();
                    },
                ),
              );
            }
            return RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: NeuroWoodColors.black),
                children: [
                  TextSpan(text: "requestNewCodeViaText".tr()),
                  TextSpan(
                    text: ' $data ',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: "requestNewCodeSeconsText".tr()),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          text: "nextButton".tr(),
          onPressed: sending ? () {} : nextAction,
          // onPressed: substate.maybeWhen(
          //   sending: () => () {},
          //   orElse: () => nextAction,
          // ),
          icon: sending
              ? const CupertinoActivityIndicator(
                  radius: 10,
                  color: NeuroWoodColors.white,
                )
              : null,
          // icon: substate.maybeWhen(
          //   sending: () => const CupertinoActivityIndicator(
          //     radius: 10,
          //     color: NeuroWoodColors.white,
          //   ),
          //   orElse: () => null,
          // ),
        ),
      ],
    );
  }
}
