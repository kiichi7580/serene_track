import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_key_for_edit_account_notifier.g.dart';

@riverpod
class FormKeyForEditAccountNotifier extends _$FormKeyForEditAccountNotifier {
  @override
  GlobalKey<FormState> build() {
    return GlobalKey<FormState>();
  }
}
