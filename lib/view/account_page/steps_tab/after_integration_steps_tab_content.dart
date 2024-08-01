import 'package:flutter/material.dart';
import 'package:serene_track/view/account_page/steps_tab/components/today_steps_card.dart';
import 'package:serene_track/view/account_page/steps_tab/components/week_steps_chart_card.dart';

class AfterIntegrationStepsTabContent extends StatelessWidget {
  const AfterIntegrationStepsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16),
          TodayStepsCard(),
          SizedBox(height: 16),
          WeekStepsChartCard(),
        ],
      ),
    );
  }
}
