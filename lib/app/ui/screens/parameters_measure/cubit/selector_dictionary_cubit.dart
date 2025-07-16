import 'package:flutter_bloc/flutter_bloc.dart';

class SelectorDictionaryCubit<T> extends Cubit<T?> {
  SelectorDictionaryCubit(super.value);

  set(T? value) {
    emit(value);
  }
}
