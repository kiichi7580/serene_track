import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_key_for_sign_up_notifier.g.dart';

@riverpod
class FormKeyForSignUpNotifier extends _$FormKeyForSignUpNotifier {
  @override
  GlobalKey<FormState> build() {
    return GlobalKey<FormState>();
  }
}