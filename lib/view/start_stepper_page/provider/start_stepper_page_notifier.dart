import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_stepper_page_notifier.freezed.dart';

@freezed
class StartStepperPageState with _$StartStepperPageState {
  factory StartStepperPageState({
    @Default(0) int currentStep,
    @Default([]) List<bool> checkedList,
    @Default(false) bool isAllChecked,
  }) = _StartStepperPageState;
  StartStepperPageState._();
}

final startStepperPageProvider = StateNotifierProvider<
    StartStepperPageStateController,
    StartStepperPageState>((ref) => StartStepperPageStateController());

class StartStepperPageStateController
    extends StateNotifier<StartStepperPageState> {
  StartStepperPageStateController() : super(StartStepperPageState()) {
    _init();
  }

  Future<void> _init() async {
    getInitCheckedList(2);
  }

  void setIndex(int newIndex) {
    state = state.copyWith(currentStep: newIndex);
  }

  void getInitCheckedList(int length) {
    state = state.copyWith(checkedList: List<bool>.filled(length, false));
  }

  void changeCheckedList(int index, bool changeValue) {
    List<bool> checkedList = [
      for (int i = 0; i < state.checkedList.length; i++)
        i == index ? changeValue : state.checkedList[i],
    ];
    state = state.copyWith(checkedList: checkedList);
  }

  void setIsAllChecked(bool isAllChecked) {
    state = state.copyWith(isAllChecked: isAllChecked);
  }
}
