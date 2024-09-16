import 'package:flutter/material.dart';

class PieChartSector {
  final Color color;
  final double value;
  final String title;
  final TextStyle? titleStyle;

  PieChartSector({
    required this.color,
    required this.value,
    required this.title,
    required this.titleStyle,
  });
}
