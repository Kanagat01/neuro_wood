// import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/app/ui/widgets/on_paste_phone.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';
import 'package:neuro_wood/app/ui/widgets/primary_text_input.dart';

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
    AuthBloc bloc = context.read<AuthBloc>();
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, bool? result) async {
        if (!didPop) {
          switch (bloc.state) {
            case AuthInputCode():
              bloc.add(const AuthEvent.back());
              break;
            default:
              Navigator.of(context).pop();
              break;
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<AuthBloc, AuthState>(
            listenWhen: (s1, s2) => true,
            listener: ((context, state) {
              handleError(AuthSubstate substate) {
                switch (substate) {
                  case AuthSubError(:final message):
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
                    break;
                }
              }

              switch (state) {
                case AuthInputCode(:final substate):
                  handleError(substate);
                  break;

                case AuthInputPhone(:final substate):
                  handleError(substate);
                  break;

                case SuccessAuth():
                  /// TODO проверить логику навигации pushReplacement ?
                  context.canPop();
                  context.push('/register');
                  break;

                case SuccessRegister():
                /// TODO проверить логику навигации pushReplacement ?
                  context.canPop();
                  context.push('/main');
                  break;
              }
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
                          _buildAuthForm(state, bloc),
                        ],
                      ),
                    ),
                  ),
                  (state is AuthInputCode)
                      ? Positioned(
                          top: 23,
                          left: 0,
                          child: IconButton(
                            icon: const Icon(NeuroWoodIcons.arrowLeft),
                            onPressed: () => bloc.add(const AuthEvent.back()),
                          ),
                        )
                      : const SizedBox(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildAuthForm(AuthState state, AuthBloc bloc) {
  return switch (state) {
    AuthInputPhone(
      :final substate,
      :final validateForm,
      :final enableNextBtn,
    ) =>
      PhoneForm(
        validate: validateForm,
        substate: substate,
        controller: bloc.phoneController,
        nextAction: enableNextBtn
            ? () => bloc.add(const AuthEvent.sendPhone())
            : null,
      ),
    AuthInputCode(:final substate) => CodeForm(
      sending: switch (substate) {
        AuthSubSending() => true,
        _ => false,
      },
      controller: bloc.codeController,
      ticker: bloc.ticker,
      resendCode: () => bloc.add(const AuthEvent.resendCode()),
      nextAction: () => bloc.add(const AuthEvent.sendCode()),
    ),
    _ => const Center(child: CircularProgressIndicator()),
  };
}

class PhoneForm extends StatelessWidget {
  const PhoneForm({
    super.key,
    required this.controller,
    required this.substate,
    required this.validate,
    this.nextAction,
  });
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
            readOnly: switch (substate) {
              AuthSubSending() => true,
              _ => false,
            },
            label: "phoneLabel".tr(),
            contextMenuBuilder: OnPastePhone().getContextMenuBuilder(),
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
            onPressed: switch (substate) {
              AuthSubSending() => () {},
              _ => nextAction,
            },
            icon: switch (substate) {
              AuthSubSending() => const CupertinoActivityIndicator(
                radius: 10,
                color: NeuroWoodColors.white,
              ),
              _ => null,
            },
          ),
        ],
      ),
    );
  }
}
