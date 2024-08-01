import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_tab_notifier.freezed.dart';

@freezed
class SleepTabState with _$SleepTabState {
  factory SleepTabState({
    @Default(0) int weekAvgTotalSleepMinutes,
    @Default([]) List<int> weekTotalSleepMinutes,
    @Default([]) List<int> weekAvgSleepHours,
    @Default([]) List<List<int>> weekSleepHours,
  }) = _SleepTabState;
  SleepTabState._();
}

final sleepTabProvider =
    StateNotifierProvider<SleepTabStateController, SleepTabState>(
        (ref) => SleepTabStateController());

class SleepTabStateController extends StateNotifier<SleepTabState> {
  SleepTabStateController() : super(SleepTabState()) {
    _init();
  }

  void _init() {}

  void getWeekSleepHours(List<int> weekTotalSleepMinutes) {
    List<List<int>> weekSleepHours = [];
    for (int sleepTotalMinutes in weekTotalSleepMinutes) {
      List<int> sleepHours = [];
      int sleepHour = sleepTotalMinutes ~/ 60;
      int sleepMinute = (sleepTotalMinutes % 60).toInt();
      sleepHours.add(sleepHour);
      sleepHours.add(sleepMinute);
      weekSleepHours.add(sleepHours);
    }
    state = state.copyWith(
      weekTotalSleepMinutes: weekTotalSleepMinutes,
      weekSleepHours: weekSleepHours,
    );
    getWeekAvgSleepHours(state.weekTotalSleepMinutes);
  }

  void getWeekAvgSleepHours(List<int> weekTotalSleepMinutes) {
    List<int> weekAvgSleepHours = [];
    double weekAvgTotalSleepMinutes =
        weekTotalSleepMinutes.reduce((a, b) => a + b) /
            weekTotalSleepMinutes.length;
    int weekAvgTotalSleepMinutesToInt = weekAvgTotalSleepMinutes.toInt();
    int sleepHour = weekAvgTotalSleepMinutesToInt ~/ 60;
    int sleepMinute = (weekAvgTotalSleepMinutesToInt % 60).toInt();
    weekAvgSleepHours.add(sleepHour);
    weekAvgSleepHours.add(sleepMinute);
    state = state.copyWith(
      weekAvgTotalSleepMinutes: weekAvgTotalSleepMinutesToInt,
      weekAvgSleepHours: weekAvgSleepHours,
    );
  }
}
