import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neuro_wood/app/ui/screens/auth/auth_screen.dart';
import 'package:neuro_wood/app/ui/screens/auth/reauth_screen.dart';
import 'package:neuro_wood/app/ui/screens/bottom_navigation/bottom_navigator.dart';
import 'package:neuro_wood/app/ui/screens/camera/camera_screen.dart';
import 'package:neuro_wood/app/ui/screens/main/main_screen.dart';
import 'package:neuro_wood/app/ui/screens/measure_onboarding/measure_onboarding_screen.dart';
import 'package:neuro_wood/app/ui/screens/measure_result/measure_result_image.dart';
import 'package:neuro_wood/app/ui/screens/measure_result/measure_result_screen.dart';
import 'package:neuro_wood/app/ui/screens/measurements/measurements_screen.dart';
import 'package:neuro_wood/app/ui/screens/parameters_measure/parameters_measure_screen.dart';
import 'package:neuro_wood/app/ui/screens/parameters_measure/selector_screen.dart';
import 'package:neuro_wood/app/ui/screens/pdf_reader/pdf_reader_screen.dart';
import 'package:neuro_wood/app/ui/screens/profile/profile_editor_screen.dart';
import 'package:neuro_wood/app/ui/screens/profile/profile_screen.dart';
import 'package:neuro_wood/app/ui/screens/register/register_screen.dart';
import 'package:neuro_wood/app/ui/screens/splash/screen/splash_screen.dart';
import 'package:neuro_wood/app/ui/screens/story_screen/onboarding_stories.dart';
import 'package:neuro_wood/app/ui/screens/subscriptions/subscriptions.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/splash', builder: (c, s) => const SplashScreen()),

    GoRoute(path: '/auth', builder: (c, s) => const AuthScreen()),
    GoRoute(path: '/reauth', builder: (c, s) => const ReauthScreen()),
    GoRoute(path: '/register', builder: (c, s) => const RegisterScreen()),

    GoRoute(
      path: '/pdf',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return PDFReaderScreen(
          pdfPath: params['pdfPath'] as String,
          isAsset: params['isAsset'] ?? true,
        );
      },
    ),

    GoRoute(
      path: '/selector',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return SelectorScreen(
          values: params['values'],
          selectedValue: params['selectedValue'],
          label: params['label'],
        );
      },
    ),
    GoRoute(
      path: '/multi-selector',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return MultiSelectorScreen(
          values: params['values'],
          selectedValues: params['selectedValues'],
          label: params['label'],
        );
      },
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (c, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/measure-onboarding',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return MeasureOnboardingScreen(type: params['type']);
      },
    ),
    GoRoute(
      path: '/parameters-measure',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return ParametersMeasureScreen(measure: params['measure']);
      },
    ),
    GoRoute(
      path: '/camera',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return CameraScreen(type: params['type']);
      },
    ),
    GoRoute(
      path: '/measure-result',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return MeasureResultScreen(result: params['result']);
      },
    ),
    GoRoute(
      path: '/measure-result-image',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return MeasureResultImage(result: params['result']);
      },
    ),

    GoRoute(
      path: '/profile-editor',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>;
        return ProfileEditorScreen(user: params['user']);
      },
    ),

    GoRoute(
      path: '/measure-carrier',
      builder: (c, s) => const MeasureStoriesTimberCarrierScreen(),
    ),
    GoRoute(
      path: '/measure-stack',
      builder: (c, s) => const MeasureStoriesStackScreen(),
    ),
    GoRoute(
      path: '/report-stories',
      builder: (c, s) => const ReportStoriesScreen(),
    ),
    GoRoute(path: '/subscriptions', builder: (c, s) => const Subscriptions()),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return BottomNavigator(child: child);
      },
      routes: [
        GoRoute(
          path: '/measurements',
          builder: (c, s) => const MeasurementsScreen(),
        ),
        GoRoute(path: '/main', builder: (c, s) => const MainScreen()),
        GoRoute(path: '/profile', builder: (c, s) => const ProfileScreen()),
      ],
    ),
  ],
  observers: [_screenObserver],
  errorBuilder: (c, s) =>
      Scaffold(body: Center(child: Text('Page not found: ${s.path}'))),
);
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _screenObserver = ScreenObserver();

final _shellNavigatorKey = GlobalKey<NavigatorState>();

/// Показывает в debug console, какой экран открыт.
class ScreenObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    _log(previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _log(route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _log(newRoute);
  }

  void _log(Route<dynamic>? route) {
    final settings = route?.settings;
    final location =
        settings?.arguments ?? settings?.name ?? route?.runtimeType.toString();
    debugPrint(
      '🛰  Текущий экран → $location ${settings?.name}, ${route?.runtimeType.toString()}',
    );
  }
}
