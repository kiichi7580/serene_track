import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/components/custom_dialog.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/view/montring_page/provider/show_break_promotion_dialog_notifier.dart';
import 'package:serene_track/view/montring_page/components/break_checkbox_tile.dart';

Future<bool?> showBreakPromotionDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: _buildBreakPromotionDialog,
  );
}

Widget _buildBreakPromotionDialog(BuildContext context) {
  return Consumer(
    builder: (context, ref, child) {
      final checkedList = ref.watch(showBreakPromotionDialogProvider
          .select((value) => value.checkedList));
      bool allChecked = checkedList.every((check) => check);

      return CustomDialog(
        title: 'ちょっとだけ休憩しましょう☕️',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 40),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Column(
              children: [
                Text(
                  '作業開始から1時間が経ちました。\n疲れている体を少しだけ休めましょう。',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                BreakCheckboxTile(
                  title: '起立して10回スクワットをしましょう',
                  index: 0,
                  value: checkedList[0],
                  onChanged: (value) {
                    ref
                        .watch(showBreakPromotionDialogProvider.notifier)
                        .changeCheckedList(0, value!);
                  },
                ),
                BreakCheckboxTile(
                  title: '目を閉じたまま1分数えましょう',
                  index: 1,
                  value: checkedList[1],
                  onChanged: (value) {
                    ref
                        .watch(showBreakPromotionDialogProvider.notifier)
                        .changeCheckedList(1, value!);
                  },
                ),
                BreakCheckboxTile(
                  title: '頭を倒して首を伸ばし15秒キープしてください\n反対側も同様に行なってください',
                  index: 2,
                  value: checkedList[2],
                  onChanged: (value) {
                    ref
                        .watch(showBreakPromotionDialogProvider.notifier)
                        .changeCheckedList(2, value!);
                  },
                ),
                BreakCheckboxTile(
                  title:
                      '両手を肩につけ、肘で大きな円を描くように前から後ろに大きく30秒間回してください\n反対側も同様に行なってください',
                  index: 3,
                  value: checkedList[3],
                  onChanged: (value) {
                    ref
                        .watch(showBreakPromotionDialogProvider.notifier)
                        .changeCheckedList(3, value!);
                  },
                ),
              ],
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              foregroundColor: textMainColor,
              backgroundColor: backGroundColor,
            ),
            onPressed: () {
              ref
                  .watch(showBreakPromotionDialogProvider.notifier)
                  .getInitCheckedList(4);
              Navigator.pop(context, false);
            },
            child: const Text(
              'あとで',
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              side: BorderSide(
                color: allChecked ? navyBlueColor : unselectedColor,
              ),
              foregroundColor: navyBlueColor,
              backgroundColor: backGroundColor,
            ),
            onPressed: allChecked
                ? () {
                    ref
                        .watch(showBreakPromotionDialogProvider.notifier)
                        .getInitCheckedList(4);
                    Navigator.pop(context, true);
                  }
                : null,
            child: const Text(
              '休憩達成',
            ),
          ),
        ],
      );
    },
  );
}
