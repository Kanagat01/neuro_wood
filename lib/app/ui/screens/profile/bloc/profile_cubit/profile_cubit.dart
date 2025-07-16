import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_user_repository.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final IUserRepository userRepository;
  ProfileCubit({required this.userRepository})
    : super(const ProfileState.initial());

  getData() {
    final eitherUser = userRepository.getUser();
    eitherUser.fold(
      (l) {
        emit(const ProfileState.error());
      },
      (r) {
        emit(ProfileState.hasData(r));
      },
    );
  }

  deleteUser() {}
}
