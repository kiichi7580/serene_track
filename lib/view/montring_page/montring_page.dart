import 'package:flutter/material.dart';
import 'package:serene_track/component/my_appbar.dart';
import 'package:serene_track/constant/colors.dart';

class MontringPage extends StatelessWidget {
  const MontringPage({super.key});
  static String get routeName => 'montring';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        title: 'モニタリング',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      backgroundColor: backGroundColor,
      body: const Center(
        child: Text('モニタリング'),
      ),
    );
  }
}
