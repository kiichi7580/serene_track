import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'show_break_promotion_dialog_notifier.freezed.dart';

@freezed
class ShowBreakPromotionDialogState with _$ShowBreakPromotionDialogState {
  factory ShowBreakPromotionDialogState({
    @Default([]) List<bool> checkedList,
    @Default(false) bool isAllchecked,
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
}
