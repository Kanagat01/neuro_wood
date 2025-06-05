import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_wood/app/domain/entities/bottom_navigation_button_entity.dart';
import 'package:neuro_wood/app/ui/screens/bottom_navigation/cubit/padding_notifier_cubit.dart';
import 'package:neuro_wood/app/ui/screens/main/cubit/cubit/measure_limit_cubit.dart';
import 'package:neuro_wood/app/ui/screens/measurements/cubit/measurements_cubit.dart';
import 'package:neuro_wood/app/ui/screens/profile/bloc/cubit/profile_delete_cubit.dart';
import 'package:neuro_wood/app/ui/screens/profile/bloc/profile_cubit/profile_cubit.dart';
import 'package:neuro_wood/core/injection.dart';
import 'package:neuro_wood/core/router.gr.dart';
import 'package:neuro_wood/core/ui/dialogs/dialogs.dart';
import 'package:neuro_wood/core/ui/neuro_wood_icons.dart';
import 'package:neuro_wood/core/ui/theme.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main/cubit/permission_cubit/main_screen_cubit.dart';
import 'widgets/bottom_navigation_button.dart';
import 'widgets/grabbing_widget.dart';
import 'widgets/how_it_work_button.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

enum _DragState { initial, initialDraggable, awaitDrag, disable }

class _BottomNavigatorState extends State<BottomNavigator> {
  final List<BottomNavigationButtonEntity> _routes = [
    BottomNavigationButtonEntity(
      title: "measurementsButton".tr(),
      icon: 'ruler',
      index: _RoutesIndexes.measurements.index,
      route: const MeasurementsScreen(),
    ),
    BottomNavigationButtonEntity(
      title: "measureButton".tr(),
      icon: 'camera',
      index: _RoutesIndexes.measure.index,
      route: const MainScreen(),
    ),
    BottomNavigationButtonEntity(
      title: "profileButton".tr(),
      icon: 'profile',
      index: _RoutesIndexes.profile.index,
      route: const ProfileScreen(),
    ),
  ];

  bool wasEntranceOnboarding = false;

  final Map<_RoutesIndexes, bool> _loaded = {
    _RoutesIndexes.measurements: false,
    _RoutesIndexes.measure: true,
    _RoutesIndexes.profile: false,
  };

  _checkLoaded(_RoutesIndexes index, BuildContext context) {
    if (_loaded[index]!) {
      return;
    }
    switch (index) {
      case _RoutesIndexes.measurements:
        context.read<MeasurementsCubit>().getAll();
        _loaded[index] = true;
        break;
      case _RoutesIndexes.measure:
        break;
      case _RoutesIndexes.profile:
        context.read<ProfileCubit>().getData();
        _loaded[index] = true;
        break;
    }
  }

  _DragState dragState = _DragState.initial;
  Function? runAfterBuild;

  @override
  void initState() {
    super.initState();
    getIt.get<MeasureLimitCubit>().fetch();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (runAfterBuild != null) {
        Future.delayed(const Duration(seconds: 1), () {
          runAfterBuild!();
          runAfterBuild = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final paddingCubit = PaddingNotifierCubit(100);
    final double pb = MediaQuery.of(context).viewPadding.bottom;
    final double padBot = pb > 0 && Platform.isIOS ? pb - 20 : pb;

    final List<SnappingPosition> snappingPositions = [
      // SnappingPosition.pixels(
      //   positionPixels: 40,
      //   snappingCurve: Curves.easeOutExpo,
      //   snappingDuration: Duration(milliseconds: 250),
      //   grabbingContentOffset: GrabbingContentOffset.top,
      // ),
      SnappingPosition.pixels(
        positionPixels: 100 + padBot,
        grabbingContentOffset: GrabbingContentOffset.top,
        snappingCurve: Curves.easeOutExpo,
        snappingDuration: const Duration(milliseconds: 250),
      ),
      SnappingPosition.pixels(
        positionPixels: 300 + pb,
        grabbingContentOffset: GrabbingContentOffset.bottom,
        snappingCurve: Curves.easeOutExpo,
        snappingDuration: const Duration(milliseconds: 250),
      ),
    ];
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white.withAlpha(85),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt.get<MainScreenCubit>()),
          BlocProvider(create: (context) => getIt.get<ProfileCubit>()),
          BlocProvider(create: (context) => getIt.get<ProfileDeleteCubit>()),
          BlocProvider(create: (context) => getIt.get<MeasurementsCubit>()),
          BlocProvider(create: (context) => PaddingNotifierCubit(100)),
        ],
        child: Builder(
          builder: (context) {
            MainScreenCubit mainScreenCubit = context.read<MainScreenCubit>();
            if (!mainScreenCubit.showOnboarding && !wasEntranceOnboarding) {
              wasEntranceOnboarding = true;
              mainScreenCubit.setShowedOnboarding();
              runAfterBuild = () =>
                  context.router.push(const OnboardingScreen());
              // WidgetsBinding.instance?.addPostFrameCallback((_) {
              //   log("GO TO ONBOARDING");
              //   context.router.push(const OnboardingScreen());
              // });
            }
            return Material(
              color: NeuroWoodColors.white,
              child: AutoTabsRouter(
                lazyLoad: true,
                duration: const Duration(milliseconds: 250),
                homeIndex: 1,
                builder: (context, child, animation) {
                  final tabsRouter = AutoTabsRouter.of(context);
                  _checkLoaded(
                    _RoutesIndexes.values[tabsRouter.activeIndex],
                    context,
                  );
                  double mainWidth = MediaQuery.of(context).size.width - 32;
                  if (mainWidth > 343) {
                    mainWidth = 343;
                  }
                  final double howItWorkWidth = (mainWidth - 24) / 3;
                  const howItWorkheight = 115.0;

                  return SnappingSheet(
                    controller: SnappingSheetController(),
                    child: FadeTransition(
                      opacity: animation,
                      child: BlocBuilder<PaddingNotifierCubit, double>(
                        builder: (context, state) {
                          final Widget body = Padding(
                            padding: EdgeInsets.only(bottom: state),
                            child: child,
                          );

                          if (!mainScreenCubit.showPullUp.state &&
                              dragState == _DragState.initial) {
                            dragState = _DragState.initialDraggable;
                          } else if (mainScreenCubit.showPullUp.state &&
                              dragState == _DragState.initial) {
                            dragState = _DragState.disable;
                          }

                          if (tabsRouter.activeIndex == 1 &&
                              !mainScreenCubit.showPullUp.state) {
                            return Stack(
                              children: [
                                body,
                                _PullUp(bottom: state + pb),
                              ],
                            );
                          }
                          return body;
                        },
                      ),
                    ),
                    lockOverflowDrag: true,
                    onSheetMoved: (d) {
                      context.read<PaddingNotifierCubit>().set(
                        d.pixels - pb - 12,
                      );
                      if (dragState == _DragState.awaitDrag) {
                        context.read<MainScreenCubit>().setShowedPullUp();
                        dragState = _DragState.disable;
                      } else if (dragState == _DragState.initialDraggable) {
                        dragState = _DragState.awaitDrag;
                      }
                    },
                    initialSnappingPosition: snappingPositions[0],
                    snappingPositions: snappingPositions,
                    grabbing: const GrabbingWidget(),
                    grabbingHeight: 12,
                    sheetAbove: null,
                    sheetBelow: SnappingSheetContent(
                      sizeBehavior: SheetSizeStatic(size: 300 + pb * 2),
                      draggable: true,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 12,
                              color: Colors.black.withAlpha(10),
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10 + pb),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: mainWidth),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: _routes
                                      .map(
                                        (e) => BottomNavigationButton(
                                          data: e,
                                          selectedIndex: tabsRouter.activeIndex,
                                          onTap: () {
                                            tabsRouter.setActiveIndex(e.index);
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              SizedBox(height: 24 + padBot),
                              Text(
                                "howItWork".tr(),
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  HowItWorkButton(
                                    width: howItWorkWidth,
                                    height: howItWorkheight,
                                    backgroundGradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFDCFBF2),
                                        Color(0xFFD4E5FE),
                                      ],
                                    ),
                                    backgroundImage: 'btn_truck.png',
                                    title: "measureWoodTruck".tr(),
                                    onPressed: () async {
                                      final res = await context.router.push(
                                        const MeasureStoriesTimberCarrierScreen(),
                                      );
                                      if (res ==
                                          MainScreenStateChecker
                                              .noRecognitionLeft) {
                                        _showMenu(context);
                                      }
                                    },
                                  ),
                                  const SizedBox(width: 12),
                                  HowItWorkButton(
                                    width: howItWorkWidth,
                                    height: howItWorkheight,
                                    backgroundGradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFFFBF9B),
                                        Color(0xFFFECC67),
                                      ],
                                    ),
                                    backgroundImage: 'btn_timbers.png',
                                    title: "measureWoodStack".tr(),
                                    onPressed: () async {
                                      final res = await context.router.push(
                                        const MeasureStoriesStackScreen(),
                                      );
                                      if (res ==
                                          MainScreenStateChecker
                                              .noRecognitionLeft) {
                                        _showMenu(context);
                                      }
                                    },
                                  ),
                                  const SizedBox(width: 12),
                                  HowItWorkButton(
                                    width: howItWorkWidth,
                                    height: howItWorkheight,
                                    backgroundGradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFFFEDC9),
                                        Color(0xFFDAF4B0),
                                      ],
                                    ),
                                    backgroundImage: 'ruller_story.png',
                                    title: "reportsOfmeasure".tr(),
                                    onPressed: () {
                                      context.router.push(
                                        const ReportStoriesScreen(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                routes: _routes.map((e) => e.route).toList(),
              ),
            );
          },
        ),
      ),
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
}

enum _RoutesIndexes { measurements, measure, profile }

class _PullUp extends StatelessWidget {
  final double bottom;
  const _PullUp({Key? key, required this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const RotatedBox(
            quarterTurns: 2,
            child: Icon(
              NeuroWoodIcons.arrow_down,
              color: NeuroWoodColors.darkGray,
            ),
          ),
          Text(
            'pullUp'.tr(),
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
