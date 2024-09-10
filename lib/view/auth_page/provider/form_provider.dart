import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/ui_core/validator/form_logic.dart';
import 'package:serene_track/model/enum/form_state.dart';

final formProvider =
    NotifierProvider<FormNotifier, FormStatus>(FormNotifier.new);

class FormNotifier extends Notifier<FormStatus> {
  @override
  build() {
    return FormStatus.initial;
  }

  late String passwordText = '';
  final FormLogic _formLogic = FormLogic();

  FormStatus validateForm(GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() == true) {
      state = FormStatus.valid;
      return state;
    } else {
      state = FormStatus.invalid;
      return state;
    }
  }

  void getConfirmationPassword(String? value) {
    passwordText = value!;
  }

  String? basicValidator(String? value) => _formLogic.basicValidator(value);

  String? emailrValidator(String? value) => _formLogic.emailValidator(value);

  String? passwordValidator(String? value) =>
      _formLogic.passwordValidator(value);

  String? confirmationPasswordValidator(String? value) =>
      _formLogic.confirmationPasswordValidator(
        value,
        passwordText: passwordText,
      );
}
