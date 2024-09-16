import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:line_icons/line_icons.dart';
import 'package:serene_track/components/dialog/show_delete_confirmation_dialog.dart';
import 'package:serene_track/components/show_snack_bar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/enum/category.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/components/custom_checkbox_tile.dart';
import 'package:serene_track/view/todo_page/work_todo_tab/provider/work_todo_tab_notifier.dart';

class WorkTodoTab extends ConsumerWidget {
  const WorkTodoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workTodos =
        ref.watch(workTodoTabProvider.select((value) => value.workTodos));
    final selectedItemList =
        ref.watch(workTodoTabProvider.select((value) => value.isSelectedList));
    final completeList =
        ref.watch(workTodoTabProvider.select((value) => value.completeList));
    final isLoading =
        ref.watch(todoProvider.select((value) => value.isLoading));

    if (workTodos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LineIcons.briefcase,
                size: 60, color: categoryColor2(Category.work)),
            const SizedBox(height: 16),
            Text(
              'タスクを追加しましょう',
              style: TextStyles.taskTitleStyle.copyWith(
                color: categoryColor2(Category.work),
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
                      icon: LineIcons.alternateTrash,
                    ),
                  ],
                ),
                child: CustomCheckboxTile(
                  todos: workTodos,
                  index: index,
                  value: completeList[index],
                  fillColor: categoryColor(Category.work),
                  onTap: () {
                    ref
                        .read(workTodoTabProvider.notifier)
                        .changeSelectedItemList(index);
                  },
                  onChanged: (value) async {
                    if (value == null) {
                      return;
                    }
                    ref
                        .read(todoProvider.notifier)
                        .setSelectedTodo(workTodos[index]);
                    await changeCompleteStatus(
                      context: context,
                      ref: ref,
                      value: value,
                    );
                  },
                  selectedItemList: selectedItemList,
                ),
              );
            },
          );
  }

  Future<String> changeCompleteStatus({
    required BuildContext context,
    required WidgetRef ref,
    required bool value,
  }) async {
    String res = await ref
        .read(todoProvider.notifier)
        .changeCompleteStatus(complete: value);
    if (res == successRes) return completeTask;
    return res;
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
