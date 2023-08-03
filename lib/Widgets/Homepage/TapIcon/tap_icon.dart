import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Globals/colors.dart';
import '../../../Globals/icons.dart';

class TapIcon extends StatelessWidget with WarningIcon, AppColors {
  TapIcon({
    super.key,
    this.icon,
    this.color,
  });

  final String? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: 50,
        height: constraints.biggest.height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.symmetric(
            horizontal: BorderSide(color: color ?? white, width: 2),
            vertical: BorderSide(color: color ?? white, width: 2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            icon ?? warningIcon,
            // theme: SvgTheme(
            //   currentColor: color ?? Colors.white,
            //   fontSize: 10,
            // ),
            color: color ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
