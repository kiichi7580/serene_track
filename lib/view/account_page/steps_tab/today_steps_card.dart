import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';

class TodayStepsCard extends StatelessWidget {
  const TodayStepsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
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
                    Icons.local_fire_department,
                    color: healthCareStepsColor,
                  ),
                  Text(
                    '今日の歩数',
                    style: TextStyle(
                      color: healthCareStepsColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '1000',
                        style: TextStyle(
                          color: textMainColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '歩',
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
}
