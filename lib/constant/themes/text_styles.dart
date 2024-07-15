import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';

class TextStyles {
  TextStyles._();
  static const authPageTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textMainColor,
  );
  static const title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: textMainColor,
  );
  static const caption = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: textMainColor,
  );
  static const buttonTextStyle = TextStyle(
    color: backGroundColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static const taskTitleBoldStyle = TextStyle(
    color: textMainColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static const taskTitleStyle = TextStyle(
    color: textMainColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}
