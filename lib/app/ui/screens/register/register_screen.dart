import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/app/ui/screens/register/bloc/checkbox_cubit/checkbox_cubit.dart';
import 'package:neuro_wood/app/ui/screens/register/bloc/register_bloc/register_bloc.dart';
import 'package:neuro_wood/app/ui/widgets/on_paste_phone.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';
import 'package:neuro_wood/app/ui/widgets/primary_text_input.dart';
import 'package:neuro_wood/core/injection.dart';

import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeuroWoodColors.white,
      body: BlocProvider(
        create: (context) => getIt.get<RegisterBloc>(),
        child: SafeArea(
          child: Center(
            child: BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                switch (state) {
                  case RegisterError(:final e):
                    Dialogs.showDialogMessage(
                      title: "thereWasAnErrorTitle".tr(),
                      text: e,
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
                    break;
                  case RegisterSuccess():
                    context.pop();
                    context.push('/main');
                    break;
                }
              },
              buildWhen: (_, __) => true,
              builder: (context, state) {
                final bloc = context.read<RegisterBloc>();
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(48),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        const Text(
                          "registerTitle",
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 28,
                            color: NeuroWoodColors.black,
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ).tr(),
                        const SizedBox(height: 32),
                        BlocBuilder<ToggleCubit, bool>(
                          bloc: bloc.name.enableValidate,
                          builder: (context, s) {
                            return PrimaryTextInput(
                              focusNode: bloc.name.focusNode,
                              autovalidateMode: s
                                  ? AutovalidateMode.always
                                  : AutovalidateMode.onUserInteraction,
                              validate: s,
                              validator: (String? v) {
                                return (v?.isEmpty ?? false)
                                    ? "fieldMustNotBeEmpty".tr()
                                    : null;
                              },
                              controller: bloc.nameController,
                              label: "nameLabel".tr(),
                              keyboardType: TextInputType.name,
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<ToggleCubit, bool>(
                          bloc: bloc.company.enableValidate,
                          builder: (context, s) {
                            return PrimaryTextInput(
                              validate: s,
                              autovalidateMode: s
                                  ? AutovalidateMode.always
                                  : AutovalidateMode.onUserInteraction,
                              validator: (String? v) {
                                return (v?.isEmpty ?? false)
                                    ? "fieldMustNotBeEmpty".tr()
                                    : null;
                              },
                              focusNode: bloc.company.focusNode,
                              controller: bloc.companyController,
                              label: "companyLabel".tr(),
                              keyboardType: TextInputType.text,
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<ToggleCubit, bool>(
                          bloc: bloc.phone.enableValidate,
                          builder: (context, s) {
                            return PrimaryTextInput(
                              controller: bloc.phoneController,
                              focusNode: bloc.phone.focusNode,
                              validate: s,
                              autovalidateMode: s
                                  ? AutovalidateMode.always
                                  : AutovalidateMode.onUserInteraction,
                              label: "workPhoneLabel".tr(),
                              validator: (String? v) {
                                if (v?.isEmpty ?? true) return null;
                                String value =
                                    v?.replaceAll(RegExp(r'[^0-9]'), '') ?? '';
                                if (value.length < 10) {
                                  return "incorrectPhoneNumberValidate".tr();
                                }
                                return null;
                              },
                              contextMenuBuilder: OnPastePhone()
                                  .getContextMenuBuilder(),
                              hint: '900 000 00 00',
                              keyboardType: TextInputType.number,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 8,
                                ),
                                child: Text(
                                  '+7',
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(
                                        color: NeuroWoodColors.darkGray,
                                        height: 1,
                                      ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<ToggleCubit, bool>(
                          bloc: bloc.email.enableValidate,
                          builder: (context, s) {
                            return PrimaryTextInput(
                              validate: s,
                              keyboardType: TextInputType.emailAddress,
                              controller: bloc.emailController,
                              focusNode: bloc.email.focusNode,
                              autovalidateMode: s
                                  ? AutovalidateMode.always
                                  : AutovalidateMode.onUserInteraction,
                              label: "emailLabel".tr(),
                              validator: (String? v) {
                                return v?.isEmpty ?? true
                                    ? "fieldMustNotBeEmpty".tr()
                                    : bloc.emailRegexp.hasMatch(v?.trim() ?? '')
                                    ? null
                                    : "incorrectEmailValidate".tr();
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            SizedBox(
                              child: BlocBuilder<ToggleCubit, bool>(
                                bloc: bloc.isAgree,
                                builder: (context, state) {
                                  return Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    activeColor: Colors.red,
                                    side: WidgetStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                        width: 1,
                                        color: NeuroWoodColors.gray,
                                      ),
                                    ),
                                    checkColor: NeuroWoodColors.green,
                                    splashRadius: 20,
                                    fillColor: WidgetStateProperty.resolveWith((
                                      Set<WidgetState> states,
                                    ) {
                                      return Colors.transparent;
                                    }),
                                    value: state,
                                    onChanged: (bool? v) {
                                      bloc.add(
                                        const RegisterEvent.changeAgree(),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(color: NeuroWoodColors.black),
                                  children: [
                                    TextSpan(text: "iAccept".tr()),
                                    TextSpan(
                                      text: "userAgreementTermsLink".tr(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: NeuroWoodColors.green,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          context.push(
                                            '/pdf',
                                            extra: {
                                              'pdfPath':
                                                  'assets/docs/user_agreement_terms.pdf',
                                            },
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        BlocBuilder<ToggleCubit, bool>(
                          bloc: bloc.isActiveBtn,
                          builder: (context, s) {
                            return PrimaryButton(
                              text: "registerButton".tr(),
                              onPressed: s
                                  ? () => bloc.add(const RegisterEvent.send())
                                  : null,
                              icon: switch (state) {
                                RegisterSending() =>
                                  const CupertinoActivityIndicator(
                                    radius: 10,
                                    color: NeuroWoodColors.white,
                                  ),
                                _ => null,
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
