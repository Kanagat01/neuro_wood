import 'package:flutter_bloc/flutter_bloc.dart';

class PaddingNotifierCubit extends Cubit<double> {
  PaddingNotifierCubit(super.initValue);

  set(double value) {
    emit(value);
  }
}
