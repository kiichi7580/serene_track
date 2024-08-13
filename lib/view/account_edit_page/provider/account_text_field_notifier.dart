import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_text_field_notifier.g.dart';

@riverpod
class NameControllerNotifier extends _$NameControllerNotifier {
  @override
  TextEditingController build(String text) {
    return TextEditingController(text: text);
  }
}

@riverpod
class ShortTermGorlControllerNotifier extends _$ShortTermGorlControllerNotifier {
  @override
  TextEditingController build(String text) {
    return TextEditingController(text: text);
  }
}

@riverpod
class LongTermGorlControllerNotifier extends _$LongTermGorlControllerNotifier {
  @override
  TextEditingController build(String text) {
    return TextEditingController(text: text);
  }
}
