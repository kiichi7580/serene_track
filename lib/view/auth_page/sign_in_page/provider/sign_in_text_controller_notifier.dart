import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_text_controller_notifier.g.dart';

@riverpod
class SignInEmailControllerNotifier extends _$SignInEmailControllerNotifier {
  @override
  TextEditingController build() {
    return TextEditingController(text: '');
  }
}

@riverpod
class SignInPasswordControllerNotifier extends _$SignInPasswordControllerNotifier {
  @override
  TextEditingController build() {
    return TextEditingController(text: '');
  }
}
