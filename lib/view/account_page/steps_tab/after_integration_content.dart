import 'package:flutter/material.dart';
import 'package:serene_track/view/account_page/steps_tab/today_steps_card.dart';

class AfterIntegrationContent extends StatelessWidget {
  const AfterIntegrationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          TodayStepsCard(),
        ],
      ),
    );
  }
}
