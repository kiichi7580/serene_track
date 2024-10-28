import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/components/dialog/custom_dialog.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/controllers/global/image_notifier.dart';
import 'package:serene_track/gen/assets.gen.dart';

Future<bool?> showImageChangeConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: _buildImageChangeConfirmationDialog,
  );
}

Widget _buildImageChangeConfirmationDialog(BuildContext context) {
  return Consumer(
    builder: (context, ref, child) {
      final imageUrl =
          ref.watch(imageProvider.select((value) => value.imageUrl));
      return CustomDialog(
        title: '選択した画像に変更しますか？',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        content: imageUrl == ''
            ? Image.asset(
                Assets.images.icons.sereneTrackIconBlack.path,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(imageUrl),
                fit: BoxFit.cover,
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
              '変更する',
            ),
          ),
        ],
      );
    },
  );
}
