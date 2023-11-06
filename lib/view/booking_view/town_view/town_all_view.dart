import 'package:flutter/material.dart';
import 'package:langdy/model/town_class.dart';
import 'package:langdy/widget/town_item_card.dart';

class TownAllView extends StatelessWidget {
  const TownAllView({
    super.key,
    required this.classList,
  });
  final List<TownClass> classList;
  static PageRoute route({
    required List<TownClass> classList,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return TownAllView(
          classList: classList,
        );
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("전체보기"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: GridView.count(
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        children: [
          for (final item in classList) TownClassCard(item: item),
        ],
      ),
    );
  }
}
