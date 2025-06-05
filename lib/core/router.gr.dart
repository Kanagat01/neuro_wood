// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i24;

import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/cupertino.dart' as _i21;
import 'package:flutter/material.dart' as _i20;
import 'package:neuro_wood/app/domain/entities/measure_result_image_entity.dart'
    as _i26;
import 'package:neuro_wood/app/domain/entities/measure_type.dart' as _i23;
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart'
    as _i25;
import 'package:neuro_wood/app/domain/entities/user_entity.dart' as _i27;
import 'package:neuro_wood/app/ui/screens/auth/auth_screen.dart' as _i2;
import 'package:neuro_wood/app/ui/screens/auth/reauth_screen.dart' as _i3;
import 'package:neuro_wood/app/ui/screens/bottom_navigation/bottom_navigator.dart'
    as _i15;
import 'package:neuro_wood/app/ui/screens/camera/camera_screen.dart' as _i9;
import 'package:neuro_wood/app/ui/screens/main/main_screen.dart' as _i17;
import 'package:neuro_wood/app/ui/screens/measure_onboarding/measure_onboarding_screen.dart'
    as _i7;
import 'package:neuro_wood/app/ui/screens/measure_result/measure_result_image.dart'
    as _i11;
import 'package:neuro_wood/app/ui/screens/measure_result/measure_result_screen.dart'
    as _i10;
import 'package:neuro_wood/app/ui/screens/measurements/measurements_screen.dart'
    as _i16;
import 'package:neuro_wood/app/ui/screens/parameters_measure/parameters_measure_screen.dart'
    as _i8;
import 'package:neuro_wood/app/ui/screens/parameters_measure/selector_screen.dart'
    as _i6;
import 'package:neuro_wood/app/ui/screens/parameters_measure/widgets/input_select.dart'
    as _i22;
import 'package:neuro_wood/app/ui/screens/pdf_reader/pdf_reader_screen.dart'
    as _i5;
import 'package:neuro_wood/app/ui/screens/profile/profile_editor_screen.dart'
    as _i12;
import 'package:neuro_wood/app/ui/screens/profile/profile_screen.dart' as _i18;
import 'package:neuro_wood/app/ui/screens/register/register_screen.dart' as _i4;
import 'package:neuro_wood/app/ui/screens/splash/screen/splash_screen.dart'
    as _i1;
import 'package:neuro_wood/app/ui/screens/story_screen/onboarding_stories.dart'
    as _i13;
import 'package:neuro_wood/app/ui/screens/subscriptions/subscriptions.dart'
    as _i14;

class AppRouter extends _i19.RootStackRouter {
  AppRouter([_i20.GlobalKey<_i20.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    AuthScreen.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    ReauthScreen.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ReauthScreen(),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterScreen(),
      );
    },
    PDFReaderScreen.name: (routeData) {
      final args = routeData.argsAs<PDFReaderScreenArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.PDFReaderScreen(
          key: args.key,
          pdfPath: args.pdfPath,
          isAsset: args.isAsset,
        ),
      );
    },
    SelectorScreen.name: (routeData) {
      final args = routeData.argsAs<SelectorScreenArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i6.SelectorScreen(
          key: args.key,
          values: args.values,
          selectedValue: args.selectedValue,
          label: args.label,
        ),
      );
    },
    MultiSelectorScreen.name: (routeData) {
      final args = routeData.argsAs<MultiSelectorScreenArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i6.MultiSelectorScreen(
          key: args.key,
          values: args.values,
          selectedValues: args.selectedValues,
          label: args.label,
        ),
      );
    },
    MeasureOnboardingScreen.name: (routeData) {
      final args = routeData.argsAs<MeasureOnboardingScreenArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i7.MeasureOnboardingScreen(
          key: args.key,
          type: args.type,
        ),
      );
    },
    ParametersMeasureScreen.name: (routeData) {
      final args = routeData.argsAs<ParametersMeasureScreenArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.ParametersMeasureScreen(
          key: args.key,
          resultStream: args.resultStream,
          measure: args.measure,
        ),
      );
    },
    CameraScreen.name: (routeData) {
      final args = routeData.argsAs<CameraScreenArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i9.CameraScreen(
          key: args.key,
          type: args.type,
        ),
      );
    },
    MeasureResultScreen.name: (routeData) {
      final args = routeData.argsAs<MeasureResultScreenArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.MeasureResultScreen(
          key: args.key,
          result: args.result,
        ),
      );
    },
    MeasureResultImage.name: (routeData) {
      final args = routeData.argsAs<MeasureResultImageArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.MeasureResultImage(
          key: args.key,
          result: args.result,
        ),
      );
    },
    ProfileEditorScreen.name: (routeData) {
      final args = routeData.argsAs<ProfileEditorScreenArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.ProfileEditorScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    MeasureStoriesTimberCarrierScreen.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.MeasureStoriesTimberCarrierScreen(),
      );
    },
    MeasureStoriesStackScreen.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.MeasureStoriesStackScreen(),
      );
    },
    ReportStoriesScreen.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.ReportStoriesScreen(),
      );
    },
    OnboardingScreen.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.OnboardingScreen(),
      );
    },
    Subscriptions.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.Subscriptions(),
      );
    },
    BottomNavigator.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.BottomNavigator(),
      );
    },
    MeasurementsScreen.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.MeasurementsScreen(),
      );
    },
    MainScreen.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.MainScreen(),
      );
    },
    ProfileScreen.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.ProfileScreen(),
      );
    },
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'SplashRoute',
          fullMatch: true,
        ),
        _i19.RouteConfig(
          SplashScreen.name,
          path: 'SplashRoute',
        ),
        _i19.RouteConfig(
          AuthScreen.name,
          path: 'AuthRoute',
        ),
        _i19.RouteConfig(
          ReauthScreen.name,
          path: 'ReauthRoute',
        ),
        _i19.RouteConfig(
          RegisterScreen.name,
          path: 'RegisterRoute',
        ),
        _i19.RouteConfig(
          PDFReaderScreen.name,
          path: 'PDFReaderRoute',
        ),
        _i19.RouteConfig(
          SelectorScreen.name,
          path: 'SelectorRoute',
        ),
        _i19.RouteConfig(
          MultiSelectorScreen.name,
          path: 'MultiSelectorRoute',
        ),
        _i19.RouteConfig(
          MeasureOnboardingScreen.name,
          path: 'MeasureOnboardingRoute',
        ),
        _i19.RouteConfig(
          ParametersMeasureScreen.name,
          path: 'ParametersMeasureRoute',
        ),
        _i19.RouteConfig(
          CameraScreen.name,
          path: 'CameraScreenRoute',
        ),
        _i19.RouteConfig(
          MeasureResultScreen.name,
          path: 'MeasureResultRoute',
        ),
        _i19.RouteConfig(
          MeasureResultImage.name,
          path: 'MeasureResultImageRoute',
        ),
        _i19.RouteConfig(
          ProfileEditorScreen.name,
          path: 'ProfileEditorRoute',
        ),
        _i19.RouteConfig(
          MeasureStoriesTimberCarrierScreen.name,
          path: 'MeasureStoriesTimberCarrierRoute',
        ),
        _i19.RouteConfig(
          MeasureStoriesStackScreen.name,
          path: 'MeasureStoriesStackRoute',
        ),
        _i19.RouteConfig(
          ReportStoriesScreen.name,
          path: 'ReportStoriesRoute',
        ),
        _i19.RouteConfig(
          OnboardingScreen.name,
          path: 'OnboardingRoute',
        ),
        _i19.RouteConfig(
          Subscriptions.name,
          path: 'SubscriptionsRoute',
        ),
        _i19.RouteConfig(
          BottomNavigator.name,
          path: 'BottomNavigation',
          children: [
            _i19.RouteConfig(
              '#redirect',
              path: '',
              parent: BottomNavigator.name,
              redirectTo: 'MainRoute',
              fullMatch: true,
            ),
            _i19.RouteConfig(
              MeasurementsScreen.name,
              path: 'MeasurementsRoute',
              parent: BottomNavigator.name,
            ),
            _i19.RouteConfig(
              MainScreen.name,
              path: 'MainRoute',
              parent: BottomNavigator.name,
            ),
            _i19.RouteConfig(
              ProfileScreen.name,
              path: 'ProfileRoute',
              parent: BottomNavigator.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i19.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: 'SplashRoute',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthScreen extends _i19.PageRouteInfo<void> {
  const AuthScreen()
      : super(
          AuthScreen.name,
          path: 'AuthRoute',
        );

  static const String name = 'AuthScreen';
}

/// generated route for
/// [_i3.ReauthScreen]
class ReauthScreen extends _i19.PageRouteInfo<void> {
  const ReauthScreen()
      : super(
          ReauthScreen.name,
          path: 'ReauthRoute',
        );

  static const String name = 'ReauthScreen';
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterScreen extends _i19.PageRouteInfo<void> {
  const RegisterScreen()
      : super(
          RegisterScreen.name,
          path: 'RegisterRoute',
        );

  static const String name = 'RegisterScreen';
}

/// generated route for
/// [_i5.PDFReaderScreen]
class PDFReaderScreen extends _i19.PageRouteInfo<PDFReaderScreenArgs> {
  PDFReaderScreen({
    _i21.Key? key,
    required String pdfPath,
    bool isAsset = true,
  }) : super(
          PDFReaderScreen.name,
          path: 'PDFReaderRoute',
          args: PDFReaderScreenArgs(
            key: key,
            pdfPath: pdfPath,
            isAsset: isAsset,
          ),
        );

  static const String name = 'PDFReaderScreen';
}

class PDFReaderScreenArgs {
  const PDFReaderScreenArgs({
    this.key,
    required this.pdfPath,
    this.isAsset = true,
  });

  final _i21.Key? key;

  final String pdfPath;

  final bool isAsset;

  @override
  String toString() {
    return 'PDFReaderScreenArgs{key: $key, pdfPath: $pdfPath, isAsset: $isAsset}';
  }
}

/// generated route for
/// [_i6.SelectorScreen]
class SelectorScreen extends _i19.PageRouteInfo<SelectorScreenArgs> {
  SelectorScreen({
    _i21.Key? key,
    required List<_i22.InputSelectAdapter<dynamic>> values,
    required _i22.InputSelectAdapter<dynamic>? selectedValue,
    required String label,
  }) : super(
          SelectorScreen.name,
          path: 'SelectorRoute',
          args: SelectorScreenArgs(
            key: key,
            values: values,
            selectedValue: selectedValue,
            label: label,
          ),
        );

  static const String name = 'SelectorScreen';
}

class SelectorScreenArgs {
  const SelectorScreenArgs({
    this.key,
    required this.values,
    required this.selectedValue,
    required this.label,
  });

  final _i21.Key? key;

  final List<_i22.InputSelectAdapter<dynamic>> values;

  final _i22.InputSelectAdapter<dynamic>? selectedValue;

  final String label;

  @override
  String toString() {
    return 'SelectorScreenArgs{key: $key, values: $values, selectedValue: $selectedValue, label: $label}';
  }
}

/// generated route for
/// [_i6.MultiSelectorScreen]
class MultiSelectorScreen extends _i19.PageRouteInfo<MultiSelectorScreenArgs> {
  MultiSelectorScreen({
    _i21.Key? key,
    required List<_i22.InputSelectAdapter<dynamic>> values,
    required List<_i22.InputSelectAdapter<dynamic>>? selectedValues,
    required String label,
  }) : super(
          MultiSelectorScreen.name,
          path: 'MultiSelectorRoute',
          args: MultiSelectorScreenArgs(
            key: key,
            values: values,
            selectedValues: selectedValues,
            label: label,
          ),
        );

  static const String name = 'MultiSelectorScreen';
}

class MultiSelectorScreenArgs {
  const MultiSelectorScreenArgs({
    this.key,
    required this.values,
    required this.selectedValues,
    required this.label,
  });

  final _i21.Key? key;

  final List<_i22.InputSelectAdapter<dynamic>> values;

  final List<_i22.InputSelectAdapter<dynamic>>? selectedValues;

  final String label;

  @override
  String toString() {
    return 'MultiSelectorScreenArgs{key: $key, values: $values, selectedValues: $selectedValues, label: $label}';
  }
}

/// generated route for
/// [_i7.MeasureOnboardingScreen]
class MeasureOnboardingScreen
    extends _i19.PageRouteInfo<MeasureOnboardingScreenArgs> {
  MeasureOnboardingScreen({
    _i21.Key? key,
    required _i23.MeasureType type,
  }) : super(
          MeasureOnboardingScreen.name,
          path: 'MeasureOnboardingRoute',
          args: MeasureOnboardingScreenArgs(
            key: key,
            type: type,
          ),
        );

  static const String name = 'MeasureOnboardingScreen';
}

class MeasureOnboardingScreenArgs {
  const MeasureOnboardingScreenArgs({
    this.key,
    required this.type,
  });

  final _i21.Key? key;

  final _i23.MeasureType type;

  @override
  String toString() {
    return 'MeasureOnboardingScreenArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i8.ParametersMeasureScreen]
class ParametersMeasureScreen
    extends _i19.PageRouteInfo<ParametersMeasureScreenArgs> {
  ParametersMeasureScreen({
    _i21.Key? key,
    _i24.Stream<_i25.MeasureResultEntityBase?>? resultStream,
    required _i25.MeasureResultEntityBase measure,
  }) : super(
          ParametersMeasureScreen.name,
          path: 'ParametersMeasureRoute',
          args: ParametersMeasureScreenArgs(
            key: key,
            resultStream: resultStream,
            measure: measure,
          ),
        );

  static const String name = 'ParametersMeasureScreen';
}

class ParametersMeasureScreenArgs {
  const ParametersMeasureScreenArgs({
    this.key,
    this.resultStream,
    required this.measure,
  });

  final _i21.Key? key;

  final _i24.Stream<_i25.MeasureResultEntityBase?>? resultStream;

  final _i25.MeasureResultEntityBase measure;

  @override
  String toString() {
    return 'ParametersMeasureScreenArgs{key: $key, resultStream: $resultStream, measure: $measure}';
  }
}

/// generated route for
/// [_i9.CameraScreen]
class CameraScreen extends _i19.PageRouteInfo<CameraScreenArgs> {
  CameraScreen({
    _i21.Key? key,
    required _i23.MeasureType type,
  }) : super(
          CameraScreen.name,
          path: 'CameraScreenRoute',
          args: CameraScreenArgs(
            key: key,
            type: type,
          ),
        );

  static const String name = 'CameraScreen';
}

class CameraScreenArgs {
  const CameraScreenArgs({
    this.key,
    required this.type,
  });

  final _i21.Key? key;

  final _i23.MeasureType type;

  @override
  String toString() {
    return 'CameraScreenArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i10.MeasureResultScreen]
class MeasureResultScreen extends _i19.PageRouteInfo<MeasureResultScreenArgs> {
  MeasureResultScreen({
    _i21.Key? key,
    required _i25.MeasureResultEntityFinish result,
  }) : super(
          MeasureResultScreen.name,
          path: 'MeasureResultRoute',
          args: MeasureResultScreenArgs(
            key: key,
            result: result,
          ),
        );

  static const String name = 'MeasureResultScreen';
}

class MeasureResultScreenArgs {
  const MeasureResultScreenArgs({
    this.key,
    required this.result,
  });

  final _i21.Key? key;

  final _i25.MeasureResultEntityFinish result;

  @override
  String toString() {
    return 'MeasureResultScreenArgs{key: $key, result: $result}';
  }
}

/// generated route for
/// [_i11.MeasureResultImage]
class MeasureResultImage extends _i19.PageRouteInfo<MeasureResultImageArgs> {
  MeasureResultImage({
    _i21.Key? key,
    required _i26.MeasureResultImageEntity result,
  }) : super(
          MeasureResultImage.name,
          path: 'MeasureResultImageRoute',
          args: MeasureResultImageArgs(
            key: key,
            result: result,
          ),
        );

  static const String name = 'MeasureResultImage';
}

class MeasureResultImageArgs {
  const MeasureResultImageArgs({
    this.key,
    required this.result,
  });

  final _i21.Key? key;

  final _i26.MeasureResultImageEntity result;

  @override
  String toString() {
    return 'MeasureResultImageArgs{key: $key, result: $result}';
  }
}

/// generated route for
/// [_i12.ProfileEditorScreen]
class ProfileEditorScreen extends _i19.PageRouteInfo<ProfileEditorScreenArgs> {
  ProfileEditorScreen({
    _i21.Key? key,
    required _i27.UserEntity user,
  }) : super(
          ProfileEditorScreen.name,
          path: 'ProfileEditorRoute',
          args: ProfileEditorScreenArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'ProfileEditorScreen';
}

class ProfileEditorScreenArgs {
  const ProfileEditorScreenArgs({
    this.key,
    required this.user,
  });

  final _i21.Key? key;

  final _i27.UserEntity user;

  @override
  String toString() {
    return 'ProfileEditorScreenArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i13.MeasureStoriesTimberCarrierScreen]
class MeasureStoriesTimberCarrierScreen extends _i19.PageRouteInfo<void> {
  const MeasureStoriesTimberCarrierScreen()
      : super(
          MeasureStoriesTimberCarrierScreen.name,
          path: 'MeasureStoriesTimberCarrierRoute',
        );

  static const String name = 'MeasureStoriesTimberCarrierScreen';
}

/// generated route for
/// [_i13.MeasureStoriesStackScreen]
class MeasureStoriesStackScreen extends _i19.PageRouteInfo<void> {
  const MeasureStoriesStackScreen()
      : super(
          MeasureStoriesStackScreen.name,
          path: 'MeasureStoriesStackRoute',
        );

  static const String name = 'MeasureStoriesStackScreen';
}

/// generated route for
/// [_i13.ReportStoriesScreen]
class ReportStoriesScreen extends _i19.PageRouteInfo<void> {
  const ReportStoriesScreen()
      : super(
          ReportStoriesScreen.name,
          path: 'ReportStoriesRoute',
        );

  static const String name = 'ReportStoriesScreen';
}

/// generated route for
/// [_i13.OnboardingScreen]
class OnboardingScreen extends _i19.PageRouteInfo<void> {
  const OnboardingScreen()
      : super(
          OnboardingScreen.name,
          path: 'OnboardingRoute',
        );

  static const String name = 'OnboardingScreen';
}

/// generated route for
/// [_i14.Subscriptions]
class Subscriptions extends _i19.PageRouteInfo<void> {
  const Subscriptions()
      : super(
          Subscriptions.name,
          path: 'SubscriptionsRoute',
        );

  static const String name = 'Subscriptions';
}

/// generated route for
/// [_i15.BottomNavigator]
class BottomNavigator extends _i19.PageRouteInfo<void> {
  const BottomNavigator({List<_i19.PageRouteInfo>? children})
      : super(
          BottomNavigator.name,
          path: 'BottomNavigation',
          initialChildren: children,
        );

  static const String name = 'BottomNavigator';
}

/// generated route for
/// [_i16.MeasurementsScreen]
class MeasurementsScreen extends _i19.PageRouteInfo<void> {
  const MeasurementsScreen()
      : super(
          MeasurementsScreen.name,
          path: 'MeasurementsRoute',
        );

  static const String name = 'MeasurementsScreen';
}

/// generated route for
/// [_i17.MainScreen]
class MainScreen extends _i19.PageRouteInfo<void> {
  const MainScreen()
      : super(
          MainScreen.name,
          path: 'MainRoute',
        );

  static const String name = 'MainScreen';
}

/// generated route for
/// [_i18.ProfileScreen]
class ProfileScreen extends _i19.PageRouteInfo<void> {
  const ProfileScreen()
      : super(
          ProfileScreen.name,
          path: 'ProfileRoute',
        );

  static const String name = 'ProfileScreen';
}
