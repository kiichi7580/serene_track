import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/components/dialog/custom_dialog.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/constants.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showCancellationOfIntegrationHealthCareAppDialog(
    BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: _buildCancellationOfIntegrationHealthCareAppDialog,
  );
}

Widget _buildCancellationOfIntegrationHealthCareAppDialog(
    BuildContext context) {
  return Consumer(
    builder: (context, ref, child) {
      return CustomDialog(
        title: '連携解除の注意',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 40),
        content: const Text(
          '　ヘルスケアアプリとの連携を解除するには、Appleのヘルスケアアプリで、設定を変更してください。ヘルスケアアプリを開き、下の「共有」アイコンを選択後、アプリおよびサービスを選択し、当アプリを探してアクセスを解除してください。',
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.start,
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              foregroundColor: textMainColor,
              backgroundColor: backGroundColor,
            ),
            child: const Text('キャンセル'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              foregroundColor: linkBlue,
              backgroundColor: backGroundColor,
            ),
            child: const Text('ヘルスケアアプリを開く'),
            onPressed: () async {
              Navigator.of(context).pop();
              if (Platform.isIOS) {
                final url = Uri.parse(kHealthCareAppUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              }
            },
          ),
        ],
      );
    },
  );
}
