import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Globals/colors.dart';
import '../../../Globals/icons.dart';
import '../TapIcon/tap_icon.dart';

class SocialIcons extends StatelessWidget with AppColors, LinkedinIcon, InternetIcon {
  SocialIcons({
    super.key,
    required this.size,
    required this.externalAnimationController,
  });

  final Size size;
  final AnimationController externalAnimationController;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            // GestureDetector(
            //   onTap: () async {
            //     await launchUrl(Uri(scheme: "tel", path: "+my number - lol - not putting this on github"));
            //   },
            //   child: TapIcon(
            //     icon: phoneIcon,
            //     color: externalAnimationController.isAnimating ? black : white,
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () async {
            //     await launchUrl(Uri(scheme: "mailto", path: "my email - lol - not putting this on github"));
            //   },
            //   child: TapIcon(
            //     icon: emailIcon,
            //     color: externalAnimationController.isAnimating ? black : white,
            //   ),
            // ),
            GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse("https://www.yahffasjagrup.com/"));
              },
              child: TapIcon(
                icon: internetIcon,
                color: externalAnimationController.isAnimating ? black : white,
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse("https://www.linkedin.com/in/yahffa-jagrup-31460b16a/"));
              },
              child: TapIcon(
                icon: linkedinIcon,
                color: externalAnimationController.isAnimating ? black : white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
