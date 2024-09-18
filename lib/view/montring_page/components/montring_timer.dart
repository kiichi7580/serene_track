import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/view/montring_page/provider/montring_page_notifier.dart';

class MontringTimer extends ConsumerWidget {
  const MontringTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamicSeconds =
        ref.watch(montringPageProvider.select((value) => value.dynamicSeconds));
    final totalSeconds =
        ref.watch(montringPageProvider.select((value) => value.totalSeconds));

    if (dynamicSeconds == 0) {
      // 状態の変更を非同期に行う
      Future.microtask(() {
        ref.read(montringPageProvider.notifier).changeIsRunningState(false);
        ref.read(montringPageProvider.notifier).playSoundTimeUp();
      });
    }

    return SizedBox(
      width: 240,
      height: 240,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: 1 - dynamicSeconds / totalSeconds,
            valueColor: const AlwaysStoppedAnimation(lightSkyBlueColor),
            strokeWidth: 15,
            backgroundColor: navyBlueColor,
          ),
          Center(
            child: Text(
              (dynamicSeconds / 60).floor().toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: dynamicSeconds == 0 ? lightSkyBlueColor : navyBlueColor,
                fontSize: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTime(WidgetRef ref) {
    final dynamicSeconds = ref.watch(montringPageProvider).dynamicSeconds;
    if (dynamicSeconds == 0) {
      ref.read(montringPageProvider.notifier).changeIsRunningState(false);
      ref.read(montringPageProvider.notifier).playSoundTimeUp();
      return Text(
        '$dynamicSeconds',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: navyBlueColor,
          fontSize: 80,
        ),
      );
    } else {
      return Text(
        '$dynamicSeconds',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: navyBlueColor,
          fontSize: 80,
        ),
      );
    }
  }
}
