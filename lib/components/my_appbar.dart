import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';

myAppBar({
  required String title,
  List<Widget>? actions,
  bool? centerTitle = false,
}) {
  return AppBar(
    backgroundColor: backGroundColor,
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
