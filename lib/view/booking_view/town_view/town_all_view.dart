import 'package:flutter/material.dart';

class TownAllView extends StatelessWidget {
  const TownAllView({super.key});
  static PageRoute route() {
    return MaterialPageRoute(builder: (context) {
      return const TownAllView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("TownAllView");
  }
}
