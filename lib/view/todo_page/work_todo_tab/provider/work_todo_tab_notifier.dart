import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/work_todo_tab/widgets/default_work_tasks.dart';

part 'work_todo_tab_notifier.freezed.dart';

@freezed
class WorkTodoTabState with _$WorkTodoTabState {
  factory WorkTodoTabState({
    @Default(Todo()) Todo workTodo,
    @Default([]) List<Todo> workTodoList,
    @Default([]) List<bool> isSelectedList,
    @Default([]) List<bool> checkedList,
  }) = _WorkTodoTabState;
  WorkTodoTabState._();
}

final workTodoTabProvider =
    StateNotifierProvider<WorkTodoTabStateController, WorkTodoTabState>(
        (ref) => WorkTodoTabStateController());

class WorkTodoTabStateController extends StateNotifier<WorkTodoTabState> {
  WorkTodoTabStateController() : super(WorkTodoTabState()) {
    _init();
  }

  Future<void> _init() async {
    state = state.copyWith(workTodoList: [...defaultWorkTasks]);
    getSelectedItemList(state.workTodoList.length);
    getCheckedList(state.workTodoList.length);
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
      todo: state.workTodoList[index],
      changeValue: state.checkedList[index],
    );
  }

  void updateExerciseTodoList({
    required int index,
    required Todo todo,
    required bool changeValue,
  }) {
    List<Todo> updatedList = List.from(state.workTodoList);
    if (index < updatedList.length) {
      state = state.copyWith(
        workTodo: Todo(
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
      updatedList[index] = state.workTodo;
      state = state.copyWith(workTodoList: updatedList);
    }
  }
}
