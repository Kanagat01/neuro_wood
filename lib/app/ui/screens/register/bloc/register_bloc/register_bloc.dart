import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';
import 'package:neuro_wood/app/domain/repositories/i_register_repository.dart';
import 'package:neuro_wood/app/ui/screens/register/bloc/checkbox_cubit/checkbox_cubit.dart';
import 'package:neuro_wood/core/injection.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterInput name = RegisterInput(
    enableValidate: getIt.get<ToggleCubit>(param1: false, param2: null),
    controller: TextEditingController(),
    focusNode: FocusNode(),
  );
  final RegisterInput phone = RegisterInput(
    enableValidate: getIt.get<ToggleCubit>(param1: false, param2: null),
    controller: MaskedTextController(mask: '000 000 00 00'),
    focusNode: FocusNode(),
    isValid: true,
  );
  final RegisterInput company = RegisterInput(
    enableValidate: getIt.get<ToggleCubit>(param1: false, param2: null),
    controller: TextEditingController(),
    focusNode: FocusNode(),
  );
  final RegisterInput email = RegisterInput(
    enableValidate: getIt.get<ToggleCubit>(param1: false, param2: null),
    controller: TextEditingController(),
    focusNode: FocusNode(),
  );

  late List<RegisterInput> _wrappers;
  TextEditingController get nameController => name.controller;
  TextEditingController get companyController => company.controller;
  TextEditingController get phoneController => phone.controller;
  TextEditingController get emailController => email.controller;
  final ToggleCubit isAgree = getIt.get<ToggleCubit>(
    param1: false,
    param2: null,
  );
  final ToggleCubit isActiveBtn = getIt.get<ToggleCubit>(
    param1: false,
    param2: null,
  );
  String? _oldPhone;
  String? _uid;

  final RegExp emailRegexp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  final IRegisterRepository registerRepository;
  RegisterBloc({required this.registerRepository})
    : super(const RegisterInitial()) {
    on<_Send>(_send);
    on<_ChangeAgree>(_changeAgree);
    nameController.addListener(_nameListener);
    companyController.addListener(_companyListener);
    phoneController.addListener(_phoneListener);
    emailController.addListener(_emailListener);
    isAgree.stream.listen((_) => _listenerFields());
    _wrappers = [name, phone, company, email];
    final userEither = registerRepository.getCurrentUser();
    userEither.fold((failure) {}, (currentUser) async {
      _uid = currentUser.uid;
      _oldPhone = currentUser.phoneNumber!;
      phoneController.text = _oldPhone!.replaceAll('+7', '');
    });

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
    if (value.isNotEmpty && value.length <= 60 && !name.isValid) {
      name.isValid = true;
      _listenerFields();
    } else if ((value.isEmpty || value.length > 60) && name.isValid) {
      name.isValid = false;
      _listenerFields();
    }
  }

  _companyListener() {
    String value = companyController.text.trim();
    if (value.isNotEmpty && value.length <= 60 && !company.isValid) {
      company.isValid = true;
      _listenerFields();
    } else if ((value.isEmpty || value.length > 60) && company.isValid) {
      company.isValid = false;
      _listenerFields();
    }
  }

  _phoneListener() {
    String value = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if ((value.isEmpty && !phone.isValid) ||
        (value.length == 10 && !phone.isValid)) {
      phone.isValid = true;
      _listenerFields();
    } else if (value.length != 10 && phone.isValid) {
      phone.isValid = false;
      _listenerFields();
    }
  }

  _emailListener() {
    String value = emailController.text.trim();
    if (value.isNotEmpty && emailRegexp.hasMatch(value) && !email.isValid) {
      email.isValid = true;
      _listenerFields();
    } else if ((value.isEmpty || !emailRegexp.hasMatch(value)) &&
        email.isValid) {
      email.isValid = false;
      _listenerFields();
    }
  }

  _listenerFields() {
    if (!isAgree.state) {
      isActiveBtn.set(false);
      return;
    }
    Set<bool> allFieldValid = _wrappers.map((e) => e.isValid).toSet();
    bool v = allFieldValid.length == 1 && allFieldValid.first;
    if ((isActiveBtn.state && !v) || (!isActiveBtn.state && v)) {
      isActiveBtn.toggle();
    }
  }

  _send(_Send event, Emitter<RegisterState> emit) async {
    if (state is RegisterSending) return;
    emit(const RegisterState.sending());
    if (_oldPhone != null && _uid != null) {
      String phone = _oldPhone!;
      String workPhone = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
      workPhone = workPhone.isEmpty ? phone : '+7$workPhone';
      final res = await registerRepository.setUser(
        UserEntity(
          uid: _uid!,
          company: companyController.text.trim(),
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          phone: phone,
          recognitionsCount: 0,
          recognitionsVolume: 0,
          workPhone: workPhone,
          subscription: SubscriptionEntity.initial(),
        ),
      );
      res.fold(
        (l) {
          emit(RegisterState.error(e: "registerError".tr()));
        },
        (r) {
          emit(const RegisterState.sucess());
        },
      );
    } else {
      emit(RegisterState.error(e: "registerError".tr()));
    }
  }

  _changeAgree(_ChangeAgree event, Emitter<RegisterState> emit) {
    isAgree.toggle();
  }
}

class RegisterInput {
  final TextEditingController controller;
  final FocusNode focusNode;
  bool isCheckedKeyboard;
  ToggleCubit enableValidate;
  bool wasFocus;
  bool isValid;

  RegisterInput({
    required this.controller,
    required this.focusNode,
    this.isCheckedKeyboard = false,
    required this.enableValidate,
    this.wasFocus = false,
    this.isValid = false,
  });
}
