import 'package:flutter_bloc/flutter_bloc.dart';

class MultiSelectorDictionaryCubit<T> extends Cubit<List<T>?> {
  MultiSelectorDictionaryCubit(super.value);

  toggle(T? value) {
    final List<T> newState = List.from(state ?? []);
    if (value != null) {
      if (newState.contains(value)) {
        newState.remove(value);
      } else {
        newState.add(value);
      }
      emit(newState);
    }
  }

  set(List<T>? value) {
    emit(value);
  }
}
