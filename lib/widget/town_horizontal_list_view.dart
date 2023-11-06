import 'package:flutter/material.dart';
import 'package:langdy/model/town_class.dart';
import 'package:langdy/widget/town_class_card.dart';

class TownHorizontalListView extends StatelessWidget {
  const TownHorizontalListView({
    super.key,
    required this.title,
    required this.classList,
    required this.onTapAllView,
    required this.onTapTown,
  });
  final String title;
  final List<TownClass> classList;
  final VoidCallback onTapAllView;
  final Function(TownClass item) onTapTown;

  Widget titleWidget() {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            GestureDetector(
              onTap: onTapAllView,
              child: const Text("전체보기"),
            ),
          ],
        );
      },
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
                for (final item in classList)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        onTapTown(item);
                      },
                      child: TownClassCard(
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
