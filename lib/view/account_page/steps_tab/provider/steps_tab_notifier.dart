import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'steps_tab_notifier.freezed.dart';

@freezed
class StepsTabState with _$StepsTabState {
  factory StepsTabState({
    @Default(0) int todaySteps,
    @Default(0) int weekAvgSteps,
    @Default([]) List<int> weekSteps,
  }) = _StepsTabState;
  StepsTabState._();
}

final stepsTabProvider =
    StateNotifierProvider<StepsTabStateController, StepsTabState>(
        (ref) => StepsTabStateController());

class StepsTabStateController extends StateNotifier<StepsTabState> {
  StepsTabStateController() : super(StepsTabState()) {
    _init();
  }

  void _init() {}

  void getSteps(List<int> steps) {
    state = state.copyWith(weekSteps: steps, todaySteps: steps[6]);
    getAvgStepsPerWeek(state.weekSteps);
  }

  void getAvgStepsPerWeek(List<int> steps) {
    double weekAvgSteps = steps.reduce((a, b) => a + b) / steps.length;
    int weekAvgStepsToInt = weekAvgSteps.toInt();
    state = state.copyWith(weekAvgSteps: weekAvgStepsToInt);
  }
}
