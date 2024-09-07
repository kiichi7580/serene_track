import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/themes/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });
  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 48,
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
          child: Text(
            buttonText,
            style: TextStyles.buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
