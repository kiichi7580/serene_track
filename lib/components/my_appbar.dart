import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';

myAppBar({
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: backGroundColor,
    title: Text(
      title,
      style: const TextStyle(
        color: textMainColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: false,
    actions: actions,
  );
}
