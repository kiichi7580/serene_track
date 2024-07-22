import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/view/account_page/components/account_header.dart';
import 'package:serene_track/view/account_page/components/account_tab.dart';
import 'package:serene_track/view/account_page/components/account_tabs_contents.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  static String get routeName => 'account';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          title: const AccountHeader(),
          toolbarHeight: 240,
          backgroundColor: backGroundColor,
          bottom: const TabBar(
            padding: EdgeInsets.only(top: 16, right: 16, left: 16),
            indicatorColor: appleColor,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
            tabs: [
              AccountTab(tabName: taskTx),
              AccountTab(tabName: stepsTx),
              AccountTab(tabName: sleepTx),
            ],
          ),
        ),
        body: const AccountTabsContents(),
      ),
    );
  }
}
