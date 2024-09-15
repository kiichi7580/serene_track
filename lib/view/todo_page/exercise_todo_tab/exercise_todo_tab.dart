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
import 'package:serene_track/view/todo_page/exercise_todo_tab/provider/exercise_todo_tab_notifier.dart';
import 'package:serene_track/view/todo_page/components/custom_checkbox_tile.dart';

class ExerciseTodoTab extends ConsumerWidget {
  const ExerciseTodoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseTodos = ref.watch(
        exerciseTodoTabProvider.select((value) => value.exerciseTodos));
    final selectedItemList = ref
        .watch(exerciseTodoTabProvider.select((value) => value.isSelectedList));
    final completeList =
        ref.watch(exerciseTodoTabProvider.select((value) => value.completeList));
    final isLoading =
        ref.watch(todoProvider.select((value) => value.isLoading));

    if (exerciseTodos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              LineIcons.running,
              size: 60,
              color: yellowGreenColor2,
            ),
            const SizedBox(height: 16),
            Text(
              'タスクを追加しましょう',
              style: TextStyles.taskTitleStyle.copyWith(
                color: yellowGreenColor2,
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
            itemCount: exerciseTodos.length,
            itemBuilder: (context, index) {
              Todo todo = exerciseTodos[index];

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
                  todos: exerciseTodos,
                  index: index,
                  value: completeList[index],
                  fillColor: yellowGreenColor,
                  onTap: () {
                    ref
                        .read(exerciseTodoTabProvider.notifier)
                        .changeSelectedItemList(index);
                  },
                  onChanged: (value) async {
                    if (value == null) {
                      return;
                    }
                    ref
                        .read(todoProvider.notifier)
                        .setSelectedTodo(exerciseTodos[index]);
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
