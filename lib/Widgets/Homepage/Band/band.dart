import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Globals/colors.dart';
import '../../../Providers/GeneralProvider/State/general_provider.dart';

class Band extends StatelessWidget with AppColors {
  Band({
    super.key,
    required this.size,
    required this.externalAnimationController,
    this.altHeight,
    this.fadeOut,
  });

  final Size size;
  final AnimationController externalAnimationController;
  final double? altHeight;
  final bool? fadeOut;

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(
      builder: (context, gp, child) => AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: fadeOut == true
            ? gp.currentPageIndex == 0
                ? 1
                : 0
            : 1,
        child: Transform.rotate(
          angle: (pi / 180 * 45) * -1,
          child: Container(
            width: size.width,
            height: altHeight ?? 20,
            color: externalAnimationController.isDismissed ? white : black,
          ),
        ),
      ),
    );
  }
}
