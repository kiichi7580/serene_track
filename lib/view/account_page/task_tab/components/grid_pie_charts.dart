import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/view/account_page/task_tab/components/custom_pie_chart.dart';
import 'package:serene_track/view/account_page/task_tab/components/sector_container.dart';
import 'package:serene_track/view/account_page/task_tab/components/task_add_promotion.dart';
import 'package:serene_track/view/account_page/task_tab/provider/task_tab_notifier.dart';

class GridPieCharts extends ConsumerStatefulWidget {
  const GridPieCharts({super.key});

  @override
  ConsumerState<GridPieCharts> createState() => GridPieChartsState();
}

class GridPieChartsState extends ConsumerState<GridPieCharts> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(taskTabProvider.notifier).getSectors();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final sectors =
        ref.watch(taskTabProvider.select((value) => value.sectors)).toList();
    if (sectors.isEmpty) {
      return Column(
        children: [
          SizedBox(
            height: screenHeight * 0.2,
          ),
          const TaskAddPromotion(),
        ],
      );
    }

    return SizedBox(
      height: screenHeight * 0.94,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          4,
          (index) {
            return Center(
              child: Stack(
                children: [
                  Positioned(
                    top: 2,
                    left: 10,
                    child: SectorContainer(
                      pieChartSector: sectors[index],
                    ),
                  ),
                  Positioned(
                    top: 4,
                    left: 1,
                    child: CustomPieChart(
                      sectors: sectors[index],
                    ),
                  ),
                  Positioned(
                    top: 94,
                    left: sectors[index][0].title == allTx ? 80 : 86,
                    child: Text(
                      sectors[index][0].title,
                      style: TextStyles.accountHeaderBoldTextStyle,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
