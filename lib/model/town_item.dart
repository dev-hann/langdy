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
}
