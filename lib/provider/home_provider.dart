import 'package:flutter/material.dart';
import 'package:langdy/enum/page_type.dart';

class HomeProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void updatePageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }

  PageType _pageType = PageType.home;

  PageType get pageType => _pageType;

  // FIXME: Need Refactoring..
  void moveToPage(PageType value) {
    _pageType = value;
    notifyListeners();
  }
}
