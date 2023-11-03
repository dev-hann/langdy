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
            tabs: [
              Tab(text: "1:1 Class"),
              Tab(text: "Langdy Town"),
            ],
          ),
          Expanded(
            child: TabBarView(
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
