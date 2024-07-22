import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/view/montring_page/provider/montring_page_notifier.dart';
import 'package:serene_track/view/montring_page/components/montring_custom_button.dart';
import 'package:serene_track/view/montring_page/components/montring_timer.dart';

class MontringPage extends ConsumerWidget {
  const MontringPage({super.key});
  static String get routeName => 'montring';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRunning = ref.watch(montringPageProvider).isRunning;

    return Scaffold(
      appBar: myAppBar(
        title: 'モニタリング',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      backgroundColor: backGroundColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: backGroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(flex: 1, child: Container()),
            Container(
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
            const MontringTimer(),
            Flexible(flex: 2, child: Container()),
            const MontringCustomButton(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
            ),
          ],
        ),
      ),
    );
  }
}
