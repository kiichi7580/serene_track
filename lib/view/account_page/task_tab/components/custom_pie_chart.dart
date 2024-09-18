import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/model/src/pie_chart_sector.dart';
import 'package:serene_track/view/account_page/task_tab/provider/task_tab_notifier.dart';
import 'dart:math';

class CustomPieChart extends ConsumerWidget {
  const CustomPieChart({
    super.key,
    required this.sectors,
  });

  final List<PieChartSector> sectors;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final touchedSectionIndex =
        ref.watch(taskTabProvider.select((value) => value.touchedSectionIndex));
    List<PieChartSectionData> chartSections(List<PieChartSector> sectors) {
      final List<PieChartSectionData> list = [];
      for (int i = 0; i < sectors.length; i++) {
        final sector = sectors[i];
        final data = PieChartSectionData(
          color: sector.color,
          value: sector.value,
          // title: '${sector.value.toString()}%',
          // titleStyle: sector.titleStyle,
          showTitle: false,
          radius: touchedSectionIndex == i ? 48.0 : 40.0,
          badgeWidget: Transform.rotate(
            angle: 90 * pi / 180,
            child: Text(
              '${sector.value.toString()}%',
              style: sector.titleStyle,
            ),
          ),
        );
        list.add(data);
      }
      return list;
    }

    return SizedBox(
      height: 200,
      width: 200,
      child: Transform.rotate(
        angle: -90 * pi / 180,
        child: PieChart(
          PieChartData(
            sections: chartSections(sectors),
            centerSpaceRadius: 32.0,
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent e, PieTouchResponse? r) {
                if (r != null && r.touchedSection != null) {
                  ref.read(taskTabProvider.notifier).setTouchedSectionIndex(
                      r.touchedSection!.touchedSectionIndex);
                }
              },
              mouseCursorResolver: (FlTouchEvent e, PieTouchResponse? r) {
                if (r != null &&
                    r.touchedSection != null &&
                    r.touchedSection!.touchedSectionIndex != -1) {
                  return SystemMouseCursors.click;
                }
                return SystemMouseCursors.basic;
              },
            ),
          ),
        ),
      ),
    );
  }
}
