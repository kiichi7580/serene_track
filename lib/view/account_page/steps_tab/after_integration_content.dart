import 'package:flutter/material.dart';
import 'package:serene_track/view/account_page/steps_tab/components/today_steps_card.dart';
import 'package:serene_track/view/account_page/steps_tab/components/week_steps_chart_card.dart';

class AfterIntegrationContent extends StatelessWidget {
  const AfterIntegrationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TodayStepsCard(),
            WeekStepsChartCard(),
          ],
        ),
      ),
    );
  }
}
