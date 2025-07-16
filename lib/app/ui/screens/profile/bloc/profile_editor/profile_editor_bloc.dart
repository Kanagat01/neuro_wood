import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_user_repository.dart';
import 'package:neuro_wood/app/ui/screens/register/bloc/checkbox_cubit/checkbox_cubit.dart';
import 'package:neuro_wood/core/injection.dart';

part 'profile_editor_event.dart';
part 'profile_editor_state.dart';
part 'profile_editor_bloc.freezed.dart';

class ProfileEditorBloc extends Bloc<ProfileEditorEvent, ProfileEditorState> {
  final ProfileEditorInput name = ProfileEditorInput(
    enableValidate: getIt.get<ToggleCubit>(param1: false, param2: null),
    controller: TextEditingController(),
    focusNode: FocusNode(),
    isValid: true,
  );
  final ProfileEditorInput phone = ProfileEditorInput(
    enableValidate: getIt.get<ToggleCubit>(param1: false, param2: null),
    controller: MaskedTextController(mask: '000 000 00 00'),
    focusNode: FocusNode(),
    isValid: true,
  );
  final ProfileEditorInput company = ProfileEditorInput(
    enableValidate: getIt.get<ToggleCubit>(param1: false, param2: null),
    controller: TextEditingController(),
    focusNode: FocusNode(),
    isValid: true,
  );
  final ProfileEditorInput email = ProfileEditorInput(
    enableValidate: getIt.get<ToggleCubit>(param1: false, param2: null),
    controller: TextEditingController(),
    focusNode: FocusNode(),
    isValid: true,
  );

  late List<ProfileEditorInput> _wrappers;
  TextEditingController get nameController => name.controller;
  TextEditingController get companyController => company.controller;
  TextEditingController get phoneController => phone.controller;
  TextEditingController get emailController => email.controller;
  final ToggleCubit isActiveBtn = getIt.get<ToggleCubit>(
    param1: false,
    param2: null,
  );

  final RegExp emailRegexp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  final IUserRepository userRepository;
  final UserEntity user;
  ProfileEditorBloc({required this.userRepository, required this.user})
    : super(const ProfileEditorInitial()) {
    on<_Save>(_save);
    name.oldValue = user.name;
    nameController.addListener(_nameListener);
    company.oldValue = user.company;
    companyController.addListener(_companyListener);
    phone.oldValue = user.workPhone.replaceAll('+7', '');
    phoneController.addListener(_phoneListener);
    email.oldValue = user.email;
    emailController.addListener(_emailListener);
    _wrappers = [name, phone, company, email];

    for (var e in _wrappers) {
      e.focusNode.addListener(() {
        if (e.focusNode.hasFocus && !e.wasFocus) {
          e.wasFocus = true;
        }
      });
    }

    KeyboardVisibilityController().onChange.listen((event) {
      if (!event) {
        for (var e in _wrappers) {
          if (e.wasFocus && !e.enableValidate.state) {
            e.enableValidate.toggle();
          }
        }
      }
    });
  }

  _nameListener() {
    String value = nameController.text.trim();
    name.isChange = value != name.oldValue;
    if (value.isNotEmpty && value.length <= 60) {
      if (!name.isValid) {
        name.isValid = true;
      }
      _listenerFields();
    } else if ((value.isEmpty || value.length > 60) && name.isValid) {
      name.isValid = false;
      _listenerFields();
    }
  }

  _companyListener() {
    String value = companyController.text.trim();
    company.isChange = value != company.oldValue;
    if (value.isNotEmpty && value.length <= 60) {
      if (!company.isValid) {
        company.isValid = true;
      }
      _listenerFields();
    } else if ((value.isEmpty || value.length > 60) && company.isValid) {
      company.isValid = false;
      _listenerFields();
    }
  }

  _phoneListener() {
    String value = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
    phone.isChange = value != phone.oldValue;
    if (value.length == 10) {
      if (!phone.isValid) {
        phone.isValid = true;
      }
      _listenerFields();
    } else if (value.length != 10 && phone.isValid) {
      phone.isValid = false;
      _listenerFields();
    }
  }

  _emailListener() {
    String value = emailController.text.trim();
    email.isChange = email.controller.text.trim() != email.oldValue;
    if (value.isNotEmpty && emailRegexp.hasMatch(value)) {
      if (!email.isValid) {
        email.isValid = true;
      }
      _listenerFields();
    } else if ((value.isEmpty || !emailRegexp.hasMatch(value)) &&
        email.isValid) {
      email.isValid = false;
      _listenerFields();
    }
  }

  _listenerFields() {
    Set<bool> allFieldValid = _wrappers.map((e) => e.isValid).toSet();
    bool valideFields = allFieldValid.length == 1 && allFieldValid.first;
    bool hasChengedField = _wrappers.where((e) => e.isChange).isNotEmpty;
    if ((!isActiveBtn.state && valideFields && hasChengedField) ||
        (isActiveBtn.state && (!valideFields || !hasChengedField))) {
      isActiveBtn.toggle();
    }
  }

  _save(_Save event, Emitter<ProfileEditorState> emit) async {
    emit(const ProfileEditorState.sending());
    String workPhone = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
    workPhone = '+7$workPhone';
    UserEntity newUser = user.copyWith(
      workPhone: workPhone,
      company: companyController.text.trim(),
      email: emailController.text.trim(),
      name: nameController.text.trim(),
    );
    final res = await userRepository.updateUser(newUser);
    res.fold(
      (l) {
        emit(ProfileEditorState.error(e: "changeUserDataError".tr()));
      },
      (r) {
        emit(const ProfileEditorState.sucess());
      },
    );
  }
}

class ProfileEditorInput {
  final TextEditingController controller;
  final FocusNode focusNode;
  bool isCheckedKeyboard = false;
  ToggleCubit enableValidate;
  bool wasFocus = false;
  bool isValid = false;
  late String _oldValue;
  bool isChange = false;

  set oldValue(String value) {
    _oldValue = value;
    controller.text = value;
  }

  String get oldValue => _oldValue;

  ProfileEditorInput({
    required this.controller,
    required this.focusNode,
    required this.enableValidate,
    this.isValid = false,
  });
}
