import 'package:flutter/material.dart';
import 'package:serene_track/component/my_appbar.dart';
import 'package:serene_track/constant/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  static String get routeName => 'account';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        title: 'ユーザー名',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
            ),
          ),
        ],
      ),
      backgroundColor: backGroundColor,
      body: const Center(
        child: Text('アカウント'),
      ),
    );
  }
}
