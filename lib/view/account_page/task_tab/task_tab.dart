import 'package:flutter/material.dart';
import 'package:serene_track/view/account_page/task_tab/components/grid_pie_charts.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16),
          GridPieCharts(),
        ],
      ),
    );
  }
}
