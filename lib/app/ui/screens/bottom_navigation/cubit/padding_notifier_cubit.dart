import 'package:bloc/bloc.dart';

class PaddingNotifierCubit extends Cubit<double> {
  PaddingNotifierCubit(double initValue) : super(initValue);

  set(double value){
    emit(value);
  }
}
