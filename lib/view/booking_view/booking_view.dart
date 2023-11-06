import 'package:flutter/material.dart';
import 'package:langdy/view/booking_view/study_view/study_view.dart';
import 'package:langdy/view/booking_view/town_view/town_view.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      animationDuration: Duration.zero,
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.orangeAccent,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.orangeAccent,
            tabs: [
              Tab(text: "1:1 수업"),
              Tab(text: "20인 실전 랭디타운"),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                StudyView(),
                TownView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
