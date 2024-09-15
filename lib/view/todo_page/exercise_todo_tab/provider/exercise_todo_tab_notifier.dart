import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/enum/category.dart';
import 'package:serene_track/model/src/todo.dart';
part 'exercise_todo_tab_notifier.freezed.dart';

@freezed
class ExerciseTodoTabState with _$ExerciseTodoTabState {
  factory ExerciseTodoTabState({
    @Default(Todo()) Todo exerciseTodo,
    @Default([]) List<Todo> exerciseTodos,
    @Default([]) List<bool> isSelectedList,
    @Default([]) List<bool> completeList,
  }) = _ExerciseTodoTabState;
  ExerciseTodoTabState._();
}

final exerciseTodoTabProvider =
    StateNotifierProvider<ExerciseTodoTabStateController, ExerciseTodoTabState>(
        (ref) {
  final exerciseTodos = ref
      .watch(todoProvider.select((value) => value.todos))
      .where((value) => value.categoryId == Category.exercise)
      .toList();
  return ExerciseTodoTabStateController(exerciseTodos: exerciseTodos);
});

class ExerciseTodoTabStateController
    extends StateNotifier<ExerciseTodoTabState> {
  ExerciseTodoTabStateController({
    required exerciseTodos,
  })  : _exerciseTodos = exerciseTodos,
        super(ExerciseTodoTabState()) {
    _init();
  }

  final List<Todo> _exerciseTodos;

  Future<void> _init() async {
    state = state.copyWith(exerciseTodos: _exerciseTodos);
    getSelectedItemList(_exerciseTodos.length);
    getCheckedList(_exerciseTodos);
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
