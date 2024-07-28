import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/components/show_snack_bar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/user_controller.dart';
import 'package:serene_track/view/account_page/steps_tab/provider/steps_tab_notifier.dart';
import 'package:serene_track/view/health_care_page/components/cancellation_of_integration_with_health_care_app_dialog.dart';
import 'package:serene_track/view/health_care_page/components/show_allow_access_to_health_care_app_dialog.dart';

class HealthCareAppIntegrationPage extends ConsumerStatefulWidget {
  const HealthCareAppIntegrationPage({super.key});
  static String get routeName => 'health_care_app_integration';
  static String get routeLocation => '/$routeName';

  @override
  // ignore: library_private_types_in_public_api
  _HealthCareAppIntegrationPageState createState() =>
      _HealthCareAppIntegrationPageState();
}

class _HealthCareAppIntegrationPageState
    extends ConsumerState<HealthCareAppIntegrationPage>
    with WidgetsBindingObserver {
  Health health = Health();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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

  Future<void> fetchData() async {
    try {
      DateTime startOfDay = DateTime.now().subtract(const Duration(days: 6));
      DateTime endOfDay = DateTime.now();

      List<HealthDataPoint> healthDataPoints =
          await health.getHealthDataFromTypes(
        startTime: startOfDay,
        endTime: endOfDay,
        types: [HealthDataType.STEPS],
      );

      if (healthDataPoints.isEmpty) {
        return;
      }

      healthDataPoints = health.removeDuplicates(healthDataPoints);

      Map<DateTime, int> dailySteps = {};

      for (var dataPoint in healthDataPoints) {
        dynamic year = dataPoint.dateFrom.year;
        int month = dataPoint.dateFrom.month;
        int day = dataPoint.dateFrom.day;
        DateTime date = DateTime(year, month, day);

        num value = 0;
        if (dataPoint.value is NumericHealthValue) {
          value = (dataPoint.value as NumericHealthValue).numericValue;
        }

        if (!dailySteps.containsKey(date)) {
          dailySteps[date] = 0;
        }
        dailySteps[date] = dailySteps[date]! + value.toInt();
      }

      List<int> steps = [];
      for (int i = 0; i < 7; i++) {
        DateTime day =
            DateTime(startOfDay.year, startOfDay.month, startOfDay.day)
                .add(Duration(days: i));
        steps.add(dailySteps[day] ?? 0);
      }
      ref.read(stepsTabProvider.notifier).getSteps(steps);
    } catch (e) {
      print('Error: $e');
    }
  }

  void checkHealthDataAccess() async {
    try {
      await fetchData();
    } catch (e) {
      ref.read(userProvider.notifier).updateHealthDataIntegrationStatus(false);
    }
  }

  Future<void> requestPermissions({
    required BuildContext context,
    required bool isRequested,
  }) async {
    if (isRequested) {
      try {
        List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          startTime: DateTime.now().subtract(const Duration(days: 1)),
          endTime: DateTime.now(),
          types: [HealthDataType.STEPS],
        );

        bool hasDataAccess = healthData.isNotEmpty;
        ref
            .read(userProvider.notifier)
            .updateHealthDataIntegrationStatus(hasDataAccess);

        if (!hasDataAccess && Platform.isIOS) {
          showAllowAccessToHealthCareAppDialog(context);
        }
      } catch (e) {
        showSnackBar(e.toString(), context);
      }
    } else {
      if (Platform.isIOS) {
        showCancellationOfIntegrationHealthCareAppDialog(context);
      } else {
        try {
          await health.revokePermissions();
          ref
              .read(userProvider.notifier)
              .updateHealthDataIntegrationStatus(false);
        } catch (e) {
          showSnackBar(e.toString(), context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final healthDataIntegrationStatus =
        ref.watch(userProvider).user.healthDataIntegrationStatus;
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
              trailing: CupertinoSwitch(
                value: healthDataIntegrationStatus,
                onChanged: (value) async {
                  if (value) {
                    await requestPermissions(
                      context: context,
                      isRequested: true,
                    );
                  } else {
                    await requestPermissions(
                      context: context,
                      isRequested: false,
                    );
                  }
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
