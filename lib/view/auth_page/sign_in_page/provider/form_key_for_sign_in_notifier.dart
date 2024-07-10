import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_key_for_sign_in_notifier.g.dart';

@riverpod
class FormKeyForSignInNotifier extends _$FormKeyForSignInNotifier {
  @override
  GlobalKey<FormState> build() {
    return GlobalKey<FormState>();
  }
}