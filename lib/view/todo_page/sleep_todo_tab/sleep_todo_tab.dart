import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/sleep_todo_tab/provider/sleep_todo_tab_notifier.dart';
import 'package:serene_track/view/todo_page/components/custom_checkbox_tile.dart';

class SleepTodoTab extends ConsumerWidget {
  const SleepTodoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepTodoList = ref.watch(sleepTodoTabProvider).sleepTodoList;
    final selectedItemList = ref.watch(sleepTodoTabProvider).isSelectedList;
    final checkedList = ref.watch(sleepTodoTabProvider).checkedList;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: sleepTodoList.length,
      itemBuilder: (context, index) {
        Todo sleepTodo = sleepTodoList[index];

        return CustomCheckboxTile(
          todo: sleepTodo,
          index: index,
          value: checkedList[index],
          fillColor: sandwispColor,
          onTap: () {
            ref
                .read(sleepTodoTabProvider.notifier)
                .changeSelectedItemList(index);
          },
          onChanged: (value) {
            ref
                .watch(sleepTodoTabProvider.notifier)
                .changeCheckedList(index, value!);
          },
          selectedItemList: selectedItemList,
        );
      },
    );
  }
}
