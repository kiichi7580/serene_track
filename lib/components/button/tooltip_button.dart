import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

Widget tooltipButton(String? message) {
  return Tooltip(
    message: message,
    height: 80,
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.all(10),
    verticalOffset: 20,
    preferBelow: true,
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: const BorderRadius.all(
        Radius.circular(100),
      ),
    ),
    waitDuration: const Duration(seconds: 5),
    showDuration: const Duration(milliseconds: 1500),
    triggerMode: TooltipTriggerMode.tap,
    enableFeedback: true,
    child: const Icon(
      LineIcons.questionCircle,
      color: Colors.grey,
      size: 30,
    ),
  );
}
