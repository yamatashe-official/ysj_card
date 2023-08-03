import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Pages/Aboutpage.dart';
import 'Pages/Gyrologopage.dart';
import 'Pages/Homepage.dart';
import 'Providers/GeneralProvider/State/general_provider.dart';
import 'Widgets/PageWrapper/page_content_wrapper.dart';
import 'Widgets/PageWrapper/page_wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([
    // DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => GeneralProvider()),
    ],
    child: const MainApp(),
  ));
  // runApp(const MainApp());
  GestureBinding.instance.resamplingEnabled = true;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageContentWrapper(child: PageWrapper()),
      onGenerateRoute: generateRoute,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Homepage.routeName:
        return MaterialPageRoute(builder: (ctx) => const Homepage());
      case AboutMePage.routeName:
        return MaterialPageRoute(builder: (ctx) => const AboutMePage());
      case GyroLogoPage.routeName:
        return MaterialPageRoute(builder: (ctx) => const GyroLogoPage());

      default:
        return MaterialPageRoute(builder: (_) => const Homepage());
    }
  }
}
