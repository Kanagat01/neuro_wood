// import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/core/injection.dart';
import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';

import 'bloc/reauth_bloc/reauth_bloc.dart';
import 'widgets/code_form.dart';
import 'widgets/logo.dart';

class ReauthScreen extends StatefulWidget {
  const ReauthScreen({super.key});

  @override
  State<ReauthScreen> createState() => _ReauthScreenState();
}

class _ReauthScreenState extends State<ReauthScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<ReauthBloc>()..add(const ReauthEvent.started()),
      child: const ReauthScreenView(),
    );
  }
}

class ReauthScreenView extends StatelessWidget {
  const ReauthScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<ReauthBloc, ReauthState>(
          listenWhen: (s1, s2) => true,
          listener: ((context, state) {
            // handleError(AuthSubstate substate) {
            //   substate.maybeWhen(
            //     error: (message, _) {
            //       Dialogs.showDialogMessage(
            //         title: "thereWasAnErrorTitle".tr(),
            //         text: message,
            //         context: context,
            //         actions: [
            //           DialogAction(
            //             title: "okButton".tr(),
            //             isDefaultAction: true,
            //             onPressed: () {
            //               Navigator.of(context).pop();
            //             },
            //           ),
            //         ],
            //       );
            //     },
            //     orElse: () {},
            //   );
            // }
            switch (state) {
              case ReauthError(:final message):
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

              case ReauthSuccess():
                context.pop();
                break;

              default:
                break;
            }

            // state.maybeWhen(
            //   inputCode: (handleError),
            //   inputPhone: (s, _, __) => handleError(s),
            //   successAuth: () {
            //     context.pop();
            //     context.push('/register');
            //   },
            //   successRegister: () {
            //     context.pop();
            //     context.push('/main');
            //   },
            //   orElse: () {},
            // );
          }),
          builder: (context, state) {
            ReauthBloc bloc = context.read<ReauthBloc>();
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(48, 48, 48, 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Logo(),
                    const SizedBox(height: 32),
                    CodeForm(
                      // substate: substate,
                      sending: switch (state) {
                        ReauthState.awaiting => true,
                        ReauthState.sending => true,
                        _ => false,
                      }, // TODO_check
                      // state.maybeWhen(
                      //   orElse: () => false,
                      //   sending: () => true,
                      //   awaiting: () => true,
                      // ),
                      controller: bloc.codeController,
                      ticker: bloc.ticker,
                      resendCode: () =>
                          bloc.add(const ReauthEvent.resendCode()),
                      nextAction: () => bloc.add(const ReauthEvent.sendCode()),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
