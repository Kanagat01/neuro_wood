part of 'main_screen_cubit.dart';

class MainScreenState {
  final MainScreenStateChecker checker;
  final MeasureType? type;

  const MainScreenState({
    required this.checker,
    this.type,
  });

  static const initial = MainScreenState(
    checker: MainScreenStateChecker.initial,
  );
}

enum MainScreenStateChecker {
  initial,
  checked,
  noRecognitionLeft,
}
