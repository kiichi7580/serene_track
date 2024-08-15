import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serene_track/constant/text_source.dart';

part 'todo_add_text_field_notifier.g.dart';

@riverpod
class TitleControllerNotifier extends _$TitleControllerNotifier {
  @override
  TextEditingController build() {
    return TextEditingController();
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
  TextEditingController build() {
    return TextEditingController();
  }
}
