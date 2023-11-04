import 'package:flutter/material.dart';

class TownDetailView extends StatelessWidget {
  const TownDetailView({super.key});

  static PageRoute route() {
    return MaterialPageRoute(builder: (context) {
      return const TownDetailView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Text("TownDetailView");
  }
}
