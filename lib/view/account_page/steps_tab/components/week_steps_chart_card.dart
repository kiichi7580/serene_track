import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/view/account_page/steps_tab/provider/steps_tab_notifier.dart';

class WeekStepsChartCard extends ConsumerWidget {
  const WeekStepsChartCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final steps = ref.watch(stepsTabProvider).weekSteps;
    final weekAvgSteps = ref.watch(stepsTabProvider).weekAvgSteps;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: Card(
        elevation: 3,
        color: backGroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: screenHeight * 0.21,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(
                  border: const Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide(width: 1),
                    bottom: BorderSide(width: 1),
                  ),
                ),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    axisNameWidget: weekAvgStepsText(weekAvgSteps),
                    axisNameSize: 35.0,
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                groupsSpace: 10,
                barGroups: [
                  for (var i = 0; i < steps.length; i++) ...{
                    BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: steps[i].toDouble(),
                          width: 15,
                          color: healthCareStepsColor,
                        ),
                      ],
                    ),
                  }
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget weekAvgStepsText(int weekAvgSteps) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      text: TextSpan(
        children: [
          const TextSpan(
            text: '平均歩数: ',
            style: TextStyles.accountHeaderTextStyle,
          ),
          TextSpan(
            text: weekAvgSteps.toString(),
            style: TextStyles.accountHeaderBoldTextStyle,
          ),
          const TextSpan(
            text: '歩',
            style: TextStyles.accountHeaderTextStyle,
          ),
        ],
      ),
    );
  }
}
