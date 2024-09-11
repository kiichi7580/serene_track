import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({
    super.key,
    required this.tabName,
  });
  final String tabName;

  @override
  Widget build(BuildContext context) {
    final icon = tabIcon(tabName);
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textMainColor,
          ),
          const SizedBox(width: 4),
          Text(
            tabName,
            style: TextStyles.accountTabStyle,
          ),
        ],
      ),
    );
  }

  IconData tabIcon(String tabName) {
    switch (tabName) {
      case 'タスク':
        return LineIcons.checkSquareAlt;
      case '歩数':
        return LineIcons.shoePrints;
      case '睡眠':
        return LineIcons.bed;
      default:
        return LineIcons.checkSquareAlt;
    }
  }
}
