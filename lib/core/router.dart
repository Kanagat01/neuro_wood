import 'package:auto_route/auto_route.dart';
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
import 'package:neuro_wood/app/ui/screens/webview_screen/webview_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: SplashScreen, initial: true, path: 'SplashRoute'),
    AutoRoute(page: AuthScreen, path: 'AuthRoute'),
    AutoRoute(page: ReauthScreen, path: 'ReauthRoute'),
    AutoRoute(page: RegisterScreen, path: 'RegisterRoute'),
    // AutoRoute(page: WebviewScreen, path: 'WebviewRoute'),
    AutoRoute(page: PDFReaderScreen, path: 'PDFReaderRoute'),
    AutoRoute(page: SelectorScreen, path: 'SelectorRoute'),
    AutoRoute(page: MultiSelectorScreen, path: 'MultiSelectorRoute'),
    AutoRoute(page: MeasureOnboardingScreen, path: 'MeasureOnboardingRoute'),
    AutoRoute(page: ParametersMeasureScreen, path: 'ParametersMeasureRoute'),
    AutoRoute(page: CameraScreen, path: 'CameraScreenRoute'),
    AutoRoute(page: MeasureResultScreen, path: 'MeasureResultRoute'),
    AutoRoute(page: MeasureResultImage, path: 'MeasureResultImageRoute'),
    AutoRoute(page: ProfileEditorScreen, path: 'ProfileEditorRoute'),
    AutoRoute(
      page: MeasureStoriesTimberCarrierScreen,
      path: 'MeasureStoriesTimberCarrierRoute',
    ),
    AutoRoute(
      page: MeasureStoriesStackScreen,
      path: 'MeasureStoriesStackRoute',
    ),
    AutoRoute(page: ReportStoriesScreen, path: 'ReportStoriesRoute'),
    AutoRoute(page: OnboardingScreen, path: 'OnboardingRoute'),
    AutoRoute(page: Subscriptions, path: 'SubscriptionsRoute'),
    AutoRoute(
      page: BottomNavigator,
      path: 'BottomNavigation',
      children: [
        AutoRoute(page: MeasurementsScreen, path: 'MeasurementsRoute'),
        AutoRoute(page: MainScreen, path: 'MainRoute', initial: true),
        AutoRoute(page: ProfileScreen, path: 'ProfileRoute'),
      ],
    ),
  ],
)
class $AppRouter {}
