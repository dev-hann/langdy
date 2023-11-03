import 'package:flutter/material.dart';
import 'package:langdy/enum/page_type.dart';
import 'package:langdy/provider/home_provider.dart';
import 'package:langdy/view/booking_view/booking_view.dart';
import 'package:langdy/view/community_view/community_view.dart';
import 'package:langdy/view/home_view/home_view.dart';
import 'package:langdy/view/user_view/user_view.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  BottomNavigationBar bottom({
    required int currentIndex,
    required Function(int index) onTap,
  }) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_add_rounded),
          label: "Booking",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: "Community",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "MY",
        ),
      ],
    );
  }

  Widget body({
    required PageType pageType,
  }) {
    switch (pageType) {
      case PageType.home:
        return const HomeView();
      case PageType.booking:
        return const BookingView();
      case PageType.community:
        return const CommunityView();
      case PageType.user:
        return const UserView();
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final pageType = homeProvider.pageType;
    return SafeArea(
      top: true,
      child: Scaffold(
        body: body(
          pageType: pageType,
        ),
        bottomNavigationBar: bottom(
          currentIndex: pageType.index,
          onTap: (index) {
            final pageType = PageType.values[index];
            homeProvider.moveToPage(pageType);
          },
        ),
      ),
    );
  }
}
