import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/view/account_page/sleep_tab/after_integration_sleep_tab_content.dart';
import 'package:serene_track/view/account_page/steps_tab/before_integration_content.dart';

class SleepTab extends ConsumerWidget {
  const SleepTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healthDataIntegrationStatus = ref
        .watch(userProvider.select((s) => s.user.healthDataIntegrationStatus));

    return Scaffold(
      backgroundColor: backGroundColor,
      body: healthDataIntegrationStatus == false
          ? const BeforeIntegrationContent()
          : const AfterIntegrationSleepTabContent(),
    );
  }
}
