import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:serene_track/components/delete_confirmation_dialog.dart';
import 'package:serene_track/components/show_snack_bar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/components/custom_checkbox_tile.dart';
import 'package:serene_track/view/todo_page/work_todo_tab/provider/work_todo_tab_notifier.dart';

class WorkTodoTab extends ConsumerWidget {
  const WorkTodoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final workTodoList =
    //     ref.watch(workTodoTabProvider.select((value) => value.workTodoList));
    final workTodos = ref
        .watch(todoProvider.select((value) => value.todos))
        .where((value) => value.categoryId == workTx)
        .toList();
    final selectedItemList =
        ref.watch(workTodoTabProvider.select((value) => value.isSelectedList));
    final checkedList =
        ref.watch(workTodoTabProvider.select((value) => value.checkedList));
    final isLoading =
        ref.watch(todoProvider.select((value) => value.isLoading));

    if (workTodos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.work,
              size: 60,
              color: appleColor2,
            ),
            const SizedBox(height: 16),
            Text(
              'タスクを追加しましょう',
              style: TextStyles.taskTitleStyle.copyWith(
                color: appleColor2,
              ),
            ),
            const SizedBox(height: 260),
          ],
        ),
      );
    }

    return isLoading
        ? const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(
                color: lightSkyBlueColor,
                strokeWidth: 3,
              ),
            ),
          )
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: workTodos.length,
            itemBuilder: (context, index) {
              Todo todo = workTodos[index];

              return Slidable(
                key: ValueKey(index),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) async {
                        ref.read(todoProvider.notifier).setSelectedTodo(todo);
                        String res =
                            await deleteTodo(context: context, ref: ref);
                        if (res == successDelete) {
                          if (!context.mounted) return;
                          showSnackBar(res, context);
                        }
                        if (!context.mounted) return;
                        showSnackBar(
                          res,
                          context,
                          backgroundColor: noReactionColor,
                        );
                      },
                      backgroundColor: deleteColor,
                      foregroundColor: backGroundColor,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: CustomCheckboxTile(
                  todos: workTodos,
                  index: index,
                  value: checkedList[index],
                  fillColor: sandwispColor,
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
                ),
              );
            },
          );
  }

  Future<String> deleteTodo({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    String res = failureDelete;
    final response = await showDeleteConfirmationDialog(context);
    if (response == null || response == false) {
      return res;
    }
    res = await ref.read(todoProvider.notifier).deleteTodo();
    if (res == successRes) res = successDelete;
    return res;
  }
}
