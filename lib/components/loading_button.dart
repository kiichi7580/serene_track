import 'package:flutter/material.dart';
import 'package:serene_track/constant/colors.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 64,
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
        child: const CircularProgressIndicator(
          color: backGroundColor,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
