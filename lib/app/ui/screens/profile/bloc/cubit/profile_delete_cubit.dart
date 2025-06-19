import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/repositories/i_user_repository.dart';

part 'profile_delete_state.dart';
part 'profile_delete_cubit.freezed.dart';

class ProfileDeleteCubit extends Cubit<ProfileDeleteState> {
  ProfileDeleteCubit({required this.userRepository})
    : super(const ProfileDeleteState.initial());

  final IUserRepository userRepository;

  deleteAccount() async {
    emit(const ProfileDeleteState.progress());
    final res = await userRepository.deleteUser();
    res.fold((l) {
      if (l.exception.code == 'requires-recent-login') {
        emit(const ProfileDeleteState.needReauth());
      } else {
        log(l.exception.code);
        emit(const ProfileDeleteState.errorDelete());
      }
    }, (r) => emit(const ProfileDeleteState.success()));
    emit(const ProfileDeleteState.initial());
  }
}
