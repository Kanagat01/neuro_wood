// import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_wood/app/ui/widgets/on_paste_phone.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';
import 'package:neuro_wood/app/ui/widgets/primary_text_input.dart';
import 'package:neuro_wood/core/router.gr.dart';
import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';

import 'bloc/auth_bloc/auth_bloc.dart';
import 'widgets/code_form.dart';
import 'widgets/logo.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        AuthBloc bloc = context.read<AuthBloc>();
        return bloc.state.maybeMap(
          inputCode: (_) {
            bloc.add(const AuthEvent.back());
            return Future.value(false);
          },
          orElse: () => Future.value(true),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<AuthBloc, AuthState>(
            listenWhen: (s1, s2) => true,
            listener: ((context, state) {
              handleError(AuthSubstate substate) {
                substate.maybeWhen(
                  error: (message, _) {
                    Dialogs.showDialogMessage(
                      title: "thereWasAnErrorTitle".tr(),
                      text: message,
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
                  },
                  orElse: () {},
                );
              }

              state.maybeWhen(
                inputCode: (handleError),
                inputPhone: (s, _, __) => handleError(s),
                successAuth: () =>
                    context.router.replace(const RegisterScreen()),
                successRegister: () =>
                    context.router.replace(const BottomNavigator()),
                orElse: () {},
              );
            }),
            builder: (context, state) {
              AuthBloc bloc = context.read<AuthBloc>();
              return Stack(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(48, 48, 48, 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Logo(),
                          const SizedBox(height: 32),
                          state.maybeWhen(
                            inputPhone:
                                (
                                  AuthSubstate substate,
                                  bool validate,
                                  bool enableNextBtn,
                                ) {
                                  return PhoneForm(
                                    validate: validate,
                                    substate: substate,
                                    controller: bloc.phoneController,
                                    nextAction: enableNextBtn
                                        ? () => bloc.add(
                                            const AuthEvent.sendPhone(),
                                          )
                                        : null,
                                  );
                                },
                            inputCode: (AuthSubstate substate) {
                              return CodeForm(
                                sending: substate.maybeWhen(
                                  orElse: () => false,
                                  sending: () => true,
                                ),
                                // substate: substate,
                                controller: bloc.codeController,
                                ticker: bloc.ticker,
                                resendCode: () =>
                                    bloc.add(const AuthEvent.resendCode()),
                                nextAction: () =>
                                    bloc.add(const AuthEvent.sendCode()),
                              );
                            },
                            orElse: () {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  state.maybeWhen(
                    inputCode: (_) {
                      return Positioned(
                        top: 23,
                        left: 0,
                        child: IconButton(
                          icon: const Icon(NeuroWoodIcons.arrow_left),
                          onPressed: () => bloc.add(const AuthEvent.back()),
                        ),
                      );
                    },
                    orElse: () => const SizedBox(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class PhoneForm extends StatelessWidget {
  const PhoneForm({
    Key? key,
    required this.controller,
    required this.substate,
    required this.validate,
    this.nextAction,
  }) : super(key: key);
  final TextEditingController controller;
  final AuthSubstate substate;
  final VoidCallback? nextAction;
  final bool validate;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: validate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          PrimaryTextInput(
            validate: validate,
            readOnly: substate.maybeWhen(
              orElse: () => false,
              sending: () => true,
            ),
            label: "phoneLabel".tr(),
            selectionControls: OnPastePhone().getPlatform(),
            validator: (String? s) {
              String value = s?.replaceAll(RegExp(r'[^0-9]'), '') ?? '';
              if (value.length < 10) return "incorrectPhoneNumberValidate".tr();
              return null;
            },
            hint: '900 000 00 00',
            keyboardType: TextInputType.number,
            controller: controller,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 8),
              child: Text(
                '+7',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: NeuroWoodColors.darkGray,
                  height: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: "nextButton".tr(),
            onPressed: substate.maybeWhen(
              sending: () => () {},
              orElse: () => nextAction,
            ),
            icon: substate.maybeWhen(
              sending: () => const CupertinoActivityIndicator(
                radius: 10,
                color: NeuroWoodColors.white,
              ),
              orElse: () => null,
            ),
          ),
        ],
      ),
    );
  }
}
