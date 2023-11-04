import 'package:flutter/material.dart';
import 'package:langdy/enum/language_type.dart';
import 'package:langdy/model/town.dart';
import 'package:langdy/model/town_banner.dart';
import 'package:langdy/model/town_item.dart';
import 'package:langdy/view/booking_view/town_view/town_all_view.dart';
import 'package:langdy/view/booking_view/town_view/town_detail_view.dart';
import 'package:langdy/widget/town_banner_widget.dart';
import 'package:langdy/widget/town_horizontal_list_view.dart';

class TownView extends StatelessWidget {
  const TownView({super.key});

  Widget bannerPhotoListView() {
    return TownBannerWidget(
      itemList: const [
        TownBanner(
          image: "https://picsum.photos/200/300",
          target: "",
        ),
      ],
      onTapBanner: (item) {},
    );
  }

  Widget townListview({
    required Town town,
    required Function(TownItem item) onTapTown,
    required VoidCallback onTapAllView,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TownHorizontalListView(
        title: town.title,
        townItemList: town.itemList,
        onTapTown: onTapTown,
        onTapAllView: onTapAllView,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        bannerPhotoListView(),
        townListview(
          town: Town(
            title: "TRUTH OR DARE",
            itemList: List.generate(
              10,
              (index) {
                return TownItem(
                  id: "$index",
                  title: "TestTitle$index" * (index + 1),
                  image: "https://picsum.photos/200/300",
                  state: TownItemState.booking,
                  languageType: LanguageType.en,
                  dateTimeList: [
                    DateTime.now(),
                    DateTime.now().add(const Duration(days: 1)),
                  ],
                  price: 0,
                  level: "level$index",
                  maxiumUserCount: 10,
                  currentUserCount: index,
                );
              },
            ),
          ),
          onTapTown: (item) {
            Navigator.of(context).push(
              TownDetailView.route(),
            );
          },
          onTapAllView: () {
            Navigator.of(context).push(
              TownAllView.route(),
            );
          },
        ),
        townListview(
          town: Town(
            title: "TRUTH OR DARE",
            itemList: List.generate(
              10,
              (index) {
                return TownItem(
                  id: "$index",
                  title: "TestTitle$index" * (index + 1),
                  image: "https://picsum.photos/200/300",
                  state: TownItemState.bookedUp,
                  languageType: LanguageType.en,
                  dateTimeList: [
                    DateTime.now(),
                    DateTime.now().add(const Duration(days: 1)),
                  ],
                  price: 0,
                  level: "level$index",
                  maxiumUserCount: 10,
                  currentUserCount: index,
                );
              },
            ),
          ),
          onTapTown: (item) {
            Navigator.of(context).push(
              TownDetailView.route(),
            );
          },
          onTapAllView: () {
            Navigator.of(context).push(
              TownAllView.route(),
            );
          },
        ),
        townListview(
          town: Town(
            title: "TRUTH OR DARE",
            itemList: List.generate(
              10,
              (index) {
                return TownItem(
                  id: "$index",
                  title: "TestTitle$index" * (index + 1),
                  image: "https://picsum.photos/200/300",
                  state: TownItemState.finished,
                  languageType: LanguageType.en,
                  dateTimeList: [
                    DateTime.now(),
                    DateTime.now().add(const Duration(days: 1)),
                  ],
                  price: 0,
                  level: "level$index",
                  maxiumUserCount: 10,
                  currentUserCount: index,
                );
              },
            ),
          ),
          onTapTown: (item) {
            Navigator.of(context).push(
              TownDetailView.route(),
            );
          },
          onTapAllView: () {
            Navigator.of(context).push(
              TownAllView.route(),
            );
          },
        )
      ],
    );
  }
}
