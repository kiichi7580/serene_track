import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/components/show_snack_bar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/health_care_variavle.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/health_care_notifier.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/view/health_care_page/components/cancellation_of_integration_with_health_care_app_dialog.dart';
import 'package:serene_track/view/health_care_page/components/show_allow_access_to_health_care_app_dialog.dart';

class HealthCareAppIntegrationPage extends ConsumerStatefulWidget {
  const HealthCareAppIntegrationPage({super.key});
  static String get routeName => 'health_care_app_integration';
  static String get routeLocation => '/$routeName';

  @override
  ConsumerState<HealthCareAppIntegrationPage> createState() =>
      _HealthCareAppIntegrationPageState();
}

class _HealthCareAppIntegrationPageState
    extends ConsumerState<HealthCareAppIntegrationPage>
    with WidgetsBindingObserver {
  late bool isHealthDataIntegrated;
  Health health = Health();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final userNotifier = ref.read(userProvider);
    isHealthDataIntegrated = userNotifier.user.healthDataIntegrationStatus;
    checkHealthDataAccess();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkHealthDataAccess();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void checkHealthDataAccess() async {
    try {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        types: types,
        startTime: DateTime.now().subtract(const Duration(days: 6)),
        endTime: DateTime.now(),
      );
      bool hasPermissions = healthData.isNotEmpty;
      setState(() {
        isHealthDataIntegrated = hasPermissions;
      });
      final userNotifier = ref.read(userProvider.notifier);
      userNotifier.updateHealthDataIntegrationStatus(hasPermissions);
      if (hasPermissions) {
        await ref.read(healthCareProvider.notifier).fetchData(health);
      }
    } catch (e) {
      setState(() {
        isHealthDataIntegrated = false;
      });
    }
  }

  Future<void> requestPermissions({
    required bool isRequested,
  }) async {
    final userNotifier = ref.read(userProvider.notifier);
    if (isRequested) {
      try {
        // ignore: unused_local_variable
        bool requestResult =
            await health.requestAuthorization(types, permissions: permissions);
        List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          startTime: DateTime.now().subtract(const Duration(days: 1)),
          endTime: DateTime.now(),
          types: types,
        );
        bool hasDataAccess = healthData.isNotEmpty;
        setState(() {
          isHealthDataIntegrated = hasDataAccess;
        });
        userNotifier.updateHealthDataIntegrationStatus(hasDataAccess);

        if (!hasDataAccess && Platform.isIOS) {
          if (!mounted) return;
          showAllowAccessToHealthCareAppDialog(context);
        }
      } catch (e) {
        if (!mounted) return;
        showSnackBar(e.toString(), context);
      }
    } else {
      if (Platform.isIOS) {
        if (!mounted) return;
        showCancellationOfIntegrationHealthCareAppDialog(context);
      } else {
        try {
          await health.revokePermissions();
          setState(() {
            isHealthDataIntegrated = false;
          });
          await userNotifier.updateHealthDataIntegrationStatus(false);
        } catch (e) {
          if (!mounted) return;
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
                  return CupertinoSwitch(
                    value: isHealthDataIntegrated,
                    onChanged: (value) async {
                      if (value) {
                        await requestPermissions(isRequested: true);
                      } else {
                        await requestPermissions(isRequested: false);
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
