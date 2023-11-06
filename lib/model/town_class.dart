import 'package:equatable/equatable.dart';

import 'package:langdy/enum/language_type.dart';

// FIXME: naming... not suitable..
enum TownClassState {
  booking,
  bookedUp,
  finished,
}

class TownClassSchedule extends Equatable {
  const TownClassSchedule({
    required this.id,
    required this.beginDateTime,
    required this.endDatetime,
    required this.maxiumUserCount,
    required this.currentUserCount,
  });
  final String id;
  final DateTime beginDateTime;
  final DateTime endDatetime;
  final int maxiumUserCount;
  final int currentUserCount;

  @override
  List<Object?> get props => [
        id,
        beginDateTime,
        endDatetime,
        maxiumUserCount,
        currentUserCount,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'beginDateTime': beginDateTime.millisecondsSinceEpoch,
      'endDateTime': endDatetime.millisecondsSinceEpoch,
      'maxiumUserCount': maxiumUserCount,
      'currentUserCount': currentUserCount,
    };
  }

  factory TownClassSchedule.fromMap(Map<String, dynamic> map) {
    return TownClassSchedule(
      id: map['id'],
      beginDateTime:
          DateTime.fromMillisecondsSinceEpoch(map['beginDateTime'] as int),
      endDatetime:
          DateTime.fromMillisecondsSinceEpoch(map['endDateTime'] as int),
      maxiumUserCount: map['maxiumUserCount'] as int,
      currentUserCount: map['currentUserCount'] as int,
    );
  }
}

class TownClass extends Equatable {
  const TownClass({
    required this.id,
    required this.title,
    required this.bannerImage,
    required this.state,
    required this.languageType,
    required this.price,
    required this.level,
    required this.scheduleList,
  });
  final String id;
  final String title;
  final String bannerImage;
  final String level;
  final TownClassState state;
  final LanguageType languageType;
  final int price;
  final List<TownClassSchedule> scheduleList;

  int get totalMaxiumUserCount {
    return scheduleList
        .map((e) => e.maxiumUserCount)
        .reduce((value, element) => value + element);
  }

  int get totalCurrentUserCount {
    return scheduleList
        .map((e) => e.currentUserCount)
        .reduce((value, element) => value + element);
  }

  @override
  List<Object?> get props => [
        id,
        title,
        bannerImage,
        level,
        state,
        languageType,
        price,
        scheduleList,
      ];

  factory TownClass.fromMap(Map<String, dynamic> map) {
    return TownClass(
      id: map['id'] as String,
      title: map['title'] as String,
      bannerImage: map['bannerImage'] as String,
      level: map['level'] as String,
      state: TownClassState.values[map['state']],
      languageType: LanguageType.values[map['languageType']],
      price: map['price'] as int,
      scheduleList: List.from(map['scheduleList']).map((e) {
        return TownClassSchedule.fromMap(e);
      }).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'bannerImage': bannerImage,
      'level': level,
      'state': state.index,
      'languageType': languageType.index,
      'scheduleList': scheduleList.map((e) => e.toMap()).toList(),
      'price': price,
    };
  }
}
