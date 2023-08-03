import 'package:flutter/material.dart';
import '../Globals/colors.dart';
import '../Widgets/Aboutme/AboutUsDescription/about_us_description.dart';
import '../Widgets/Aboutme/DecorCircle/decor_circle.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});
  static const routeName = '/about-me';

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> with SingleTickerProviderStateMixin, AppColors {
  late AnimationController circleController;
  Animation<double>? scaleUp;
  Animation<double>? borderThickness;

  @override
  void initState() {
    circleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 10000));
    circleController.addListener(() => setState(() {}));
    scaleUp = Tween<double>(begin: 120, end: 135).animate(CurvedAnimation(parent: circleController, curve: Curves.ease));
    borderThickness = Tween<double>(begin: 5, end: 10).animate(CurvedAnimation(parent: circleController, curve: Curves.ease));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      circleController.repeat(reverse: true);
    });

    super.initState();
  }

  @override
  void dispose() {
    circleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: backgroundColor?.value ?? mainTheme1,
        backgroundColor: black,
        body: Stack(
          children: [
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AboutUsDescription(
                    size: size,
                    title: "Technologies",
                    body:
                        "Node.Js, Flutter, Dart, Python, Javascript, Firebase, MongoDb, SQL, SQLight, HTML, CSS, Java, React, React Native, Angular, Vue, Express, Django, Flask, Git, Github, Docker, AWS, Azure, Google Cloud, Heroku, Linux, Windows, MacOS, Android, iOS, Figma, Adobe XD, REST, GraphQL.",
                  ),
                  AboutUsDescription(
                    size: size,
                    title: "Paradigms",
                    body:
                        "Front-end, Back-end, Mobile, Web, Full Stack, Object Oriented Programming, Functional Programming, Data Structures, Algorithms, Design Patterns, Test Driven Development, Agile, Scrum, DevOps, CI/CD, OOP, Video Editing, Music Production, Graphic Design, UI/UX Design, Overall Leader.",
                  ),
                  AboutUsDescription(
                    size: size,
                    title: "About Me",
                    body:
                        "Experienced full stack developer with a strong track record in designing and implementing robust applications. Skilled in both front-end and back-end development, I specialize in creating intuitive and visually appealing applications that deliver seamless user experiences while serving a need. ",
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -30,
              right: -30,
              child: DecorCircle(
                scaleUp: scaleUp,
                borderThickness: borderThickness,
                color: white.withOpacity(0.2),
              ),
            ),
            Positioned(
              top: -30,
              left: -30,
              child: DecorCircle(
                scaleUp: scaleUp,
                borderThickness: borderThickness,
                color: white.withOpacity(0.2),
              ),
            ),
            Positioned(
              bottom: size.height * 0.1,
              left: size.width * 0.3,
              child: DecorCircle(
                scaleUp: scaleUp,
                borderThickness: borderThickness,
                color: white.withOpacity(0.2),
              ),
            ),
            Positioned(
              top: size.height * 0.1,
              right: size.width * 0.3,
              child: DecorCircle(
                scaleUp: scaleUp,
                borderThickness: borderThickness,
                color: white.withOpacity(0.2),
              ),
            ),
          ],
        ));
  }
}
