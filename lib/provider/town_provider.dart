import 'package:flutter/material.dart';
import 'package:langdy/enum/language_type.dart';
import 'package:langdy/model/town.dart';
import 'package:langdy/model/town_banner.dart';
import 'package:langdy/model/town_item.dart';
import 'package:langdy/model/town_page.dart';

class TownProvider extends ChangeNotifier {
  TownPage? _townPage = TownPage(
    bannerList: [
      TownBanner(
        image: "https://picsum.photos/200/300",
        target: "",
      ),
      TownBanner(
        image: "https://picsum.photos/200/300",
        target: "",
      ),
      TownBanner(
        image: "https://picsum.photos/200/300",
        target: "",
      )
    ],
    townList: [
      Town(
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
      Town(
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
      )
    ],
  );

  TownPage get townPage => _townPage!;
}
