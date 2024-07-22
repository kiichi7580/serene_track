import 'package:flutter/material.dart';
import 'package:serene_track/constant/text_source.dart';

class AccountTabsContents extends StatelessWidget {
  const AccountTabsContents({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Center(
          child: Text(taskTx),
        ),
        Center(
          child: Text(stepsTx),
        ),
        Center(
          child: Text(sleepTx),
        ),
      ],
    );
  }
}
