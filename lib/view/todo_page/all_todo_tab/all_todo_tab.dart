import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/all_todo_tab/provider/all_todo_tab_notifier.dart';
import 'package:serene_track/view/todo_page/components/custom_checkbox_tile.dart';

class AllTodoTab extends ConsumerWidget {
  const AllTodoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTodoList = ref.watch(allTodoTabProvider).allTodoList;
    final selectedItemList = ref.watch(allTodoTabProvider).isSelectedList;
    final checkedList = ref.watch(allTodoTabProvider).checkedList;

    return Scaffold(
      backgroundColor: sandwispColor,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: allTodoList.length,
        itemBuilder: (context, index) {
          Todo allTodo = allTodoList[index];

          return CustomCheckboxTile(
            todo: allTodo,
            index: index,
            value: checkedList[index],
            fillColor: sandwispColor,
            onTap: () {
              ref
                  .read(allTodoTabProvider.notifier)
                  .changeSelectedItemList(index);
            },
            onChanged: (value) {
              ref
                  .watch(allTodoTabProvider.notifier)
                  .changeCheckedList(index, value!);
            },
            selectedItemList: selectedItemList,
          );
        },
      ),
    );
  }
}
