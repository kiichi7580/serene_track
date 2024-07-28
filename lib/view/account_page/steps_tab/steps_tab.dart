import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/controllers/global/user_notifier.dart';
import 'package:serene_track/view/account_page/steps_tab/after_integration_content.dart';
import 'package:serene_track/view/account_page/steps_tab/before_integration_content.dart';

class StepsTab extends ConsumerWidget {
  const StepsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healthDataIntegrationStatus =
        ref.watch(userProvider).user.healthDataIntegrationStatus;

    return Scaffold(
      backgroundColor: backGroundColor,
      body: healthDataIntegrationStatus == false
          ? const BeforeIntegrationContent()
          : const AfterIntegrationContent(),
    );
  }
}
