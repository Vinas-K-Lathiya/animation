import 'package:animation/thememodel.dart';
import 'package:flutter/material.dart';

class themeprovider extends ChangeNotifier {
  thememodel theme3 = thememodel(isdark: true);
  void changetheme() {
    theme3.isdark = !theme3.isdark;
    notifyListeners();
  }
}
