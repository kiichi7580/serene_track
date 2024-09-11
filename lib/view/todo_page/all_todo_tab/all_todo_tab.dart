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
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/all_todo_tab/provider/all_todo_tab_notifier.dart';
import 'package:serene_track/view/todo_page/components/custom_checkbox_tile.dart';

class AllTodoTab extends ConsumerWidget {
  const AllTodoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItemList =
        ref.watch(allTodoTabProvider.select((value) => value.isSelectedList));
    final checkedList =
        ref.watch(allTodoTabProvider.select((value) => value.checkedList));
    final todos = ref.watch(todoProvider.select((value) => value.todos));
    final isLoading =
        ref.watch(todoProvider.select((value) => value.isLoading));

    if (todos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              LineIcons.alternateListAlt,
              size: 60,
              color: sandwispColor2,
            ),
            const SizedBox(height: 16),
            Text(
              'タスクを追加しましょう',
              style: TextStyles.taskTitleStyle.copyWith(
                color: sandwispColor2,
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
            itemCount: todos.length,
            itemBuilder: (context, index) {
              // Todo allTodo = allTodoList[index];
              Todo todo = todos[index];

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
                  // todo: todo,
                  todos: todos,
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
