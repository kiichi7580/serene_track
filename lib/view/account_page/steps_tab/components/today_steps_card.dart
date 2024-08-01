import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/view/account_page/steps_tab/provider/steps_tab_notifier.dart';

class TodayStepsCard extends ConsumerWidget {
  const TodayStepsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todaySteps =
        ref.watch(stepsTabProvider.select((value) => value.todaySteps));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 3,
        color: backGroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: healthCareStepsColor,
                  ),
                  Text(
                    '今日の歩数',
                    style: TextStyle(
                      color: healthCareStepsColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: todaySteps.toString(),
                        style: const TextStyle(
                          color: textMainColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: '歩',
                        style: TextStyle(
                          color: textMainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
