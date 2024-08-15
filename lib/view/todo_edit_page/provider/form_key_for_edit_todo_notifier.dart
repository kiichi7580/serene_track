import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_key_for_edit_todo_notifier.g.dart';

@riverpod
class FormKeyForEditTodoNotifier extends _$FormKeyForEditTodoNotifier {
  @override
  GlobalKey<FormState> build() {
    return GlobalKey<FormState>();
  }
}
