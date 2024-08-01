import 'package:flutter/material.dart';
import 'package:serene_track/view/account_page/sleep_tab/components/week_average_sleep_hours_card.dart';
import 'package:serene_track/view/account_page/sleep_tab/components/week_sleep_hours_chart_card.dart';

class AfterIntegrationSleepTabContent extends StatelessWidget {
  const AfterIntegrationSleepTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16),
          WeekAverageSleepHoursCard(),
          SizedBox(height: 16),
          WeekSleepHoursChartCard()
        ],
      ),
    );
  }
}
