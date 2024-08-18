import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:serene_track/components/delete_confirmation_dialog.dart';
import 'package:serene_track/components/show_snack_bar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_page/exercise_todo_tab/provider/exercise_todo_tab_notifier.dart';
import 'package:serene_track/view/todo_page/components/custom_checkbox_tile.dart';

class ExerciseTodoTab extends ConsumerWidget {
  const ExerciseTodoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final exerciseTodoList = ref.watch(
    //     exerciseTodoTabProvider.select((value) => value.exerciseTodoList));
    final exerciseTodoList = ref
        .watch(todoProvider.select((value) => value.todos))
        .where((value) => value.categoryId == exerciseTx)
        .toList();
    final selectedItemList = ref
        .watch(exerciseTodoTabProvider.select((value) => value.isSelectedList));
    final checkedList =
        ref.watch(exerciseTodoTabProvider.select((value) => value.checkedList));
    final isLoading =
        ref.watch(todoProvider.select((value) => value.isLoading));

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
            itemCount: exerciseTodoList.length,
            itemBuilder: (context, index) {
              Todo todo = exerciseTodoList[index];

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
                  // todo: todo,
                  todos: exerciseTodoList,
                  index: index,
                  value: checkedList[index],
                  fillColor: sandwispColor,
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
