import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_key_for_add_todo_notifier.g.dart';

@riverpod
class FormKeyForAddTodoNotifier extends _$FormKeyForAddTodoNotifier {
  @override
  GlobalKey<FormState> build() {
    return GlobalKey<FormState>();
  }
}
