import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleCubit extends Cubit<bool> {
  ToggleCubit({bool value = false}) : super(value);

  toggle() {
    emit(!state);
  }

  set(bool value) {
    emit(value);
  }
}
