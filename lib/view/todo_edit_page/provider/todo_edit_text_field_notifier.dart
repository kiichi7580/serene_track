import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serene_track/constant/text_source.dart';

part 'todo_edit_text_field_notifier.g.dart';

@riverpod
class TitleControllerNotifier extends _$TitleControllerNotifier {
  @override
  TextEditingController build(String text) {
    return TextEditingController(text: text);
  }
}

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  @override
  String? build() {
    return allTx;
  }

  void setValue(String? value) {
    state = value;
  }
}

@riverpod
class DescriptionControllerNotifier extends _$DescriptionControllerNotifier {
  @override
  TextEditingController build(String text) {
    return TextEditingController(text: text);
  }
}
