import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../Globals/colors.dart';
import '../Widgets/Homepage/Band/band.dart';
import '../Widgets/Homepage/SocialIcons/social_icons.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  static const routeName = "/home";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin, AppColors {
  // Timer? flickerTimer;

  late AnimationController flickerAnimationController;
  Animation<Color?>? flicker;

  late AnimationController bandAnimationController;
  Animation<double>? movement;
  Animation<double>? height;

  flickerAnimation({required AnimationController controller}) async {
    await controller.forward();
    await controller.reverse();
  }

  @override
  void initState() {
    flickerAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 80));
    flickerAnimationController.addListener(() => setState(() {}));
    flicker = ColorTween(begin: black, end: white).animate(flickerAnimationController);

    bandAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 10000));
    bandAnimationController.addListener(() => setState(() {}));
    movement = Tween<double>(begin: 0, end: -100).animate(CurvedAnimation(parent: bandAnimationController, curve: Curves.ease));
    height = Tween<double>(begin: 20, end: 80).animate(CurvedAnimation(parent: bandAnimationController, curve: Curves.ease));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      bandAnimationController.repeat(reverse: true);
    });

    super.initState();
  }

  @override
  void dispose() {
    flickerAnimationController.dispose();
    bandAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        flickerAnimation(controller: flickerAnimationController);
      },
      child: Scaffold(
        backgroundColor: flickerAnimationController.isDismissed ? mainTheme1 : (flicker?.value ?? mainTheme1),
        body: Stack(
          children: [
            Align(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText(
                    flickerAnimationController.isAnimating ? "YAHFFA S JAGRUP" : "YSJ",
                    style: TextStyle(
                      color: flickerAnimationController.isAnimating ? black : white,
                      fontSize: size.width * 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AutoSizeText(
                    "Flutter Demo",
                    style: TextStyle(
                      color: flickerAnimationController.isAnimating ? black : white,
                      fontSize: size.width * 0.01,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: movement?.value ?? 0,
              left: -300,
              child: Band(
                size: size,
                altHeight: height?.value ?? 20,
                externalAnimationController: flickerAnimationController,
              ),
            ),
            Positioned(
              top: 40,
              left: -300,
              child: Band(
                size: size,
                externalAnimationController: flickerAnimationController,
              ),
            ),
            Positioned(
              // bottom: 0,
              bottom: movement?.value ?? 0,
              right: -300,
              child: Band(
                size: size,
                fadeOut: true,
                altHeight: height?.value ?? 20,
                externalAnimationController: flickerAnimationController,
              ),
            ),
            Positioned(
              bottom: 40,
              right: -300,
              child: Band(
                fadeOut: true,
                externalAnimationController: flickerAnimationController,
                size: size,
              ),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: SocialIcons(
                size: size,
                externalAnimationController: flickerAnimationController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
