import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

drumRollTimePicker({
  required BuildContext context,
  required dynamic onConfirm,
  bool showSecondsColumn = true,
}) {
  DatePicker.showTimePicker(
    context,
    showTitleActions: true,
    showSecondsColumn: showSecondsColumn,
    onConfirm: (date) {
      onConfirm(date);
    },
    currentTime: DateTime.now(),
    locale: LocaleType.jp,
  );
}
