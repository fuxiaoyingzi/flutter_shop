import 'package:flutter/material.dart';

class TabChangeProvider with ChangeNotifier {
  int currentIndex = 0;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
