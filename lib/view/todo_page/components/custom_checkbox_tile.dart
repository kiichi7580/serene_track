import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/model/src/todo.dart';

class CustomCheckboxTile extends StatelessWidget {
  const CustomCheckboxTile({
    super.key,
    required this.todo,
    required this.index,
    required this.value,
    this.fillColor = backGroundColor,
    required this.selectedItemList,
    this.onTap,
    this.onChanged,
  });
  final Todo todo;
  final int index;
  final bool value;
  final Color? fillColor;
  final List<bool> selectedItemList;
  final void Function()? onTap;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: backGroundColor, borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          fillColor:
              WidgetStateProperty.resolveWith((states) => fillColor),
          checkColor: textMainColor,
          activeColor: textMainColor,
          value: value,
          onChanged: onChanged,
        ),
        title: Text(todo.title),
        titleTextStyle: selectedItemList[index] == false
            ? TextStyles.taskTitleBoldStyle
            : TextStyles.taskTitleStyle,
        subtitle:
            selectedItemList[index] == false ? null : Text(todo.description),
        trailing: todo.notificationTime != null
            ? const Icon(Icons.notifications)
            : const Icon(Icons.notifications_none),
      ),
    );
  }
}
