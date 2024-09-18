import 'package:confetti/confetti.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'show_break_promotion_dialog_notifier.freezed.dart';

@freezed
class ShowBreakPromotionDialogState with _$ShowBreakPromotionDialogState {
  factory ShowBreakPromotionDialogState({
    @Default([]) List<bool> checkedList,
    @Default(false) bool isAllChecked,
    @Default(false) bool response,
    ConfettiController? confettiController,
  }) = _ShowBreakPromotionDialogState;
  ShowBreakPromotionDialogState._();
}

final showBreakPromotionDialogProvider = StateNotifierProvider<
        ShowBreakPromotionDialogStateController, ShowBreakPromotionDialogState>(
    (ref) => ShowBreakPromotionDialogStateController());

class ShowBreakPromotionDialogStateController
    extends StateNotifier<ShowBreakPromotionDialogState> {
  ShowBreakPromotionDialogStateController()
      : super(ShowBreakPromotionDialogState()) {
    _init();
  }

  Future<void> _init() async {
    final confettiController =
        ConfettiController(duration: const Duration(milliseconds: 500));
    state = state.copyWith(confettiController: confettiController);
    getInitCheckedList(4);
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

  void setResponse(bool response) {
    state = state.copyWith(response: response);
  }

  Future<void> vibrate() async {
    Vibrate.vibrate();
    // bool canVibrate = await Vibrate.canVibrate;
    // if (canVibrate) {
    //   Vibrate.vibrate();
    // }
    // await Future.delayed(const Duration(milliseconds: 500));
    // final Iterable<Duration> pauses = [
    //   const Duration(milliseconds: 500),
    // ];
    // Vibrate.vibrateWithPauses(pauses);
  }

  void celebrate() {
    if (state.confettiController != null && state.isAllChecked) {
      state.confettiController!.play();
    }
    // state = state.copyWith(isAllChecked: false);
  }

  @override
  void dispose() {
    state.confettiController!.dispose();
    super.dispose();
  }
}
