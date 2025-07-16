import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/user_additional_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_user_repository.dart';

part 'measure_limit_state.dart';
part 'measure_limit_cubit.freezed.dart';
part 'measure_limit_cubit.g.dart';

// const _recognitionQueue = 'RECOGNITION_QUEUE';
// const _measureLimit = 'MEASURE_LIMIT';

class MeasureLimitCubit extends Cubit<MeasureLimitState> {
  final IUserRepository userRepository;

  MeasureLimitCubit(this.userRepository)
    : super(
        const MeasureLimitState(
          totalCount: 0,
          leftCount: 0,
          showBlock: false,
          isFree: false,
        ),
      );

  fetch() async {
    // final prefs = await SharedPreferences.getInstance();
    final addData = userRepository.getUser();

    addData.fold(
      (_) {
        // final cacheState = prefs.getString(_measureLimit);
        // if (cacheState?.isNotEmpty ?? false) {
        //   final serialState = json.decode(cacheState!) as Map<String, dynamic>;
        //   emit(MeasureLimitState.fromJson(serialState));
        // }
      },
      (r) {
        emit(
          MeasureLimitState(
            showBlock: r.additional.showLimit,
            leftCount: r.subscription.recognitionLeft,
            totalCount: r.subscription.recognitionAvailable,
            isFree: r.subscription.isFree,
          ),
        );
      },
    );
  }

  addRecognition(double volume) async {
    // final prefs = await SharedPreferences.getInstance();
    // final list = prefs.getStringList(_recognitionQueue) ?? <String>[];
    userRepository.getUser().fold(
      (l) {
        // list.add(volume.toString());
        // prefs.setStringList(_recognitionQueue, list);
        // bool showBlock = state.showBlock;
        // if (!state.showBlock && state.leftCount < 8) {
        //   showBlock = true;
        // }
        // final newState = state.copyWith(
        //   leftCount: state.leftCount - 1,
        //   showBlock: showBlock,
        // );
        // _emitNewState(newState);
      },
      (r) async {
        UserAdditionalEntity? additional;
        var count = 1;
        var incrementVolume = volume;
        // if (list.isNotEmpty) {
        //   count += list.length;
        //   incrementVolume += list.fold(0.0, (p, e) => p + double.parse(e));
        // }
        if (!r.additional.showLimit && r.subscription.recognitionLeft < 9) {
          additional = r.additional.copyWith(showLimit: true);
        }
        final upd = r.copyWith(
          recognitionsCount: r.recognitionsCount + count,
          recognitionsVolume: r.recognitionsVolume + incrementVolume,
          subscription: r.subscription.copyWith(
            recognitionLeft: r.subscription.recognitionLeft - count,
          ),
          additional: additional,
        );

        await userRepository.updateMeasurements(upd);
        // res.fold(
        //   (l) {
        //     list.add(volume.toString());
        //     prefs.setStringList('${_recognitionQueue}_${r.uid}', list);
        //   },
        //   (_) {
        //     prefs.setStringList('${_recognitionQueue}_${r.uid}', []);
        //   },
        // );
        final newState = state.copyWith(
          leftCount: state.leftCount - count,
          showBlock: upd.additional.showLimit,
        );
        _emitNewState(newState, r.uid);
      },
    );
  }

  _emitNewState(MeasureLimitState newState, String uid) async {
    // final prefs = await SharedPreferences.getInstance();
    // prefs.setString('${_measureLimit}_$uid', json.encode(newState.toJson()));
    emit(newState);
  }
}
