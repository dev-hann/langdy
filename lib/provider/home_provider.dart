import 'package:flutter/material.dart';
import 'package:langdy/enum/page_type.dart';
import 'package:langdy/widget/ticket_float_widget.dart';

class HomeProvider extends ChangeNotifier {
  PageType _pageType = PageType.home;

  PageType get pageType => _pageType;

  // FIXME: Need Refactoring..
  void moveToPage(PageType value) {
    _pageType = value;
    if (value == PageType.community) {
      _ticketVisibility = TicketVisibility.hide;
    } else {
      _ticketVisibility = TicketVisibility.show;
    }
    notifyListeners();
  }

  TicketVisibility _ticketVisibility = TicketVisibility.show;

  TicketVisibility get ticketVisibility => _ticketVisibility;

  void hideTicket() {
    _ticketVisibility = TicketVisibility.hide;
    notifyListeners();
  }

  void showTicket() {
    if (pageType == PageType.community) {
      return;
    }
    _ticketVisibility = TicketVisibility.show;
    notifyListeners();
  }

  TicketMode _ticketMode = TicketMode.normal;
  TicketMode get ticketMode => _ticketMode;

  bool _overlayTicket = false;
  bool get isOverlayTicket => _overlayTicket;
  void showTicketOverlay() {
    _overlayTicket = true;
    notifyListeners();
  }

  void hideOverlayTicket() {
    _overlayTicket = false;
    notifyListeners();
  }
}
