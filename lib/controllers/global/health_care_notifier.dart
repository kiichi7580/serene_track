import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health/health.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/view/account_page/sleep_tab/provider/sleep_tab_notifier.dart';
import 'package:serene_track/view/account_page/steps_tab/provider/steps_tab_notifier.dart';

part 'health_care_notifier.freezed.dart';

@freezed
class HealthCareState with _$HealthCareState {
  const factory HealthCareState({
    Health? health,
  }) = _HealthCareState;
}

final healthCareProvider =
    StateNotifierProvider<HealthCareController, HealthCareState>(
  (ref) {
    final userNotifier = ref.watch(userProvider.notifier);
    return HealthCareController(ref: ref, userNotifier: userNotifier);
  },
  dependencies: [userProvider],
);

class HealthCareController extends StateNotifier<HealthCareState> {
  HealthCareController({
    required ref,
    required userNotifier,
  })  : _ref = ref,
        _userNotifier = userNotifier,
        super(const HealthCareState()) {
    init();
  }

  final StateNotifierProviderRef<HealthCareController, HealthCareState> _ref;
  final UserController _userNotifier;

  Future<void> init() async {
    Health health = Health();
    state = state.copyWith(health: health);
    if (state.health != null) checkHealthDataAccess(state.health!);
  }

  static final types = [
    HealthDataType.STEPS,
    HealthDataType.SLEEP_IN_BED,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_DEEP,
    HealthDataType.SLEEP_REM,
  ];

  Future<void> checkHealthDataAccess(Health health) async {
    try {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        startTime: DateTime.now().subtract(const Duration(days: 6)),
        endTime: DateTime.now(),
        types: types,
      );
      bool hasPermissions = healthData.isNotEmpty;
      await _userNotifier.updateHealthDataIntegrationStatus(hasPermissions);
      if (hasPermissions) {
        fetchData(health);
      }
    } catch (e) {
      await _userNotifier.updateHealthDataIntegrationStatus(false);
      throw ('Error: $e');
    }
  }

  Future<void> fetchData(Health health) async {
    try {
      DateTime startOfDay = DateTime.now().subtract(const Duration(days: 6));
      DateTime endOfDay = DateTime.now();

      List<HealthDataPoint> healthDataPoints =
          await health.getHealthDataFromTypes(
        startTime: startOfDay,
        endTime: endOfDay,
        types: types,
      );

      if (healthDataPoints.isEmpty) {
        return;
      }

      healthDataPoints = health.removeDuplicates(healthDataPoints);

      Map<DateTime, int> dailyStepsMap = {};
      Map<DateTime, int> dailySleepHoursMap = {};

      for (var dataPoint in healthDataPoints) {
        dynamic year = dataPoint.dateFrom.year;
        int month = dataPoint.dateFrom.month;
        int day = dataPoint.dateFrom.day;
        DateTime date = DateTime(year, month, day);

        num stepValue = 0;
        num sleepHoursValue = 0;
        if (dataPoint.type == HealthDataType.STEPS &&
            dataPoint.value is NumericHealthValue) {
          stepValue = (dataPoint.value as NumericHealthValue).numericValue;
        } else if (dataPoint.type == HealthDataType.SLEEP_IN_BED) {
          sleepHoursValue =
              (dataPoint.value as NumericHealthValue).numericValue;
        }

        if (!dailyStepsMap.containsKey(date)) {
          dailyStepsMap[date] = 0;
          dailySleepHoursMap[date] = 0;
        }

        dailyStepsMap[date] = dailyStepsMap[date]! + stepValue.toInt();
        dailySleepHoursMap[date] =
            dailySleepHoursMap[date]! + sleepHoursValue.toInt();
      }

      List<int> steps = [];
      List<int> sleepHours = [];
      for (int i = 0; i < 7; i++) {
        DateTime day =
            DateTime(startOfDay.year, startOfDay.month, startOfDay.day)
                .add(Duration(days: i));
        steps.add(dailyStepsMap[day] ?? 0);
        sleepHours.add(dailySleepHoursMap[day] ?? 0);
      }
      _ref.read(stepsTabProvider.notifier).getSteps(steps);
      _ref.read(sleepTabProvider.notifier).getWeekSleepHours(sleepHours);
    } catch (e) {
      throw ('Error: $e');
    }
  }
}
