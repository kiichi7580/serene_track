import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/components/custom_checkbox_tile.dart';
import 'package:serene_track/view/todo_page/work_todo_tab/provider/work_todo_tab_notifier.dart';

class WorkTodoTab extends ConsumerWidget {
  const WorkTodoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workTodoList = ref.watch(workTodoTabProvider).workTodoList;
    final selectedItemList = ref.watch(workTodoTabProvider).isSelectedList;
    final checkedList = ref.watch(workTodoTabProvider).checkedList;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: workTodoList.length,
      itemBuilder: (context, index) {
        Todo workTodo = workTodoList[index];

        return CustomCheckboxTile(
          todo: workTodo,
          index: index,
          value: checkedList[index],
          fillColor: appleColor,
          onTap: () {
            ref
                .read(workTodoTabProvider.notifier)
                .changeSelectedItemList(index);
          },
          onChanged: (value) {
            ref
                .watch(workTodoTabProvider.notifier)
                .changeCheckedList(index, value!);
          },
          selectedItemList: selectedItemList,
        );
      },
    );
  }
}
