import 'package:flutter/material.dart';
import 'package:serene_track/constant/globalvariavle.dart';
import 'package:serene_track/responsive/mobile_screen_layout.dart';
import 'package:serene_track/responsive/web_screen_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});
  static String get routeName => 'responsive_layout';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return const WebScreenLayout();
        }
        return const MobileScreenLayout();
      },
    );
  }
}
