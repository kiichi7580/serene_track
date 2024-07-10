import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_text_cotroller_notifier.g.dart';

@riverpod
class SignUpEmailControllerNotifier extends _$SignUpEmailControllerNotifier {
  @override
  TextEditingController build() {
    return TextEditingController(text: '');
  }
}

@riverpod
class SignUpPasswordControllerNotifier extends _$SignUpPasswordControllerNotifier {
  @override
  TextEditingController build() {
    return TextEditingController(text: '');
  }
}

@riverpod
class SignUpConfirmationPasswordControllerNotifier
    extends _$SignUpConfirmationPasswordControllerNotifier {
  @override
  TextEditingController build() {
    return TextEditingController(text: '');
  }
}
