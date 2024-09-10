import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/components/dialog/custom_dialog.dart';
import 'package:serene_track/constant/colors.dart';

Future<bool?> showOffTodoNotificationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: _buildOffTodoNotificationDialog,
  );
}

Widget _buildOffTodoNotificationDialog(BuildContext context) {
  return Consumer(
    builder: (context, ref, child) {
      return CustomDialog(
        title: 'タスク通知設定を削除しますか？',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'もう一度タスクの通知設定をしたい場合は、タスク編集画面で設定できます。',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              foregroundColor: unselectedColor,
              backgroundColor: backGroundColor,
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text(
              'キャンセル',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              foregroundColor: navyBlueColor,
              backgroundColor: backGroundColor,
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text(
              '削除',
            ),
          ),
        ],
      );
    },
  );
}
