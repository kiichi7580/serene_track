import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/enum/category.dart';
import 'package:serene_track/model/src/pie_chart_sector.dart';
import 'package:serene_track/model/src/todo.dart';

part 'task_tab_notifier.freezed.dart';

@freezed
class TaskTabState with _$TaskTabState {
  factory TaskTabState({
    @Default([]) List<List<PieChartSector>> sectors,
    @Default([]) List<PieChartSector> allTodoSectors,
    @Default([]) List<PieChartSector> exerciseTodoSectors,
    @Default([]) List<PieChartSector> sleepTodoSectors,
    @Default([]) List<PieChartSector> workTodoSectors,
    @Default(-1) int touchedSectionIndex,
  }) = _TaskTabState;
  TaskTabState._();
}

final taskTabProvider =
    StateNotifierProvider<TaskTabStateController, TaskTabState>((ref) {
  final todos = ref.watch(todoProvider.select((value) => value.todos));
  return TaskTabStateController(todos: todos);
});

class TaskTabStateController extends StateNotifier<TaskTabState> {
  TaskTabStateController({
    required todos,
  })  : _todos = todos,
        super(TaskTabState()) {
    _init();
  }

  final List<Todo> _todos;

  Future<void> _init() async {
    state = state.copyWith(touchedSectionIndex: -1);
    getSectors();
  }

  void getSectors() {
    final exerciseTodos =
        _todos.where((value) => value.categoryId == Category.exercise).toList();
    final sleepTodos =
        _todos.where((value) => value.categoryId == Category.sleep).toList();
    final workTodos =
        _todos.where((value) => value.categoryId == Category.work).toList();
    final allTodoCompletions =
        _todos.where((value) => value.complete == true).toList();
    final exerciseTodoCompletions =
        exerciseTodos.where((value) => value.complete == true).toList();
    final sleepTodoCompletions =
        sleepTodos.where((value) => value.complete == true).toList();
    final workTodoCompletions =
        workTodos.where((value) => value.complete == true).toList();
    final allTodoCompletionRate = double.parse(
      (allTodoCompletions.length / _todos.length).toStringAsFixed(1),
    );
    final exerciseTodoCompletionRate = double.parse(
      (exerciseTodoCompletions.length / exerciseTodos.length)
          .toStringAsFixed(1),
    );
    final sleepTodoCompletionRate = double.parse(
      (sleepTodoCompletions.length / sleepTodos.length).toStringAsFixed(1),
    );
    final workTodoCompletionRate = double.parse(
      (workTodoCompletions.length / workTodos.length).toStringAsFixed(1),
    );
    final allTodoSectors = [
      PieChartSector(
        color: categoryColor(Category.all),
        value: allTodoCompletionRate * 100,
        title: allTx,
        titleStyle: TextStyles.pieChartTextStyle,
      ),
      PieChartSector(
        color: lightGreyColor,
        value: 100 - (allTodoCompletionRate * 100),
        title: incompleteTx,
        titleStyle: TextStyles.pieChartTextStyle.copyWith(
          color: backGroundColor,
        ),
      ),
    ];
    final exerciseTodoSectors = [
      PieChartSector(
        color: categoryColor(Category.exercise),
        value: exerciseTodoCompletionRate * 100,
        title: exerciseTx,
        titleStyle: TextStyles.pieChartTextStyle,
      ),
      PieChartSector(
        color: lightGreyColor,
        value: 100 - (exerciseTodoCompletionRate * 100),
        title: incompleteTx,
        titleStyle: TextStyles.pieChartTextStyle.copyWith(
          color: backGroundColor,
        ),
      ),
    ];
    final sleepTodoSectors = [
      PieChartSector(
        color: categoryColor(Category.sleep),
        value: sleepTodoCompletionRate * 100,
        title: sleepTx,
        titleStyle: TextStyles.pieChartTextStyle,
      ),
      PieChartSector(
        color: lightGreyColor,
        value: 100 - (sleepTodoCompletionRate * 100),
        title: incompleteTx,
        titleStyle: TextStyles.pieChartTextStyle.copyWith(
          color: backGroundColor,
        ),
      ),
    ];
    final workTodoSectors = [
      PieChartSector(
        color: categoryColor(Category.work),
        value: workTodoCompletionRate * 100,
        title: workTx,
        titleStyle: TextStyles.pieChartTextStyle,
      ),
      PieChartSector(
        color: lightGreyColor,
        value: 100 - (workTodoCompletionRate * 100),
        title: incompleteTx,
        titleStyle: TextStyles.pieChartTextStyle.copyWith(
          color: backGroundColor,
        ),
      ),
    ];
    final sectors = [
      allTodoSectors,
      exerciseTodoSectors,
      sleepTodoSectors,
      workTodoSectors,
    ];
    state = state.copyWith(
      allTodoSectors: allTodoSectors,
      exerciseTodoSectors: exerciseTodoSectors,
      sleepTodoSectors: sleepTodoSectors,
      workTodoSectors: workTodoSectors,
      sectors: sectors,
    );
  }

  void setTouchedSectionIndex(int touchedSectionIndex) {
    state = state.copyWith(touchedSectionIndex: touchedSectionIndex);
  }
}
