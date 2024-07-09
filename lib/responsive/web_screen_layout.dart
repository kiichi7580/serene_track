import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});
  static String get routeName => 'web_screen_layout';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('web'),
      ),
    );
  }
}