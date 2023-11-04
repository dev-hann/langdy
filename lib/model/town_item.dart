import 'package:equatable/equatable.dart';

import 'package:langdy/enum/language_type.dart';

// FIXME: naming... not suitable..
enum TownItemState {
  booking,
  bookedUp,
  finished,
}

class TownItem extends Equatable {
  const TownItem({
    required this.id,
    required this.title,
    required this.image,
    required this.state,
    required this.languageType,
    required this.dateTimeList,
    required this.price,
    required this.level,
    required this.maxiumUserCount,
    required this.currentUserCount,
  });
  final String id;
  final String title;
  final String image;
  final String level;
  final TownItemState state;
  final LanguageType languageType;
  final List<DateTime> dateTimeList;
  final int price;
  final int maxiumUserCount;
  final int currentUserCount;

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        level,
        state,
        languageType,
        dateTimeList,
        price,
      ];

  factory TownItem.fromMap(Map<String, dynamic> map) {
    return TownItem(
      id: map['id'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      level: map['level'] as String,
      state: TownItemState.values[map['state']],
      languageType: LanguageType.values[map['languageType']],
      dateTimeList: List<DateTime>.from(
        (map['dateTimeList'] as List<int>).map<DateTime>(
          (x) => DateTime.fromMillisecondsSinceEpoch(x),
        ),
      ),
      price: map['price'] as int,
      maxiumUserCount: map['maxiumUserCount'] as int,
      currentUserCount: map['currentUserCount'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'level': level,
      'state': state.index,
      'languageType': languageType.index,
      'dateTimeList':
          dateTimeList.map((x) => x.millisecondsSinceEpoch).toList(),
      'price': price,
      'maxiumUserCount': maxiumUserCount,
      'currentUserCount': currentUserCount,
    };
  }
}
