import 'package:flutter/material.dart';

class PageStateHandler extends ChangeNotifier {
  int page = 0;

  int get currentPage => page;

  void gotoPage(int destinationIndex) {
    page = destinationIndex;
    notifyListeners();
  }
}

class TabStateHandler extends ChangeNotifier {
  int tab = 0;

  int get currentPage => tab;

  void slideToPage(int destinationIndex) {
    tab = destinationIndex;
    notifyListeners();
  }
}