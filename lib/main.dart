import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytracker_sdk/mytracker_sdk.dart';
import 'package:neuro_wood/core/router.dart';
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
        statusBarColor: Colors.white.withValues(alpha: 0.85),
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
  const App({super.key});

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
              routerConfig: router,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: TextScaler.linear(1.0)),
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
