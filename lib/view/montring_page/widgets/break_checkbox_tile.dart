import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';

class BreakCheckboxTile extends StatelessWidget {
  const BreakCheckboxTile({
    super.key,
    required this.title,
    this.description,
    required this.index,
    required this.value,
    this.fillColor = backGroundColor,
    this.onChanged,
  });
  final String title;
  final String? description;
  final int index;
  final bool value;
  final Color? fillColor;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: backGroundColor, borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Checkbox(
          fillColor: WidgetStateProperty.resolveWith((states) => fillColor),
          checkColor: textMainColor,
          activeColor: textMainColor,
          value: value,
          onChanged: onChanged,
        ),
        title: Text(title),
        titleTextStyle: TextStyles.taskTitleBoldStyle,
      ),
    );
  }
}
