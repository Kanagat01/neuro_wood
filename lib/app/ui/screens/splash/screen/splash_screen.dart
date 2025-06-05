import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_wood/app/ui/screens/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:neuro_wood/app/ui/widgets/rotating_logo.dart';
import 'package:neuro_wood/core/router.gr.dart';
import 'package:neuro_wood/core/ui/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          inputPhone: (_, __, ___) async {
            await Future.delayed(const Duration(seconds: 3));
            context.router.replace(const AuthScreen());
          },
          successAuth: () async {
            await Future.delayed(const Duration(seconds: 3));
            context.router.replace(const RegisterScreen());
          },
          successRegister: () async {
            await Future.delayed(const Duration(seconds: 3));
            context.router.replace(const BottomNavigator());
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const RotatingLogo(color: NeuroWoodColors.oldGreen, size: 200),
                const SizedBox(height: 28),
                const Text(
                  "appName",
                  style: TextStyle(
                    fontSize: 42,
                    height: 1,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Ubuntu',
                    color: NeuroWoodColors.black,
                  ),
                  textAlign: TextAlign.center,
                ).tr(),
                const Spacer(),
                Text(
                  "digitalPlatformCaption".tr(),
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
