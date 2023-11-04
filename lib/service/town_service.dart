import 'package:langdy/enum/language_type.dart';
import 'package:langdy/model/town.dart';
import 'package:langdy/model/town_banner.dart';
import 'package:langdy/model/town_item.dart';
import 'package:langdy/model/town_page.dart';

const _mockImageURL = "https://picsum.photos/200/300";

class TownService {
  Future requestTownPage(String userID) async {
    await Future.delayed(const Duration(seconds: 1));
    return TownPage(
      bannerList: const [
        TownBanner(
          image: _mockImageURL,
          target: "",
        ),
        TownBanner(
          image: _mockImageURL,
          target: "",
        ),
        TownBanner(
          image: _mockImageURL,
          target: "",
        )
      ],
      townList: [
        Town(
          title: "진실게임",
          itemList: List.generate(
            10,
            (index) {
              return TownItem(
                id: "$index",
                title: "흥미진진 수다시간(with 진실게임)",
                image: _mockImageURL,
                state: TownItemState.booking,
                languageType: LanguageType.values[index % 3],
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
          title: "줄줄이 말해요",
          itemList: List.generate(
            10,
            (index) {
              return TownItem(
                id: "$index",
                title: "스피디하게 쌓는 어휘력",
                image: _mockImageURL,
                state: TownItemState.booking,
                languageType: LanguageType.values[index % 3],
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
          title: "진행중인 비밀토크쇼",
          itemList: List.generate(
            10,
            (index) {
              return TownItem(
                id: "$index",
                title: "스피디하게 쌓는 어휘력",
                image: _mockImageURL,
                state: TownItemState.bookedUp,
                languageType: LanguageType.values[index % 3],
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
          title: "마감된 비밀토크쇼",
          itemList: List.generate(
            10,
            (index) {
              return TownItem(
                id: "$index",
                title: "Test Title$index",
                image: _mockImageURL,
                state: TownItemState.finished,
                languageType: LanguageType.values[index % 3],
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
          title: "마감된 랭디타운",
          itemList: List.generate(
            10,
            (index) {
              return TownItem(
                id: "$index",
                title: "수수께기로 쌓는 어휘량",
                image: _mockImageURL,
                state: TownItemState.finished,
                languageType: LanguageType.values[index % 3],
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
      ],
    ).toMap();
  }
}
