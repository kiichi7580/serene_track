import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';

myAppBar({
  required String title,
  List<Widget>? actions,
  bool? centerTitle = false,
}) {
  return AppBar(
    foregroundColor: textMainColor,
    backgroundColor: backGroundColor.withAlpha(180),
    elevation: 0,
    flexibleSpace: ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(color: Colors.transparent),
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: textMainColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    centerTitle: centerTitle,
    actions: actions,
  );
}
