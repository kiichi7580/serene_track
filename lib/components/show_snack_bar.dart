import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';


showSnackBar(
  String content,
  BuildContext context, {
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor ?? black26Color,
      content: Text(content),
    ),
  );
}