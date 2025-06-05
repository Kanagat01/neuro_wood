import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_wood/app/ui/screens/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:neuro_wood/app/ui/widgets/primary_button.dart';
import 'package:neuro_wood/core/router.gr.dart';
import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';
import 'package:neuro_wood/core/ui/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/cubit/profile_delete_cubit.dart';
import 'bloc/profile_cubit/profile_cubit.dart';
import 'widgets/profile_buttons_bloc.dart';
import 'widgets/profile_info.dart';
// import 'package:store_redirect/store_redirect.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  _launch(
    Uri uri,
    Function(BuildContext)? fallback,
    BuildContext context,
  ) async {
    launchUrl(uri)
        .then((value) {
          if (fallback != null && !value) {
            fallback(context);
          }
        })
        .catchError((_) {
          if (fallback != null) {
            fallback(context);
          }
        });
  }

  _showLogoutMessage(BuildContext context) {
    Dialogs.showDialogMessage(
      title: "logoutDialogTitle".tr(),
      context: context,
      actions: [
        DialogAction(
          title: "cancelButton".tr(),
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        DialogAction(
          title: "logoutConfirmButton".tr(),
          isDestructiveAction: true,
          onPressed: () {
            context.read<AuthBloc>().add(const AuthEvent.logout());
            context.router.replaceAll([const AuthScreen()]);
          },
        ),
      ],
    );
  }

  _showDeleteAccountMessage(BuildContext context) {
    Dialogs.showDialogMessage(
      title: "deleteAccountDialogTitle".tr(),
      context: context,
      actions: [
        DialogAction(
          title: "cancelButton".tr(),
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        DialogAction(
          title: "deleteAccountConfirmButton".tr(),
          isDestructiveAction: true,
          onPressed: () {
            context.read<ProfileDeleteCubit>().deleteAccount();
            context.router.pop();
            // context.read<AuthBloc>().add(const AuthEvent.logout());

            // context.router.replaceAll([
            //   const AuthScreen(),
            // ]);
          },
        ),
      ],
    );
  }

  _showNeedReauthMessage(BuildContext context) {
    Dialogs.showDialogMessage(
      title: "reauthModalTitle".tr(),
      text: "reauthModalText".tr(),
      context: context,
      actions: [
        DialogAction(
          title: "cancelButton".tr(),
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        DialogAction(
          title: "continueButton".tr(),
          isDestructiveAction: true,
          onPressed: () {
            context.router.popAndPush(const ReauthScreen());
          },
        ),
      ],
    );
  }

  _showErrorDeleteMessage(BuildContext context) {
    Dialogs.showDialogMessage(
      title: "serverErrorText".tr(),
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
  }

  void _showMenu(BuildContext context) {
    Dialogs.showMenu(
      context: context,
      showCancelButtonIos: true,
      title: "supportService".tr(),
      text: "supportServiceText".tr(),
      actions: actionsMenu
          .map(
            (e) => DialogAction(
              title: e.title,
              onPressed: () {
                _launch(e.uri, e.fallback, context);
                Navigator.of(context).pop();
              },
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileDeleteCubit, ProfileDeleteState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            context.router.replaceAll([const AuthScreen()]);
          },
          needReauth: () {
            _showNeedReauthMessage(context);
          },
          errorDelete: () {
            _showErrorDeleteMessage(context);
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          return Scaffold(
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  state.maybeMap(
                    hasData: (s) => ProfileInfo(
                      changeButtonOnPressed: () async {
                        dynamic res = await context.router.push(
                          ProfileEditorScreen(user: s.user),
                        );
                        if (res == true) {
                          cubit.getData();
                        }
                      },
                      user: s.user,
                    ),
                    orElse: () {
                      return const SizedBox();
                    },
                  ),
                  const SizedBox(height: 16),
                  const ProfileButtonsBlock(),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    text: "supportService".tr(),
                    onPressed: () => _showMenu(context),
                  ),
                  const SizedBox(height: 32),
                  TextButton(
                    onPressed: () {
                      _showLogoutMessage(context);
                    },
                    child: Text(
                      "logoutButton".tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: NeuroWoodColors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextButton(
                    onPressed: () {
                      _showDeleteAccountMessage(context);
                    },
                    child: Text(
                      "deleteAccountButton".tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: NeuroWoodColors.darkGray,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
