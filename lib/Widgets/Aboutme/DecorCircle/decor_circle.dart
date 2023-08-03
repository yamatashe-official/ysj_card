import 'package:flutter/material.dart';
import '../../../Globals/colors.dart';

class DecorCircle extends StatelessWidget with AppColors {
  DecorCircle({
    super.key,
    required this.scaleUp,
    required this.borderThickness,
    this.color,
  });

  final Animation<double>? borderThickness;
  final Animation<double>? scaleUp;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scaleUp?.value ?? 120,
      height: scaleUp?.value ?? 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color ?? white.withOpacity(1), width: borderThickness?.value ?? 5),
      ),
    );
  }
}
