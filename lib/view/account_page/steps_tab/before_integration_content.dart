import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/view/health_care_page/health_care_app_integration_page.dart';

class BeforeIntegrationContent extends StatelessWidget {
  const BeforeIntegrationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          side: const BorderSide(
            color: healthCareAppColor,
          ),
          foregroundColor: healthCareAppColor,
          backgroundColor: backGroundColor,
        ),
        onPressed: () {
          context.push(HealthCareAppIntegrationPage.routeLocation);
        },
        child: const Text('ヘルスケアと連携する'),
      ),
    );
  }
}
