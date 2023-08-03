import 'package:flutter/material.dart';

import '../Indicator/indicator.dart';

class PageContentWrapper extends StatelessWidget {
  const PageContentWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        child,
        Indicator(),
      ],
    ));
  }
}
