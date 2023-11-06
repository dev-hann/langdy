import 'package:flutter/material.dart';

enum PageType {
  home,
  booking,
  community,
  user,
}

class HomeProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void updatePageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  PageType _pageType = PageType.home;

  PageType get pageType => _pageType;

  void moveToPage(PageType value) {
    _pageType = value;
    notifyListeners();
  }
}
