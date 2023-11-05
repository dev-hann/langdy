import 'package:flutter/material.dart';
import 'package:langdy/model/town_item.dart';
import 'package:langdy/widget/town_item_card.dart';

class TownAllView extends StatelessWidget {
  const TownAllView({
    super.key,
    required this.itemList,
  });
  final List<TownItem> itemList;
  static PageRoute route({
    required List<TownItem> itemList,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return TownAllView(
          itemList: itemList,
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
          for (final item in itemList) TownItemCard(item: item),
        ],
      ),
    );
  }
}
