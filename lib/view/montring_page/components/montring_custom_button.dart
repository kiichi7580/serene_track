import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/view/montring_page/provider/montring_page_notifier.dart';
import 'package:serene_track/view/montring_page/components/show_break_promotion_dialog.dart';
import 'package:serene_track/view/montring_page/provider/show_break_promotion_dialog_notifier.dart';

class MontringCustomButton extends ConsumerWidget {
  const MontringCustomButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRunning =
        ref.watch(montringPageProvider.select((value) => value.isRunning));
    final dynamicSeconds =
        ref.watch(montringPageProvider.select((value) => value.dynamicSeconds));
    // ignore: unused_local_variable
    final timer =
        ref.watch(montringPageProvider.select((value) => value.timer));

    return isRunning && dynamicSeconds != 0
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(
                height: 70,
                width: 150,
                text: isRunning ? 'ストップ' : 'スタート',
                onPressed: () {
                  if (isRunning) {
                    ref.read(montringPageProvider.notifier).stopTimer();
                  } else {
                    ref.read(montringPageProvider.notifier).startTimer();
                  }
                },
              ),
              const SizedBox(width: 12),
              buildButton(
                height: 70,
                width: 150,
                text: 'リセット',
                onPressed: () {
                  ref.read(montringPageProvider.notifier).resetTimer();
                },
              ),
            ],
          )
        : dynamicSeconds != 0
            ? buildButton(
                height: 70,
                width: 230,
                text: 'スタート',
                onPressed: () async {
                  ref.read(montringPageProvider.notifier).startTimer();
                },
              )
            : buildButton(
                height: 70,
                width: 230,
                text: 'タイマーを止める',
                textColor: darkOrangeColor,
                borderSideColor: darkOrangeColor,
                onPressed: () async {
                  ref.read(montringPageProvider.notifier).stopTimer();
                  ref.read(montringPageProvider.notifier).resetTimer();
                  final response = await showBreakPromotionDialog(context);
                  if (response == null || response == false) {
                    return;
                  }
                  ref
                      .read(showBreakPromotionDialogProvider.notifier)
                      .setResponse(response);
                  ref
                      .read(showBreakPromotionDialogProvider.notifier)
                      .celebrate();
                  ref.read(showBreakPromotionDialogProvider.notifier).vibrate();
                },
              );
  }

  Widget buildButton({
    required double? height,
    required double? width,
    required String text,
    required void Function()? onPressed,
    Color? textColor = navyBlueColor,
    Color borderSideColor = navyBlueColor,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
          side: BorderSide(
            color: borderSideColor,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
