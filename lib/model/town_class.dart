import 'package:equatable/equatable.dart';

import 'package:langdy/enum/language_type.dart';
import 'package:langdy/model/town_class_schedule.dart';

// FIXME: naming... not suitable..
enum TownClassState {
  booking,
  bookedUp,
  finished,
}

class TownClass extends Equatable {
  const TownClass({
    required this.id,
    required this.title,
    required this.bannerImage,
    required this.languageType,
    required this.price,
    required this.level,
    required this.scheduleList,
  });
  final String id;
  final String title;
  final String bannerImage;
  final String level;
  final LanguageType languageType;
  final int price;
  final List<TownClassSchedule> scheduleList;

  TownClassState get state {
    final list = scheduleList;
    if (list.where((e) => e.endDatetime.isAfter(DateTime.now())).isEmpty) {
      return TownClassState.finished;
    }
    if (totalMaxiumUserCount == totalCurrentUserCount) {
      return TownClassState.bookedUp;
    }
    return TownClassState.booking;
  }

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
      'languageType': languageType.index,
      'scheduleList': scheduleList.map((e) => e.toMap()).toList(),
      'price': price,
    };
  }

  TownClass copyWith({
    String? id,
    String? title,
    String? bannerImage,
    String? level,
    LanguageType? languageType,
    int? price,
    List<TownClassSchedule>? scheduleList,
  }) {
    return TownClass(
      id: id ?? this.id,
      title: title ?? this.title,
      bannerImage: bannerImage ?? this.bannerImage,
      level: level ?? this.level,
      languageType: languageType ?? this.languageType,
      price: price ?? this.price,
      scheduleList: scheduleList ?? this.scheduleList,
    );
  }
}
