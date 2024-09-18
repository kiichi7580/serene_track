import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:serene_track/view/montring_page/provider/show_break_promotion_dialog_notifier.dart';

class CustomConfettiWidget extends ConsumerWidget {
  const CustomConfettiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final confettiController = ref.watch(showBreakPromotionDialogProvider
        .select((value) => value.confettiController));
    return ConfettiWidget(
      confettiController: confettiController!,
      blastDirectionality: BlastDirectionality.directional,
      blastDirection: pi / 2,
      emissionFrequency: 1,
      numberOfParticles: 20,
      shouldLoop: false,
      maxBlastForce: 5,
      minBlastForce: 2,
      displayTarget: true,
      colors: const [Colors.green, Colors.pink, Colors.orange, Colors.blue],
      maximumSize: const Size(40, 40),
      minimumSize: const Size(20, 20),
      gravity: 0.3,
      particleDrag: 0.001,
      // canvas: Size(100, 100),
      // createParticlePath: drawStar,
    );
  }

  // Path drawStar(Size size) {
  //   // Method to convert degree to radians
  //   double degToRad(double deg) => deg * (pi / 180.0);

  //   const numberOfPoints = 5;
  //   final halfWidth = size.width / 2;
  //   final externalRadius = halfWidth;
  //   final internalRadius = halfWidth / 2.5;
  //   final degreesPerStep = degToRad(360 / numberOfPoints);
  //   final halfDegreesPerStep = degreesPerStep / 2;
  //   final path = Path();
  //   final fullAngle = degToRad(360);
  //   path.moveTo(size.width, halfWidth);

  //   for (double step = 0; step < fullAngle; step += degreesPerStep) {
  //     path.lineTo(halfWidth + externalRadius * cos(step),
  //         halfWidth + externalRadius * sin(step));
  //     path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
  //         halfWidth + internalRadius * sin(step + halfDegreesPerStep));
  //   }
  //   path.close();
  //   return path;
  // }
}
