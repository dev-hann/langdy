// only for test.
import 'dart:math';

import 'package:langdy/enum/language_type.dart';
import 'package:langdy/model/custom_response.dart';
import 'package:langdy/model/town.dart';
import 'package:langdy/model/town_banner.dart';
import 'package:langdy/model/town_class.dart';
import 'package:langdy/model/town_class_detail.dart';
import 'package:langdy/model/town_class_schedule.dart';
import 'package:langdy/model/town_comment.dart';
import 'package:langdy/model/town_page.dart';

class TownTestServer {
  TownTestServer._() {
    initTestData();
  }
  static TownTestServer? _instance;
  static TownTestServer get instance {
    return _instance ??= TownTestServer._();
  }

  String get _mockImageURL =>
      "https://picsum.photos/id/${Random().nextInt(20)}/200/300";
  String get _mockIndex => Random().nextInt(99999999).toString();

  final List<Town> _mockTownList = [];
  final List<TownComment> _mockCommentList = [];
  void initTestData() {
    if (_mockTownList.isNotEmpty) {
      return;
    }
    _mockCommentList.addAll(List.generate(50, (index) {
      return TownComment(
        userName: "TestName$index",
        image: _mockImageURL,
        dateTime: DateTime.now(),
        title: "TestTitle$index",
        comment: 'Testcomment' * index,
      );
    }));
    _mockTownList.addAll([
      Town(
        id: "01",
        title: "진실게임",
        bannerImage: _mockImageURL,
        classList: List.generate(
          3,
          (index) {
            return TownClass(
              id: _mockIndex,
              title: "흥미진진 수다시간(with 진실게임)",
              bannerImage: _mockImageURL,
              // state: TownClassState.booking,
              languageType: LanguageType.values[index % 3],
              scheduleList: List.generate(2, (index) {
                return TownClassSchedule(
                  id: _mockIndex,
                  beginDateTime: DateTime.now().add(Duration(days: index)),
                  endDatetime: DateTime.now()
                      .add(Duration(days: index, hours: index + 1)),
                  maxiumUserCount: 10,
                  currentUserIDList: List.generate(9, (index) => _mockIndex),
                );
              }),
              price: 0,
              level: "level$index",
            );
          },
        ),
      ),
      Town(
        id: "Error",
        title: "에러 발생 항목",
        bannerImage: _mockImageURL,
        classList: List.generate(
          3,
          (index) {
            return TownClass(
              id: "Error",
              title: "흥미진진 수다시간(with 진실게임)",
              bannerImage: _mockImageURL,
              // state: TownClassState.booking,
              languageType: LanguageType.values[index % 3],
              scheduleList: List.generate(2, (index) {
                return TownClassSchedule(
                  id: _mockIndex,
                  beginDateTime: DateTime.now().add(Duration(days: index)),
                  endDatetime: DateTime.now()
                      .add(Duration(days: index, hours: index + 1)),
                  maxiumUserCount: 10,
                  currentUserIDList: List.generate(9, (index) => _mockIndex),
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
              // state: TownClassState.booking,
              languageType: LanguageType.values[index % 3],
              scheduleList: List.generate(3, (index) {
                return TownClassSchedule(
                  id: _mockIndex,
                  beginDateTime: DateTime.now().add(Duration(days: index)),
                  endDatetime: DateTime.now()
                      .add(Duration(days: index, hours: index + 1)),
                  maxiumUserCount: 30,
                  currentUserIDList:
                      List.generate(index * 9, (index) => _mockIndex),
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
              // state: TownClassState.bookedUp,
              languageType: LanguageType.values[index % 3],
              scheduleList: List.generate(3, (index) {
                return TownClassSchedule(
                  id: _mockIndex,
                  beginDateTime: DateTime.now().add(Duration(days: index)),
                  endDatetime: DateTime.now()
                      .add(Duration(days: index, hours: index + 1)),
                  maxiumUserCount: 30,
                  currentUserIDList: List.generate(30, (index) => _mockIndex),
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
              // state: TownClassState.finished,
              languageType: LanguageType.values[index % 3],
              scheduleList: List.generate(3, (index) {
                return TownClassSchedule(
                  id: _mockIndex,
                  beginDateTime:
                      DateTime.now().add(Duration(days: -(index + 1) * 2)),
                  endDatetime: DateTime.now()
                      .add(Duration(days: -(index + 1) * 2, hours: index + 1)),
                  maxiumUserCount: 30,
                  currentUserIDList:
                      List.generate(index * 9, (index) => _mockIndex),
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
              // state: TownClassState.finished,
              languageType: LanguageType.values[index % 3],
              scheduleList: List.generate(3, (index) {
                return TownClassSchedule(
                  id: _mockIndex,
                  beginDateTime:
                      DateTime.now().add(Duration(days: -(index + 1) * 2)),
                  endDatetime: DateTime.now()
                      .add(Duration(days: -(index + 1) * 2, hours: index + 1)),
                  maxiumUserCount: 30,
                  currentUserIDList:
                      List.generate(index * 9, (index) => _mockIndex),
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

  Future _delay() {
    return Future.delayed(const Duration(seconds: 1));
  }

  Future<dynamic> requestTownPage(String userID) async {
    await _delay();
    return CustomResponse.success(
      data: TownPage(
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
      ).toMap(),
    ).toMap();
  }

  Future<dynamic> requestTownClassDetail({
    required String userID,
    required String townClassID,
  }) async {
    await _delay();
    TownClass? townClass;
    for (final town in _mockTownList) {
      final list = town.classList.where((element) => element.id == townClassID);
      if (list.isNotEmpty) {
        townClass = list.first;
      }
    }
    if (townClass == null) {
      return CustomResponse.fail(message: "Cannot find TownClass: $townClassID")
          .toMap();
    }
    return CustomResponse.success(
      data: TownClassDetail.fromTownItem(
        townClass,
        commentList: _mockCommentList,
      ).toMap(),
    ).toMap();
  }

  Future<dynamic> requestBookingSchedule({
    required String userID,
    required String townClassID,
    required String scheduleID,
  }) async {
    await _delay();

    if (townClassID == "Error") {
      throw Exception("Error Test");
    }
    TownClass? townClass;
    for (final town in _mockTownList) {
      final list = town.classList.where((element) => element.id == townClassID);
      if (list.isNotEmpty) {
        townClass = list.first;
      }
    }
    if (townClass == null) {
      return CustomResponse.fail(message: "Cannot find TownClass: $townClassID")
          .toMap();
    }
    final scheduleList = townClass.scheduleList;
    final scheduleIndex =
        scheduleList.indexWhere((element) => element.id == scheduleID);
    if (scheduleIndex == -1) {
      return CustomResponse.fail(message: "Cannot find Schedule: $scheduleID")
          .toMap();
    }

    TownClassSchedule schedule = scheduleList[scheduleIndex];
    final idList = schedule.currentUserIDList;
    if (!idList.contains(userID)) {
      idList.add(userID);
    }
    schedule = schedule.copyWith(
      currentUserIDList: idList,
    );
    scheduleList[scheduleIndex] = schedule;
    townClass = townClass.copyWith(
      scheduleList: scheduleList,
    );

    return CustomResponse.success(
      data: TownClassDetail.fromTownItem(
        townClass,
        commentList: _mockCommentList,
      ).toMap(),
    ).toMap();
  }

  Future requestCancelSchedule({
    required String userID,
    required String townClassID,
    required String scheduleID,
  }) async {
    await _delay();

    if (townClassID == "Error") {
      throw Exception("Error Test");
    }

    TownClass? townClass;
    for (final town in _mockTownList) {
      final list = town.classList.where((element) => element.id == townClassID);
      if (list.isNotEmpty) {
        townClass = list.first;
      }
    }
    if (townClass == null) {
      return CustomResponse.fail(message: "Cannot find TownClass: $townClassID")
          .toMap();
    }
    final scheduleList = townClass.scheduleList;
    final scheduleIndex =
        scheduleList.indexWhere((element) => element.id == scheduleID);
    if (scheduleIndex == -1) {
      return CustomResponse.fail(message: "Cannot find Schedule: $scheduleID")
          .toMap();
    }

    TownClassSchedule schedule = townClass.scheduleList[scheduleIndex];
    final idList = schedule.currentUserIDList;
    if (idList.contains(userID)) {
      idList.remove(userID);
    }
    schedule = schedule.copyWith(
      currentUserIDList: idList,
    );
    scheduleList[scheduleIndex] = schedule;
    townClass = townClass.copyWith(
      scheduleList: scheduleList,
    );

    return CustomResponse.success(
      data: TownClassDetail.fromTownItem(
        townClass,
        commentList: _mockCommentList,
      ).toMap(),
    ).toMap();
  }
}
