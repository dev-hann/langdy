import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:langdy/enum/page_type.dart';
import 'package:langdy/provider/home_provider.dart';
import 'package:langdy/view/booking_view/booking_view.dart';
import 'package:langdy/view/community_view/community_view.dart';
import 'package:langdy/view/home_view/home_view.dart';
import 'package:langdy/view/user_view/user_view.dart';
import 'package:langdy/widget/ticket_float_widget.dart';
import 'package:langdy/widget/ticket_overlay.dart';
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

  Widget ticketOverlay({
    required bool isOverlay,
    required VoidCallback onTapDismiss,
  }) {
    if (!isOverlay) {
      return const SizedBox();
    }

    return TicketOverlay(
      onTapDismiss: onTapDismiss,
    );
  }

  Widget body({
    required PageType pageType,
  }) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.name,
      // routes: {
      // TownDetailView.name: (_) => const TownDetailView(),
      // },
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final pageType = provider.pageType;
    return SafeArea(
      top: true,
      child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final dicrection = notification.direction;
          switch (dicrection) {
            case ScrollDirection.idle:
              return true;
            case ScrollDirection.forward:
              provider.showTicket();
              return true;
            case ScrollDirection.reverse:
              provider.hideTicket();
              return true;
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              body(pageType: pageType),
              Align(
                alignment: Alignment.bottomCenter,
                child: TicketFloatWidget(
                  onTap: () {
                    provider.showTicketOverlay();
                  },
                  ticketVisibility: provider.ticketVisibility,
                  ticketMode: provider.ticketMode,
                ),
              ),
              ticketOverlay(
                isOverlay: provider.isOverlayTicket,
                onTapDismiss: () {
                  provider.hideOverlayTicket();
                },
              ),
            ],
          ),
          bottomNavigationBar: bottom(
            currentIndex: provider.pageType.index,
            onTap: (index) {
              provider.moveToPage(PageType.values[index]);
              // provider.updatePageIndex(index);

              // final pageList = [
              //   HomeView.name,
              //   BookingView.name,
              //   CommunityView.name,
              //   UserView.name,
              // ];
              // print(pageList[index]);
              // Navigator.pushNamed(context, pageList[index]);
              // final pageType = PageType.values[index];
              // provider.moveToPage(pageType);
            },
          ),
        ),
      ),
    );
  }
}
