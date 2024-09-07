import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_add_page_notifier.freezed.dart';

@freezed
class TodoAddPageState with _$TodoAddPageState {
  const factory TodoAddPageState({
    @Default(null) DateTime? notificationTime,
  }) = _TodoAddPageState;
}

final todoAddPageProvider =
    StateNotifierProvider.autoDispose<TodoAddPageController, TodoAddPageState>(
        (ref) {
  return TodoAddPageController();
});

class TodoAddPageController extends StateNotifier<TodoAddPageState> {
  TodoAddPageController() : super(const TodoAddPageState()) {
    init();
  }

  Future<void> init() async {}

  void selectNotificationTime(DateTime selectedTime) {
    state = state.copyWith(notificationTime: selectedTime);
  }
}
