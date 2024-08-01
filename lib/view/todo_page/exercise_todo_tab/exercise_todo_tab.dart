import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/exercise_todo_tab/provider/exercise_todo_tab_notifier.dart';
import 'package:serene_track/view/todo_page/components/custom_checkbox_tile.dart';

class ExerciseTodoTab extends ConsumerWidget {
  const ExerciseTodoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseTodoList = ref.read(exerciseTodoTabProvider).exerciseTodoList;
    final selectedItemList = ref.watch(exerciseTodoTabProvider).isSelectedList;
    final checkedList = ref.watch(exerciseTodoTabProvider).checkedList;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: exerciseTodoList.length,
      itemBuilder: (context, index) {
        Todo exerciseTodo = exerciseTodoList[index];

        return CustomCheckboxTile(
          todo: exerciseTodo,
          index: index,
          value: checkedList[index],
          fillColor: yellowGreenColor,
          onTap: () {
            ref
                .read(exerciseTodoTabProvider.notifier)
                .changeSelectedItemList(index);
          },
          onChanged: (value) {
            ref
                .watch(exerciseTodoTabProvider.notifier)
                .changeCheckedList(index, value!);
          },
          selectedItemList: selectedItemList,
        );
      },
    );
  }
}
