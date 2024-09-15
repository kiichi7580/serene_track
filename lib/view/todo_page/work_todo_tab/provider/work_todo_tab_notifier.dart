import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/enum/category.dart';
import 'package:serene_track/model/src/todo.dart';

part 'work_todo_tab_notifier.freezed.dart';

@freezed
class WorkTodoTabState with _$WorkTodoTabState {
  factory WorkTodoTabState({
    @Default(Todo()) Todo workTodo,
    @Default([]) List<Todo> workTodos,
    @Default([]) List<bool> isSelectedList,
    @Default([]) List<bool> completeList,
  }) = _WorkTodoTabState;
  WorkTodoTabState._();
}

final workTodoTabProvider =
    StateNotifierProvider<WorkTodoTabStateController, WorkTodoTabState>((ref) {
  final workTodos = ref
      .watch(todoProvider.select((value) => value.todos))
      .where((value) => value.categoryId == Category.work)
      .toList();
  return WorkTodoTabStateController(workTodos: workTodos);
});

class WorkTodoTabStateController extends StateNotifier<WorkTodoTabState> {
  WorkTodoTabStateController({
    required workTodos,
  })  : _workTodos = workTodos,
        super(WorkTodoTabState()) {
    _init();
  }

  final List<Todo> _workTodos;

  Future<void> _init() async {
    state = state.copyWith(workTodos: _workTodos);
    getSelectedItemList(_workTodos.length);
    getCheckedList(_workTodos);
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
