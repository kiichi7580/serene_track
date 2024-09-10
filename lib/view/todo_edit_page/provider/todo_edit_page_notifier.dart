import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/src/todo.dart';

part 'todo_edit_page_notifier.freezed.dart';

@freezed
class TodoEditPageState with _$TodoEditPageState {
  const factory TodoEditPageState({
    @Default(null) DateTime? notificationTime,
  }) = _TodoEditPageState;
}

final todoEditPageProvider = StateNotifierProvider.autoDispose<
    TodoEditPageController, TodoEditPageState>((ref) {
  final selectedTodo =
      ref.watch(todoProvider.select((value) => value.selectedTodo));
  return TodoEditPageController(selectedTodo: selectedTodo);
});

class TodoEditPageController extends StateNotifier<TodoEditPageState> {
  TodoEditPageController({
    required this.selectedTodo,
  }) : super(const TodoEditPageState()) {
    init();
  }

  final Todo selectedTodo;

  Future<void> init() async {
    selectNotificationTime(selectedTodo.notificationTime);
  }

  void selectNotificationTime(DateTime? selectedTime) {
    state = state.copyWith(notificationTime: selectedTime);
  }
}
