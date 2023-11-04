import 'package:flutter/material.dart';
import 'package:langdy/model/town_item.dart';
import 'package:langdy/widget/town_item_card.dart';

class TownHorizontalListView extends StatelessWidget {
  const TownHorizontalListView({
    super.key,
    required this.title,
    required this.townItemList,
    required this.onTapAllView,
    required this.onTapTown,
  });
  final String title;
  final List<TownItem> townItemList;
  final VoidCallback onTapAllView;
  final Function(TownItem item) onTapTown;

  Widget titleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        GestureDetector(
          onTap: onTapAllView,
          child: const Text("detail"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.0),
        ),
      ),
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: titleWidget(),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final item in townItemList)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        onTapTown(item);
                      },
                      child: TownItemCard(
                        item: item,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16.0)
        ],
      ),
    );
  }
}