import 'package:flutter/material.dart';

class QueNumProvider extends ChangeNotifier {
  int queNum = 0;
  int queCount = 0;
  void nextQuestion() {
    if (queNum > 0 && queNum < queCount) {
      queNum++;
      notifyListeners();
    }
  }

  void prevQuestion() {
    if (queNum > 1 && queNum <= queCount) {
      queNum--;
      notifyListeners();
    }
  }
}
