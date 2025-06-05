import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytracker_sdk/mytracker_sdk.dart';
import 'package:neuro_wood/core/router.gr.dart';
import 'package:neuro_wood/core/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_wood/core/services/analytics/i_analytics.dart';
import 'package:neuro_wood/core/ui/theme.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'app/ui/screens/auth/bloc/auth_bloc/auth_bloc.dart';

const _myTrackerAndroidKey = '05805957763672192705';
const _myTrackerIosKey = '72429175957547604647';

void main() async {
  // runApp(App());
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white.withAlpha(85),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp();
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    );
    await di.init();
    di.getIt.get<IAnalytics>().init();
    // The following lines are the same as previously explained in "Handling uncaught errors"
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
      !kDebugMode,
    );
    final result = await MyTracker.init(
      Platform.isIOS ? _myTrackerIosKey : _myTrackerAndroidKey,
    );
    log(result.toString());

    runApp(App());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class App extends StatelessWidget {
  App({super.key});
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  final _appRouter = AppRouter(globalKey);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<AuthBloc>(),
      child: EasyLocalization(
        supportedLocales: const [Locale('ru')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ru'),
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child ?? const SizedBox(),
                );
              },
              theme: themeData,
            );
          },
        ),
      ),
    );
  }
}
