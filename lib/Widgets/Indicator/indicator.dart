import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Globals/colors.dart';
import '../../Providers/GeneralProvider/State/general_provider.dart';

class Indicator extends StatelessWidget with AppColors {
  Indicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Align(
        child: Consumer<GeneralProvider>(
          builder: (context, gp, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 2; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  curve: Curves.fastOutSlowIn,
                  height: 10,
                  width: gp.currentPageIndex == i ? 30 : 10,
                  decoration: BoxDecoration(
                    color: gp.currentPageIndex == i ? white : white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
