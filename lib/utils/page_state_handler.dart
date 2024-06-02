import 'package:flutter/material.dart';

class PageStateHandler extends ChangeNotifier {
  int page = 0;

  int get currentPage => page;

  void gotoPage(int destinationIndex) {
    page = destinationIndex;
    notifyListeners();
  }
}
