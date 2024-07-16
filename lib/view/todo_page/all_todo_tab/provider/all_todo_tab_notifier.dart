import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/exercise_todo_tab/provider/exercise_todo_tab_notifier.dart';
import 'package:serene_track/view/todo_page/sleep_todo_tab/provider/sleep_todo_tab_notifier.dart';
import 'package:serene_track/view/todo_page/work_todo_tab/provider/work_todo_tab_notifier.dart';

part 'all_todo_tab_notifier.freezed.dart';

@freezed
class AllTodoTabState with _$AllTodoTabState {
  factory AllTodoTabState({
    @Default(Todo()) Todo allTodo,
    @Default([]) List<Todo> allTodoList,
    @Default([]) List<bool> isSelectedList,
    @Default([]) List<bool> checkedList,
  }) = _AllTodoTabState;
  AllTodoTabState._();
}

final allTodoTabProvider =
    // StateNotifierProvider<AllTodoTabStateController, AllTodoTabState>(
    // (ref) => AllTodoTabStateController());
    StateNotifierProvider.autoDispose<AllTodoTabStateController,
        AllTodoTabState>(
  (ref) {
    final exerciseTodoList = ref.read(exerciseTodoTabProvider).exerciseTodoList;
    final sleepTodoList = ref.read(sleepTodoTabProvider).sleepTodoList;
    final workTodoList = ref.read(workTodoTabProvider).workTodoList;

    return AllTodoTabStateController(
      exerciseTodoList: exerciseTodoList,
      sleepTodoList: sleepTodoList,
      workTodoList: workTodoList,
    );
  },
  dependencies: [
    exerciseTodoTabProvider,
    sleepTodoTabProvider,
    workTodoTabProvider,
  ],
);

class AllTodoTabStateController extends StateNotifier<AllTodoTabState> {
  AllTodoTabStateController({
    required exerciseTodoList,
    required sleepTodoList,
    required workTodoList,
  })  : _exerciseTodoList = exerciseTodoList,
        _sleepTodoList = sleepTodoList,
        _workTodoList = workTodoList,
        super(AllTodoTabState()) {
    _init();
  }

  final List<Todo> _exerciseTodoList;
  final List<Todo> _sleepTodoList;
  final List<Todo> _workTodoList;

  void _init() {
    getDefaultAllTodoList();
    getSelectedItemList(state.allTodoList.length);
    getCheckedList(state.allTodoList.length);
  }

  void getDefaultAllTodoList() {
    List<Todo> allTodoList = [];
    allTodoList.addAll(_exerciseTodoList);
    allTodoList.addAll(_sleepTodoList);
    allTodoList.addAll(_workTodoList);
    state = state.copyWith(allTodoList: allTodoList);
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
      todo: state.allTodoList[index],
      changeValue: state.checkedList[index],
    );
  }

  void updateExerciseTodoList({
    required int index,
    required Todo todo,
    required bool changeValue,
  }) {
    List<Todo> updatedList = List.from(state.allTodoList);
    if (index < updatedList.length) {
      state = state.copyWith(
        allTodo: Todo(
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
      updatedList[index] = state.allTodo;
      state = state.copyWith(allTodoList: updatedList);
    }
  }
}
