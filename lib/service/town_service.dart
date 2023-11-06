import 'dart:math';

import 'package:langdy/enum/language_type.dart';
import 'package:langdy/model/custom_error.dart';
import 'package:langdy/model/town.dart';
import 'package:langdy/model/town_banner.dart';
import 'package:langdy/model/town_comment.dart';
import 'package:langdy/model/town_class_detail.dart';
import 'package:langdy/model/town_class.dart';
import 'package:langdy/model/town_page.dart';

class TownService {
  TownService() {
    initTestData();
  }
  String get _mockImageURL =>
      "https://picsum.photos/id/${Random().nextInt(20)}/200/300";
  String get _mockIndex => DateTime.now().millisecondsSinceEpoch.toString();

  final List<Town> _mockTownList = [];
  void initTestData() {
    if (_mockTownList.isNotEmpty) {
      return;
    }
    _mockTownList.addAll([
      Town(
        id: "01",
        title: "진실게임",
        bannerImage: _mockImageURL,
        classList: List.generate(
          10,
          (index) {
            return TownClass(
              id: _mockIndex,
              title: "흥미진진 수다시간(with 진실게임)",
              bannerImage: _mockImageURL,
              state: TownClassState.booking,
              languageType: LanguageType.values[index % 3],
              scheduleList: List.generate(3, (index) {
                return TownClassSchedule(
                  id: _mockIndex,
                  beginDateTime: DateTime.now().add(Duration(days: index)),
                  endDatetime: DateTime.now()
                      .add(Duration(days: index, hours: index + 1)),
                  maxiumUserCount: 30,
                  currentUserCount: index * 9,
                );
              }),
              price: 0,
              level: "level$index",
            );
          },
        ),
      ),
      Town(
        id: "02",
        title: "줄줄이 말해요",
        bannerImage: _mockImageURL,
        classList: List.generate(
          10,
          (index) {
            return TownClass(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: "스피디하게 쌓는 어휘력",
              bannerImage: _mockImageURL,
              state: TownClassState.booking,
              languageType: LanguageType.values[index % 3],
              scheduleList: List.generate(3, (index) {
                return TownClassSchedule(
                  id: _mockIndex,
                  beginDateTime: DateTime.now().add(Duration(days: index)),
                  endDatetime: DateTime.now()
                      .add(Duration(days: index, hours: index + 1)),
                  maxiumUserCount: 30,
                  currentUserCount: index * 9,
                );
              }),
              price: 0,
              level: "level$index",
            );
          },
        ),
      ),
      Town(
        id: "03",
        title: "진행중인 비밀토크쇼",
        bannerImage: _mockImageURL,
        classList: List.generate(
          10,
          (index) {
            return TownClass(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: "스피디하게 쌓는 어휘력",
              bannerImage: _mockImageURL,
              state: TownClassState.bookedUp,
              languageType: LanguageType.values[index % 3],
              scheduleList: List.generate(3, (index) {
                return TownClassSchedule(
                  id: _mockIndex,
                  beginDateTime: DateTime.now().add(Duration(days: index)),
                  endDatetime: DateTime.now()
                      .add(Duration(days: index, hours: index + 1)),
                  maxiumUserCount: 30,
                  currentUserCount: index * 9,
                );
              }),
              price: 0,
              level: "level$index",
            );
          },
        ),
      ),
      Town(
        id: "04",
        title: "마감된 비밀토크쇼",
        bannerImage: _mockImageURL,
        classList: List.generate(
          10,
          (index) {
            return TownClass(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: "Test Title$index",
              bannerImage: _mockImageURL,
              state: TownClassState.finished,
              languageType: LanguageType.values[index % 3],
              scheduleList: List.generate(3, (index) {
                return TownClassSchedule(
                  id: _mockIndex,
                  beginDateTime: DateTime.now().add(Duration(days: index)),
                  endDatetime: DateTime.now()
                      .add(Duration(days: index, hours: index + 1)),
                  maxiumUserCount: 30,
                  currentUserCount: index * 9,
                );
              }),
              price: 0,
              level: "level$index",
            );
          },
        ),
      ),
      Town(
        id: "05",
        title: "마감된 랭디타운",
        bannerImage: _mockImageURL,
        classList: List.generate(
          10,
          (index) {
            return TownClass(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: "수수께기로 쌓는 어휘량",
              bannerImage: _mockImageURL,
              state: TownClassState.finished,
              languageType: LanguageType.values[index % 3],
              scheduleList: List.generate(3, (index) {
                return TownClassSchedule(
                  id: _mockIndex,
                  beginDateTime: DateTime.now().add(Duration(days: index)),
                  endDatetime: DateTime.now()
                      .add(Duration(days: index, hours: index + 1)),
                  maxiumUserCount: 30,
                  currentUserCount: index * 9,
                );
              }),
              price: 0,
              level: "level$index",
            );
          },
        ),
      ),
    ]);
  }

  Future requestTownPage(String userID) async {
    await Future.delayed(const Duration(seconds: 1));
    return TownPage(
      bannerList: [
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
      townList: _mockTownList,
    ).toMap();
  }

  Future requestTownClassDetail({
    required String userID,
    required String townClassID,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    TownClass? townItem;
    for (final town in _mockTownList) {
      final list = town.classList.where((element) => element.id == townClassID);
      if (list.isNotEmpty) {
        townItem = list.first;
      }
    }
    if (townItem == null) {
      throw CustomError.emptyData();
    }
    return TownClassDetail.fromTownItem(
      townItem,
      commentList: List.generate(50, (index) {
        return TownComment(
          userName: "TestName$index",
          image: _mockImageURL,
          dateTime: DateTime.now(),
          title: "TestTitle$index",
          comment: 'Testcomment' * index,
        );
      }),
    ).toMap();
  }

  Future requestBookingSchedule({
    required String townClassID,
    required String scheduleID,
  }) async {
    TownClass? townItem;
    for (final town in _mockTownList) {
      final list = town.classList.where((element) => element.id == townClassID);
      if (list.isNotEmpty) {
        townItem = list.first;
      }
    }
    if (townItem == null) {
      throw CustomError.emptyData();
    }

    return true;
  }
}
