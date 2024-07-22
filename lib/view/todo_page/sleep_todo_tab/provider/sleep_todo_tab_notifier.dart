import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/sleep_todo_tab/components/default_sleep_tasks.dart';

part 'sleep_todo_tab_notifier.freezed.dart';

@freezed
class SleepTodoTabState with _$SleepTodoTabState {
  factory SleepTodoTabState({
    @Default(Todo()) Todo sleepTodo,
    @Default([]) List<Todo> sleepTodoList,
    @Default([]) List<bool> isSelectedList,
    @Default([]) List<bool> checkedList,
  }) = _SleepTodoTabState;
  SleepTodoTabState._();
}

final sleepTodoTabProvider =
    StateNotifierProvider<SleepTodoTabStateController, SleepTodoTabState>(
        (ref) => SleepTodoTabStateController());

class SleepTodoTabStateController extends StateNotifier<SleepTodoTabState> {
  SleepTodoTabStateController() : super(SleepTodoTabState()) {
    _init();
  }

  Future<void> _init() async {
    state = state.copyWith(sleepTodoList: [...defaultSleepTasks]);
    getSelectedItemList(state.sleepTodoList.length);
    getCheckedList(state.sleepTodoList.length);
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
      todo: state.sleepTodoList[index],
      changeValue: state.checkedList[index],
    );
  }

  void updateExerciseTodoList({
    required int index,
    required Todo todo,
    required bool changeValue,
  }) {
    List<Todo> updatedList = List.from(state.sleepTodoList);
    if (index < updatedList.length) {
      state = state.copyWith(
        sleepTodo: Todo(
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
      updatedList[index] = state.sleepTodo;
      state = state.copyWith(sleepTodoList: updatedList);
    }
  }
}
