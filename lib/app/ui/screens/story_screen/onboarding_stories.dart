import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_wood/app/domain/entities/measure_type.dart';
import 'package:neuro_wood/app/ui/screens/main/cubit/permission_cubit/main_screen_cubit.dart';
import 'package:neuro_wood/core/injection.dart';

import 'package:neuro_wood/core/ui/theme.dart';

import 'widgets/stories.dart';

class MeasureStoriesTimberCarrierScreen extends StatelessWidget {
  const MeasureStoriesTimberCarrierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<MainScreenCubit>();
    return BlocListener<MainScreenCubit, MainScreenState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.checker == MainScreenStateChecker.checked &&
            cubit.prevState.checker != MainScreenStateChecker.checked) {
          if (state.type != null) {
            context.pop();
            context.push('/camera', extra: {'type': state.type!});
          }
        } else if (state.checker == MainScreenStateChecker.noRecognitionLeft &&
            cubit.prevState.checker !=
                MainScreenStateChecker.noRecognitionLeft) {
          context.pop(MainScreenStateChecker.noRecognitionLeft);
        }
      },
      child: OnboradingStories(
        stories: _stories.sublist(10, 16),
        lastStoryButtonOnTap: () {
          cubit.checkPermissions(MeasureType.timberCarrier);
        },
      ),
    );
  }
}

class MeasureStoriesStackScreen extends StatelessWidget {
  const MeasureStoriesStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<MainScreenCubit>();
    return BlocListener<MainScreenCubit, MainScreenState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.checker == MainScreenStateChecker.checked &&
            cubit.prevState.checker != MainScreenStateChecker.checked) {
          if (state.type != null) {
            context.go('/camera', extra: {'type': state.type!});
          }
        } else if (state.checker == MainScreenStateChecker.noRecognitionLeft &&
            cubit.prevState.checker !=
                MainScreenStateChecker.noRecognitionLeft) {
          context.pop(MainScreenStateChecker.noRecognitionLeft);
        }
      },
      child: OnboradingStories(
        stories: _stories.sublist(16, 20),
        lastStoryButtonOnTap: () {
          cubit.checkPermissions(MeasureType.stack);
        },
      ),
    );
  }
}

class ReportStoriesScreen extends StatelessWidget {
  const ReportStoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboradingStories(stories: _stories.sublist(20));
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboradingStories(stories: _stories.sublist(0, 5));
  }
}

//0, 1, 2, 3, 4
//
List<StoryItem> _stories = [
  //0 первый запуск
  const StoryItem(
    text:
        "Добро пожаловать в «Нейровуд»! Это удобная цифровая платформа измерения древесины с высокой точностью",
    imagePath: 'assets/images/stories/9.png',
  ),
  const StoryItem(
    text:
        "«Нейровуд» позволяет сделать измерение лесовоза, штабеля и геометрический замер без доступа к сотовой сети",
    imagePath: 'assets/images/stories/10.png',
  ),
  const StoryItem(
    text:
        "Смахнув нижнее меню вверх, вы найдёте инструкции с правилами измерения древесины и работы с приложением",
    imagePath: 'assets/images/stories/11.png',
  ),
  const StoryItem(
    text:
        "В разделе «Замеры» хранятся отчеты с выполненными вами измерениями древесины",
    imagePath: 'assets/images/stories/12.png',
  ),
  const StoryItem(
    text:
        "Измерение древесины сделать просто: разместите эталон (треугольник) по центру штабеля и сфотографируйте",
    imagePath: 'assets/images/stories/13.png',
  ),
  //5
  const StoryItem(
    text:
        "Добро пожаловать в «Нейровуд»! Это удобная цифровая платформа измерения древесины с высокой точностью",
    imagePath: 'assets/images/stories/9.png',
  ),
  const StoryItem(
    text:
        "«Нейровуд» позволяет сделать измерение лесовоза, штабеля и геометрический замер без доступа к сотовой сети",
    imagePath: 'assets/images/stories/32.png',
  ),
  const StoryItem(
    text:
        "Измерение древесины сделать просто: разместите эталон строго вертикально на одном из бревен, одним из углов вниз",
    imagePath: 'assets/images/stories/36.png',
  ),
  const StoryItem(
    text:
        "Держите телефон ровно. При отклонении по горизонтали или вертикали сделать фото не получится",
    imagePath: 'assets/images/stories/37.png',
  ),
  const StoryItem(
    text:
        "В разделе «Замеры» хранятся отчеты с выполненными вами измерениями древесины",
    imagePath: 'assets/images/stories/34.png',
  ),
  //10 лесовоз
  const StoryItem(
    text:
        "Разместите эталон строго вертикально на одном из бревен, одним из углов вниз",
    imagePath: 'assets/images/stories/36.png',
  ),
  const StoryItem(
    text:
        "Эталон попадает в ограничивающую рамку и находится как можно ближе к центру лесовоза",
    imagePath: 'assets/images/stories/13.png',
  ),
  const StoryItem(
    text: "Бревна находятся как можно ближе к ограничивающей рамке",
    imagePath: 'assets/images/stories/21.png',
  ),
  const StoryItem(
    text:
        "Держите телефон ровно. При отклонении по горизонтали или вертикали сделать фото не получится",
    imagePath: 'assets/images/stories/22.png',
  ),
  const StoryItem(
    text:
        "Выберите локацию, породу и сортимент, укажите номинальную длину древесину",
    imagePath: 'assets/images/stories/23.png',
  ),
  const StoryItem(
    text:
        "Если фото сделано корректно, через несколько секунд вы получите отчёт об измерении",
    imagePath: 'assets/images/stories/40.png',
  ),
  //16 штабель
  const StoryItem(
    text:
        "Разместите эталон строго вертикально на одном из бревен, одним из углов вниз",
    imagePath: 'assets/images/stories/36.png',
  ),
  const StoryItem(
    text:
        "Держите телефон ровно. При отклонении по горизонтали или вертикали сделать фото не получится",
    imagePath: 'assets/images/stories/16.png',
  ),
  const StoryItem(
    text:
        "Выберите локацию, породу и сортимент, укажите номинальную длину древесину",
    imagePath: 'assets/images/stories/17.png',
  ),
  const StoryItem(
    text:
        "Если фото сделано корректно, через несколько секунд вы получите отчёт об измерении",
    imagePath: 'assets/images/stories/41.png',
  ),

  // const StoryItem(
  //   text: "Измерить древесину с NeuroWood - \nтак же просто, как сделать одно фото",
  //   imagePath: 'assets/images/stories/1.jpg',
  //   imageIsCover: true,
  // ),
  // const StoryItem(
  //   text: "Разместите эталон строго вертикально на одном из бревен, одним из углов вниз",
  //   imagePath: 'assets/images/stories/10.png',
  // ),
  // const StoryItem(
  //   text: "Эталон попадает в ограничивающую рамку и находится как можно ближе к центру лесовоза",
  //   imagePath: 'assets/images/stories/11.png',
  // ),
  // const StoryItem(
  //   text: "Бревна находятся как можно ближе к ограничивающей рамке",
  //   imagePath: 'assets/images/stories/9.png',
  // ),
  // const StoryItem(
  //   text: "Выберите локацию, породу\nи сортимент, укажите номинальную\nдлину древесины",
  //   imagePath: 'assets/images/stories/2.png',
  // ),
  // const StoryItem(
  //   text: "Гос. номер лесовоза и торцы\nдревесины должны быть чистыми,\nа также попадать в зоны для фото",
  //   imagePath: 'assets/images/stories/3.png',
  // ),
  // const StoryItem(
  //   text: "Держите телефон ровно.\nПри отклонении по горизонтали или вертикали сделать фото не получится",
  //   imagePath: 'assets/images/stories/4.png',
  // ),
  // const StoryItem(
  //   text: "Если фото сделано корректно, через несколько секунд Вы получите отчет об измерении",
  //   imagePath: 'assets/images/stories/5.png',
  // ),
  //20
  const StoryItem(
    text: "Все отчеты с измерениями древесины хранятся во вкладке “Замеры”",
    imagePath: 'assets/images/stories/6.png',
  ),
  const StoryItem(
    text:
        "Чтобы переслать результаты измерений, нажмите кнопку “Отправить отчет” и выберите способ отправки",
    imagePath: 'assets/images/stories/7.png',
  ),
  const StoryItem(
    text:
        "Отчет можно отправить по почте, через мессенджеры или сохранить на телефон",
    imagePath: 'assets/images/stories/8.png',
  ),
];

class OnboradingStories extends StatelessWidget {
  final List<StoryItem> stories;
  // final _momentDuration = const Duration(seconds: 5);
  final VoidCallback? lastStoryButtonOnTap;

  const OnboradingStories({
    super.key,
    required this.stories,
    this.lastStoryButtonOnTap,
  });

  Future _precache(BuildContext context) async {
    try {
      await Future.wait(
        stories.map((e) => precacheImage(AssetImage(e.imagePath), context)),
      );
    } catch (e) {
      log('ERROR PRECACHE STORIES: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final List<StoryItem> stories = _getStories();
    _precache(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Story(
          overlayColor: NeuroWoodColors.green,
          onEndStories: context.pop,
          stories: stories,
          momentDurationGetter: (idx) => stories[idx].duration,
          hasNextButton: false,
          disableSkip: false,
          lastStoryButtonOnTap: lastStoryButtonOnTap,
        ),
      ),
    );
  }
}
