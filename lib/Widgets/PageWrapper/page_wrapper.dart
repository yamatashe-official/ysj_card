import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Pages/Aboutpage.dart';
// import '../../Pages/Gyrologopage.dart';
import '../../Pages/Homepage.dart';
import '../../Providers/GeneralProvider/State/general_provider.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GeneralProvider>(
        builder: (context, gp, child) => PageView(
          physics: const BouncingScrollPhysics(),
          onPageChanged: (value) => gp.setCurrentPageIndex = value,
          children: const [
            Homepage(),
            AboutMePage(),
            // GyroLogoPage(),
          ],
        ),
      ),
    );
  }
}
