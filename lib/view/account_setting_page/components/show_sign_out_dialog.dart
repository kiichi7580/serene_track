import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/components/dialog/custom_dialog.dart';
import 'package:serene_track/constant/colors.dart';

Future<bool?> showSignOutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: _buildSignOutDialog,
  );
}

Widget _buildSignOutDialog(BuildContext context) {
  return Consumer(
    builder: (context, ref, child) {
      return CustomDialog(
        title: '本当にサインアウトしますか？',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
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
              foregroundColor: noReactionColor,
              backgroundColor: backGroundColor,
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text(
              'サインアウト',
            ),
          ),
        ],
      );
    },
  );
}
