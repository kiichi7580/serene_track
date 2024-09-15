import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/view/todo_edit_page/todo_edit_page.dart';
import 'package:serene_track/view/todo_notification_page/todo_notification_page.dart';

class CustomCheckboxTile extends ConsumerWidget {
  const CustomCheckboxTile({
    super.key,
    required this.todos,
    required this.index,
    required this.value,
    this.fillColor = backGroundColor,
    required this.selectedItemList,
    this.onTap,
    this.onChanged,
  });
  final List<Todo> todos;
  final int index;
  final bool value;
  final Color? fillColor;
  final List<bool> selectedItemList;
  final void Function()? onTap;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editMode = ref.watch(todoProvider.select((value) => value.editMode));

    // リストの範囲外の場合は空のコンテナを返す
    if (index >= todos.length || index >= selectedItemList.length) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: backGroundColor, borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        key: ValueKey(index),
        onTap: onTap,
        leading: editMode
            ? IconButton(
                onPressed: () {
                  ref.read(todoProvider.notifier).setSelectedTodo(todos[index]);
                  ref.read(todoProvider.notifier).setSelectedTodoIndex(index);
                  context.push(TodoEditPage.routeLocation);
                },
                icon: const Icon(LineIcons.pen, color: selectedColor),
              )
            : Checkbox(
                fillColor:
                    WidgetStateProperty.resolveWith((states) => fillColor),
                checkColor: textMainColor,
                activeColor: textMainColor,
                value: value,
                onChanged: onChanged,
              ),
        title: Text(todos[index].title),
        titleTextStyle: selectedItemList[index] == false
            ? TextStyles.taskTitleBoldStyle
            : TextStyles.taskTitleStyle,
        subtitle: selectedItemList[index] == false
            ? null
            : Text(todos[index].description),
        trailing: todos[index].notificationTime != null
            ? IconButton(
                onPressed: () {
                  context.push(TodoNotificationPage.routeLocation);
                },
                icon: const Icon(LineIcons.bell),
              )
            : IconButton(
                onPressed: () {
                  ref.read(todoProvider.notifier).setSelectedTodo(todos[index]);
                  ref.read(todoProvider.notifier).setSelectedTodoIndex(index);
                  context.push(TodoEditPage.routeLocation);
                },
                icon: const Icon(LineIcons.bellSlash),
              ),
      ),
    );
  }
}
