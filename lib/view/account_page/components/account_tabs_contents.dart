import 'package:flutter/material.dart';
import 'package:serene_track/view/account_page/sleep_tab/sleep_tab.dart';
import 'package:serene_track/view/account_page/steps_tab/steps_tab.dart';
import 'package:serene_track/view/account_page/task_tab/task_tab.dart';

class AccountTabsContents extends StatelessWidget {
  const AccountTabsContents({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        TaskTab(),
        StepsTab(),
        SleepTab(),
      ],
    );
  }
}
