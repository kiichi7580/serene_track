import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/src/todo.dart';

part 'all_todo_tab_notifier.freezed.dart';

@freezed
class AllTodoTabState with _$AllTodoTabState {
  factory AllTodoTabState({
    @Default(Todo()) Todo allTodo,
    @Default([]) List<Todo> allTodos,
    @Default([]) List<bool> isSelectedList,
    @Default([]) List<bool> checkedList,
  }) = _AllTodoTabState;
  AllTodoTabState._();
}

final allTodoTabProvider = StateNotifierProvider.autoDispose<
    AllTodoTabStateController, AllTodoTabState>(
  (ref) {
    final allTodos = ref.watch(todoProvider.select((value) => value.todos));

    return AllTodoTabStateController(allTodos: allTodos);
  },
  dependencies: [todoProvider],
);

class AllTodoTabStateController extends StateNotifier<AllTodoTabState> {
  AllTodoTabStateController({
    required allTodos,
  })  : _allTodos = allTodos,
        super(AllTodoTabState()) {
    _init();
  }

  final List<Todo> _allTodos;

  void _init() {
    state = state.copyWith(allTodos: _allTodos);
    getSelectedItemList(_allTodos.length);
    getCheckedList(_allTodos);
  }

  void getSelectedItemList(int length) {
    state = state.copyWith(isSelectedList: List<bool>.filled(length, false));
  }

  void getCheckedList(List<Todo> todos) {
    List<bool> completeList = todos.map((todo) => todo.complete).toList();
    state = state.copyWith(checkedList: completeList);
  }

  void changeSelectedItemList(int index) {
    List<bool> updatedList = List.from(state.isSelectedList);
    if (index < updatedList.length) {
      updatedList[index] = !updatedList[index];
      state = state.copyWith(isSelectedList: updatedList);
    }
  }
}
