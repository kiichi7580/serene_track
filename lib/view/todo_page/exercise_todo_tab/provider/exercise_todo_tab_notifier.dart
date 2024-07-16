import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/exercise_todo_tab/widgets/default_exercise_tasks.dart';
part 'exercise_todo_tab_notifier.freezed.dart';

@freezed
class ExerciseTodoTabState with _$ExerciseTodoTabState {
  factory ExerciseTodoTabState({
    @Default(Todo()) Todo exerciseTodo,
    @Default([]) List<Todo> exerciseTodoList,
    @Default([]) List<bool> isSelectedList,
    @Default([]) List<bool> checkedList,
  }) = _ExerciseTodoTabState;
  ExerciseTodoTabState._();
}

final exerciseTodoTabProvider =
    StateNotifierProvider<ExerciseTodoTabStateController, ExerciseTodoTabState>(
        (ref) => ExerciseTodoTabStateController());

class ExerciseTodoTabStateController
    extends StateNotifier<ExerciseTodoTabState> {
  ExerciseTodoTabStateController() : super(ExerciseTodoTabState()) {
    _init();
  }

  Future<void> _init() async {
    state = state.copyWith(exerciseTodoList: [...defaultExerciseTasks]);
    getSelectedItemList(state.exerciseTodoList.length);
    getCheckedList(state.exerciseTodoList.length);
  }

  void getSelectedItemList(int length) {
    state = state.copyWith(isSelectedList: List<bool>.filled(length, false));
  }

  void getCheckedList(int length) {
    state = state.copyWith(checkedList: List<bool>.filled(length, false));
  }

  void changeSelectedItemList(int index) {
    List<bool> updatedList = List.from(state.isSelectedList);
    if (index < updatedList.length) {
      updatedList[index] = !updatedList[index];
      state = state.copyWith(isSelectedList: updatedList);
    }
  }

  void changeCheckedList(int index, bool changeValue) {
    List<bool> checkedList = [
      for (int i = 0; i < state.checkedList.length; i++)
        i == index ? changeValue : state.checkedList[i],
    ];
    state = state.copyWith(checkedList: checkedList);

    updateExerciseTodoList(
      index: index,
      todo: state.exerciseTodoList[index],
      changeValue: state.checkedList[index],
    );
  }

  void updateExerciseTodoList({
    required int index,
    required Todo todo,
    required bool changeValue,
  }) {
    List<Todo> updatedList = List.from(state.exerciseTodoList);
    if (index < updatedList.length) {
      state = state.copyWith(
        exerciseTodo: Todo(
          id: todo.id,
          title: todo.title,
          description: todo.description,
          categoryId: todo.categoryId,
          ownerId: todo.ownerId,
          completed: changeValue,
          notificationTime: todo.notificationTime,
          createdAt: todo.createdAt,
        ),
      );
      updatedList[index] = state.exerciseTodo;
      state = state.copyWith(exerciseTodoList: updatedList);
    }
  }
}
