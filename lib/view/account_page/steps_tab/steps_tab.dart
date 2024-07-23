import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/controllers/global/user_controller.dart';
import 'package:serene_track/view/account_page/steps_tab/after_integration_content.dart';
import 'package:serene_track/view/account_page/steps_tab/before_integration_content.dart';

class StepsTab extends ConsumerWidget {
  const StepsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider).user;
    final isHealthDataIntegrated = user.healthdataIntegrationStatus;

    return Scaffold(
      backgroundColor: backGroundColor,
      body: isHealthDataIntegrated == false
          ? const BeforeIntegrationContent()
          : const AfterIntegrationContent(),
    );
  }
}
