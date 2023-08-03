import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../Globals/colors.dart';

class AboutUsDescription extends StatefulWidget {
  AboutUsDescription({
    super.key,
    required this.size,
    this.title,
    this.body,
  });

  final Size size;
  final String? title;
  final String? body;

  @override
  State<AboutUsDescription> createState() => _AboutUsDescriptionState();
}

class _AboutUsDescriptionState extends State<AboutUsDescription> with AppColors {
  bool tapped = false;
  Duration tapDuration = const Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() => tapped = true);
        await Future.delayed(tapDuration);
        setState(() => tapped = false);
      },
      child: AnimatedScale(
        duration: tapDuration,
        scale: tapped ? 1.015 : 1,
        child: SizedBox(
          width: widget.size.width * 0.27,
          height: widget.size.height * 0.75,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    widget.title ?? "No Title Provided",
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: widget.size.width * 0.03,
                    ),
                  ),
                ),
                Divider(
                  color: white,
                  height: 20,
                  thickness: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    widget.body ?? "No Body Provided",
                    minFontSize: 5,
                    maxFontSize: 14,
                    style: TextStyle(
                      color: white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
