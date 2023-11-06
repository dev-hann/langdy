import 'package:flutter/material.dart';
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
          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_add_rounded),
          label: "수업예약",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: "커뮤니티",
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Theme.of(context),
            home: Material(
              child: Builder(
                builder: (context) {
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
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final pageType = provider.pageType;
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        body: body(
          pageType: pageType,
        ),
        bottomNavigationBar: bottom(
          currentIndex: pageType.index,
          onTap: (index) {
            provider.moveToPage(PageType.values[index]);
          },
        ),
      ),
    );
  }
}
