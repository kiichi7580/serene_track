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
import 'package:serene_track/model/src/user.dart';
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
  late bool isHealthDataIntegrated;
  Health health = Health();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final user = ref.read(userProvider).user;
    isHealthDataIntegrated = user.healthdataIntegrationStatus;
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

  Future<void> fetchData(List<HealthDataPoint> healthDataPoints) async {
    // DateTime now = DateTime.now();
    // DateTime startOfDay = DateTime(now.year, now.month, now.day - 1);
    // DateTime endOfDay = DateTime(now.year, now.month, now.day);

    // List<HealthDataPoint> healthDataPoints =
    //     await health.getHealthDataFromTypes(
    //   startTime: startOfDay,
    //   endTime: endOfDay,
    //   types: [HealthDataType.STEPS],
    // );
    // healthDataPoints = health.removeDuplicates(healthDataPoints);

    // 歩数と運動時間の合計を計算
    double totalSteps = 0;
    double totalExerciseMinutes = 0;
    double totalSleepMinutes = 0;

    for (var dataPoint in healthDataPoints) {
      if (dataPoint.type == HealthDataType.STEPS &&
          dataPoint.value is NumericHealthValue) {
        totalSteps += (dataPoint.value as NumericHealthValue).numericValue;
      } else if (dataPoint.type == HealthDataType.EXERCISE_TIME &&
          dataPoint.value is NumericHealthValue) {
        totalExerciseMinutes +=
            (dataPoint.value as NumericHealthValue).numericValue;
      } else if (dataPoint.type == HealthDataType.SLEEP_IN_BED) {
        totalSleepMinutes +=
            (dataPoint.value as NumericHealthValue).numericValue;
      }
    }

    // コンソールに出力
    // print("平均睡眠時間：$totalSleepMinutes分");
    // print("総歩数: $totalSteps 歩");
    // print("総運動時間: $totalExerciseMinutes 分");
  }

  void checkHealthDataAccess() async {
    try {
      // データ取得の試みを行う
      List<HealthDataPoint> healthDataPoints =
          await health.getHealthDataFromTypes(
        startTime: DateTime.now().subtract(const Duration(days: 5)),
        endTime: DateTime.now(),
        types: [HealthDataType.STEPS],
      );

      // print('healthDataPoints: $healthDataPoints');

      await fetchData(healthDataPoints);

      // データが取得できたかどうかでアクセス権限があるかを確認
      bool hasPermissions = healthDataPoints.isNotEmpty;

      setState(() {
        isHealthDataIntegrated = hasPermissions;
      });
      final userNotifier = ref.read(userProvider.notifier);
      userNotifier
          .updateUser(User(healthdataIntegrationStatus: hasPermissions));
    } catch (e) {
      setState(() {
        isHealthDataIntegrated = false;
      });
    }
  }

  Future<void> requestPermissions({
    required BuildContext context,
    required bool isRequested,
  }) async {
    final userNotifier = ref.read(userProvider.notifier);
    if (isRequested) {
      try {
        bool requestResult =
            await health.requestAuthorization([HealthDataType.STEPS]);

        List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          startTime: DateTime.now().subtract(const Duration(days: 1)),
          endTime: DateTime.now(),
          types: [HealthDataType.STEPS],
        );

        bool hasDataAccess = healthData.isNotEmpty;

        setState(() {
          isHealthDataIntegrated = hasDataAccess;
        });
        userNotifier
            .updateUser(User(healthdataIntegrationStatus: hasDataAccess));
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
          print('Permissions revoked');

          setState(() {
            isHealthDataIntegrated = false;
          });
          userNotifier.updateUser(
            User(healthdataIntegrationStatus: false),
          );
        } catch (e) {
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
              trailing: CupertinoSwitch(
                value: isHealthDataIntegrated,
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
