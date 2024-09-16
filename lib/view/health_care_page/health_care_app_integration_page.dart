import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/components/show_snack_bar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/health_care_notifier.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/view/health_care_page/components/cancellation_of_integration_with_health_care_app_dialog.dart';
import 'package:serene_track/view/health_care_page/components/show_allow_access_to_health_care_app_dialog.dart';

class HealthCareAppIntegrationPage extends StatelessWidget {
  const HealthCareAppIntegrationPage({super.key});
  static String get routeName => 'health_care_app_integration';
  static String get routeLocation => '/$routeName';

  Future<void> requestPermissions({
    required BuildContext context,
    required WidgetRef ref,
    required bool isRequested,
  }) async {
    if (isRequested) {
      try {
        bool hasDataAccess = ref.watch(userProvider
            .select((value) => value.user.healthDataIntegrationStatus));

        if (!hasDataAccess && Platform.isIOS) {
          if (!context.mounted) return;
          showAllowAccessToHealthCareAppDialog(context);
        }
      } catch (e) {
        if (!context.mounted) return;
        showSnackBar(e.toString(), context);
      }
    } else {
      if (Platform.isIOS) {
        showCancellationOfIntegrationHealthCareAppDialog(context);
      } else {
        try {
          final health =
              ref.watch(healthCareProvider.select((value) => value.health));
          if (health != null) await health.revokePermissions();
          ref
              .read(userProvider.notifier)
              .updateHealthDataIntegrationStatus(false);
        } catch (e) {
          if (!context.mounted) return;
          showSnackBar(e.toString(), context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: myAppBar(
        title: 'ヘルスケアと連携する',
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 8),
            ListTile(
              title: const Text(
                'ヘルスケアアプリと連携',
                style: TextStyles.caption,
              ),
              trailing: Consumer(
                builder: (context, ref, _) {
                  final healthDataIntegrationStatus = ref.watch(
                      userProvider.select(
                          (value) => value.user.healthDataIntegrationStatus));
                  return CupertinoSwitch(
                    value: healthDataIntegrationStatus,
                    onChanged: (value) async {
                      if (value) {
                        await requestPermissions(
                          context: context,
                          ref: ref,
                          isRequested: true,
                        );
                      } else {
                        await requestPermissions(
                          context: context,
                          ref: ref,
                          isRequested: false,
                        );
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const ListTile(
              subtitle: Text(
                '　ヘルスケアアプリと同期すると、あなたの歩数、運動、睡眠データなどより詳細な情報を提供することができます。\n'
                '　アプリへのアクセスを許可すると、データは自動的に連携されます。',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
