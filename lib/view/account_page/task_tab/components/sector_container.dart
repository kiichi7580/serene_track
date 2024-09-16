import 'package:flutter/cupertino.dart';
import 'package:serene_track/model/src/pie_chart_sector.dart';

class SectorContainer extends StatelessWidget {
  const SectorContainer({
    super.key,
    required this.pieChartSector,
  });

  final List<PieChartSector> pieChartSector;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                color: pieChartSector[0].color,
              ),
              const SizedBox(width: 8),
              Text(
                pieChartSector[0].title,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                color: pieChartSector[1].color,
              ),
              const SizedBox(width: 8),
              Text(
                pieChartSector[1].title,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
