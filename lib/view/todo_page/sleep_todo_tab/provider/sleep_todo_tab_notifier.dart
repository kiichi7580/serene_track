import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/enum/category.dart';
import 'package:serene_track/model/src/todo.dart';

part 'sleep_todo_tab_notifier.freezed.dart';

@freezed
class SleepTodoTabState with _$SleepTodoTabState {
  factory SleepTodoTabState({
    @Default(Todo()) Todo sleepTodo,
    @Default([]) List<Todo> sleepTodos,
    @Default([]) List<bool> isSelectedList,
    @Default([]) List<bool> completeList,
  }) = _SleepTodoTabState;
  SleepTodoTabState._();
}

final sleepTodoTabProvider =
    StateNotifierProvider<SleepTodoTabStateController, SleepTodoTabState>(
        (ref) {
  final sleepTodos = ref
      .watch(todoProvider.select((value) => value.todos))
      .where((value) => value.categoryId == Category.sleep)
      .toList();
  return SleepTodoTabStateController(sleepTodos: sleepTodos);
});

class SleepTodoTabStateController extends StateNotifier<SleepTodoTabState> {
  SleepTodoTabStateController({
    required sleepTodos,
  })  : _sleepTodos = sleepTodos,
        super(SleepTodoTabState()) {
    _init();
  }

  final List<Todo> _sleepTodos;

  Future<void> _init() async {
    state = state.copyWith(sleepTodos: _sleepTodos);
    getSelectedItemList(_sleepTodos.length);
    getCheckedList(_sleepTodos);
  }

  void getSelectedItemList(int length) {
    state = state.copyWith(isSelectedList: List<bool>.filled(length, false));
  }

  void getCheckedList(List<Todo> todos) {
    List<bool> completeList = todos.map((todo) => todo.complete).toList();
    state = state.copyWith(completeList: completeList);
  }

  void changeSelectedItemList(int index) {
    List<bool> updatedList = List.from(state.isSelectedList);
    if (index < updatedList.length) {
      updatedList[index] = !updatedList[index];
      state = state.copyWith(isSelectedList: updatedList);
    }
  }
}
