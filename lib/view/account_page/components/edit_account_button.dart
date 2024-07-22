import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';

class EditAccountButton extends StatelessWidget {
  const EditAccountButton({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 40,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                darkOrangeColor,
                sunglowColor,
              ],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            '更新する',
            style: TextStyles.buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
