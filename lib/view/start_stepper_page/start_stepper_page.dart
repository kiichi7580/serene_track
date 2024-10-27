import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/constants.dart';
import 'package:serene_track/utils/preferences_manager.dart';
import 'package:serene_track/view/start_stepper_page/components/step_content.dart';
import 'package:serene_track/view/start_stepper_page/provider/start_stepper_page_notifier.dart';
import 'package:serene_track/view/todo_page/todo_page.dart';

class StartStepperPage extends ConsumerWidget {
  const StartStepperPage({super.key});
  static String get routeName => 'start_stepper_page';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref
        .watch(startStepperPageProvider.select((value) => value.currentStep));
    final checkedList = ref
        .watch(startStepperPageProvider.select((value) => value.checkedList));
    bool allChecked = checkedList.every((check) => check);
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        foregroundColor: backGroundColor,
        backgroundColor: appleColor,
        elevation: 0,
        centerTitle: false,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: const Text(
          'ようこそ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Serene Trackへようこそ\n',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: appleColor,
                    ),
                  ),
                  TextSpan(
                    text: '\n',
                  ),
                  TextSpan(
                    text: '利用を開始する前に、利用規約・プライバシーポリシーの合意をお願いいたします。',
                    style: TextStyle(
                      color: textMainColor,
                    ),
                  ),
                ],
              ),
            ),
            Stepper(
              currentStep: currentStep,
              onStepCancel: () {
                if (currentStep != 0) {
                  ref
                      .read(startStepperPageProvider.notifier)
                      .setIndex(currentStep - 1);
                }
              },
              onStepContinue: () {
                ref
                    .read(startStepperPageProvider.notifier)
                    .setIndex(currentStep + 1);
              },
              onStepTapped: (int index) {
                ref.read(startStepperPageProvider.notifier).setIndex(index);
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Row(
                  children: [
                    if (currentStep != 1)
                      ElevatedButton(
                        onPressed: details.onStepContinue,
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          foregroundColor: yellowGreenColor,
                          backgroundColor: backGroundColor,
                          side: const BorderSide(
                            width: 1,
                            color: yellowGreenColor,
                          ),
                        ),
                        child: const Text('次へ'),
                      ),
                    const SizedBox(width: 8),
                    if (currentStep != 0)
                      TextButton(
                        onPressed: details.onStepCancel,
                        style: TextButton.styleFrom(
                          foregroundColor: textMainColor,
                          backgroundColor: backGroundColor,
                          side: const BorderSide(
                            width: 1,
                            color: textMainColor,
                          ),
                        ),
                        child: const Text('戻る'),
                      ),
                  ],
                );
              },
              steps: [
                Step(
                  stepStyle: StepStyle(
                    color: checkedList[0] == false ? unselectedColor : null,
                    gradient: checkedList[0] == true
                        ? const LinearGradient(
                            colors: [
                              appleColor,
                              yellowGreenColor,
                            ],
                          )
                        : null,
                  ),
                  isActive: true,
                  state: stepState(
                    step: 0,
                    currentStep: currentStep,
                    isChecked: checkedList[0],
                  ),
                  title: const Text('利用規約の確認'),
                  content: const StepContent(
                    index: 0,
                    text: '利用規約はこちら',
                    urlString: kAppTermsUrl,
                  ),
                ),
                Step(
                  stepStyle: StepStyle(
                    color: checkedList[1] == false ? unselectedColor : null,
                    gradient: checkedList[1] == true
                        ? const LinearGradient(
                            colors: [
                              appleColor,
                              yellowGreenColor,
                            ],
                          )
                        : null,
                  ),
                  isActive: true,
                  state: stepState(
                    step: 1,
                    currentStep: currentStep,
                    isChecked: checkedList[1],
                  ),
                  title: const Text('プライバシーポリシーの確認'),
                  content: const StepContent(
                    index: 1,
                    text: 'プライバシーポリシーはこちら',
                    urlString: kAppPrivacyPolicyUrl,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                side: BorderSide(
                  color: allChecked ? appleColor : unselectedColor,
                ),
                foregroundColor: appleColor,
                backgroundColor: backGroundColor,
              ),
              onPressed: allChecked
                  ? () async {
                      ref
                          .read(startStepperPageProvider.notifier)
                          .getInitCheckedList(2);
                      ref
                          .read(startStepperPageProvider.notifier)
                          .setIsAllChecked(allChecked);
                      await PreferencesManager().setIsFirstLaunchAfterInstall(
                          isFirstLaunchAfterInstall: false);
                      if (!context.mounted) return;
                      context.go(TodoPage.routeLocation);
                    }
                  : null,
              child: const Text('はじめる'),
            ),
          ],
        ),
      ),
    );
  }

  StepState stepState({
    required int step,
    required int currentStep,
    required bool isChecked,
  }) {
    if (currentStep > step && isChecked) {
      return StepState.complete;
    }
    return StepState.indexed;
  }
}
