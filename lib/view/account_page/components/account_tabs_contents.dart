import 'package:flutter/material.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/view/account_page/steps_tab/steps_tab.dart';

class AccountTabsContents extends StatelessWidget {
  const AccountTabsContents({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Center(
          child: Text(taskTx),
        ),
        StepsTab(),
        Center(
          child: Text(sleepTx),
        ),
      ],
    );
  }
}
