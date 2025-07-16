import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_wood/app/data/model/user_additional_model.dart';
import 'package:neuro_wood/app/domain/entities/measure_type.dart';
import 'package:neuro_wood/app/domain/repositories/i_user_additional_repository.dart';
import 'package:neuro_wood/app/ui/screens/main/cubit/cubit/measure_limit_cubit.dart';
import 'package:neuro_wood/app/ui/screens/register/bloc/checkbox_cubit/checkbox_cubit.dart';
import 'package:neuro_wood/core/injection.dart';
import 'package:neuro_wood/core/services/permissions/permissions.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  final Permissions _permissions;
  final IUserAdditionalRepository userRepository;
  MainScreenState prevState = MainScreenState.initial;
  ToggleCubit buttonEnabled = getIt.get<ToggleCubit>(
    param1: true,
    param2: null,
  );
  late ToggleCubit showPullUp;
  late bool showOnboarding;
  final MeasureLimitCubit measureLimitCubit;
  // late ToggleCubit showOnboarding;
  MainScreenCubit({
    required Permissions permissions,
    required this.userRepository,
    required this.measureLimitCubit,
  }) : _permissions = permissions,
       super(MainScreenState.initial) {
    userRepository.getAdditional().fold(
      (l) {
        showPullUp = getIt.get<ToggleCubit>(param1: false, param2: null);
        showOnboarding = true;
      },
      (r) {
        showPullUp = getIt.get<ToggleCubit>(
          param1: r.showedPullUp,
          param2: null,
        );
        showOnboarding = r.showedOnboarding;
      },
    );
  }

  checkPermissions(MeasureType type) async {
    if (measureLimitCubit.state.leftCount == 0) {
      prevState = MainScreenState(
        checker: MainScreenStateChecker.noRecognitionLeft,
        type: type,
      );
      emit(prevState);
      prevState = MainScreenState.initial;
      emit(prevState);
      return;
    }
    buttonEnabled.toggle();

    // final map = {
    //   for (final p in PermissionsEnum.values) p: await _permissions.checkPermission(p)
    // };
    final List<Future<PermissionStatus>> allFuturePerms = PermissionsEnum.values
        .map(_permissions.checkPermission)
        .toList();
    // final map = {for (final p in PermissionsEnum.values) p: await _permissions.checkPermission(p)};

    //проверяем все статусы разрешений
    List<PermissionStatus> perms = await Future.wait(allFuturePerms);

    //конвертируем статусы в мапу для удобства работы
    Map<PermissionsEnum, PermissionStatus> map = {};
    for (int i = 0; i < PermissionsEnum.values.length; i++) {
      map[PermissionsEnum.values[i]] = perms[i];
    }

    for (MapEntry item in map.entries) {
      if (item.value == PermissionStatus.denied) {
        await _permissions.request(item.key);
      }
    }

    buttonEnabled.toggle();
    prevState = MainScreenState(
      checker: MainScreenStateChecker.checked,
      type: type,
    );
    emit(prevState);
    prevState = MainScreenState.initial;
    emit(prevState);
  }

  setShowedPullUp() {
    if (!showPullUp.state) {
      showPullUp.set(true);
      userRepository.getAdditional().fold((l) {}, (r) {
        UserAdditionalModel m = UserAdditionalModel.fromEntity(
          UserAdditionalModel.fromEntity(r).copyWith(showedPullUp: true),
        );
        userRepository.setAdditional(m);
      });
    }
  }

  setShowedOnboarding() {
    if (!showOnboarding) {
      showOnboarding = true;
      userRepository.getAdditional().fold((l) {}, (r) {
        UserAdditionalModel m = UserAdditionalModel.fromEntity(
          UserAdditionalModel.fromEntity(r).copyWith(showedOnboarding: true),
        );
        userRepository.setAdditional(m);
      });
    }
  }
}
