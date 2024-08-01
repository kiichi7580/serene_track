import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/view/account_page/sleep_tab/provider/sleep_tab_notifier.dart';

class WeekAverageSleepHoursCard extends ConsumerWidget {
  const WeekAverageSleepHoursCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekAvgSleepHours =
        ref.watch(sleepTabProvider.select((value) => value.weekAvgSleepHours));
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
                    Icons.bed,
                    color: healthCareSleepColor,
                  ),
                  Text(
                    '今週の睡眠時間',
                    style: TextStyle(
                      color: healthCareSleepColor,
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
                        text: weekAvgSleepHoursText(weekAvgSleepHours),
                        style: const TextStyle(
                          color: textMainColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: '時間',
                        style: TextStyle(
                          color: textMainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: weekAvgSleepMinutesText(weekAvgSleepHours),
                        style: const TextStyle(
                          color: textMainColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: '分',
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

  String weekAvgSleepHoursText(List<int> weekAvgSleepHours) {
    if (weekAvgSleepHours.isEmpty) {
      return '0';
    }
    return weekAvgSleepHours[0].toString();
  }

  String weekAvgSleepMinutesText(List<int> weekAvgSleepHours) {
    if (weekAvgSleepHours.isEmpty) {
      return '0';
    }
    return weekAvgSleepHours[1].toString();
  }
}
