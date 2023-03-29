import 'package:flutter/material.dart';

class PhotoProvider extends ChangeNotifier {
  int i = 0;
  int photoi = 0;
  int bari = 0;

  List imageList = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
  ];

  void selectIndex(int index) {
    i = index;
    notifyListeners();
  }

  void changeIndex(int index) {
    photoi = index;
    notifyListeners();
  }

  void barIndex(int index) {
    bari = index;
    notifyListeners();
  }
}
