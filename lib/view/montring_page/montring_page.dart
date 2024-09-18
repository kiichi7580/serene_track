import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/view/montring_page/components/custom_confetti_widget.dart';
import 'package:serene_track/view/montring_page/provider/montring_page_notifier.dart';
import 'package:serene_track/view/montring_page/components/montring_custom_button.dart';
import 'package:serene_track/view/montring_page/components/montring_timer.dart';
import 'package:serene_track/view/montring_page/provider/show_break_promotion_dialog_notifier.dart';

class MontringPage extends ConsumerWidget {
  const MontringPage({super.key});
  static String get routeName => 'montring';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRunning =
        ref.watch(montringPageProvider.select((value) => value.isRunning));
    final isAllChecked = ref.watch(
        showBreakPromotionDialogProvider.select((value) => value.isAllChecked));
    final dynamicSeconds =
        ref.watch(montringPageProvider.select((value) => value.dynamicSeconds));
    final response = ref.watch(
        showBreakPromotionDialogProvider.select((value) => value.response));

    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: myAppBar(title: 'モニタリング'),
      body: Stack(
        children: [
          if (isAllChecked && response) ...[
            Positioned(
              top: -80,
              left: 170,
              child: Container(
                padding: const EdgeInsets.all(30),
                alignment: Alignment.topCenter,
                child: const CustomConfettiWidget(),
              ),
            ),
          ],
          Positioned(
            top: 90,
            left: 140,
            child: Container(
              alignment: Alignment.center,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: isRunning
                    ? const Text(
                        '作業中...',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
          const Positioned(
            top: 160,
            left: 74,
            child: MontringTimer(),
          ),
          Positioned(
            top: 490,
            left: isRunning && dynamicSeconds != 0 ? 40 : 80,
            child: const MontringCustomButton(),
          ),
        ],
      ),
    );
  }
}
