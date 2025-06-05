import 'package:bloc/bloc.dart';

class SelectorDictionaryCubit<T> extends Cubit<T?> {
  SelectorDictionaryCubit(T? value) : super(value);

  set(T? value) {
    emit(value);
  }
}
