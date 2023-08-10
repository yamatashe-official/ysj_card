import 'package:flutter/material.dart';

class GeneralProvider with ChangeNotifier {
  int currentPageIndex = 0;

  set setCurrentPageIndex(int index) {
    currentPageIndex = index;
    notifyListeners();
  }
}
