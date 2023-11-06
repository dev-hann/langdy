import 'package:equatable/equatable.dart';
import 'package:langdy/model/town_class.dart';

class TownClassSchedule extends Equatable {
  const TownClassSchedule({
    required this.id,
    required this.beginDateTime,
    required this.endDatetime,
    required this.maxiumUserCount,
    required this.currentUserIDList,
    this.hasError = false,
  });
  final String id;
  final DateTime beginDateTime;
  final DateTime endDatetime;
  final int maxiumUserCount;
  final List<String> currentUserIDList;
  final bool hasError;

  bool isBooked(String userID) {
    return currentUserIDList.contains(userID);
  }

  int get currentUserCount {
    return currentUserIDList.length;
  }

  TownClassState get state {
    if (endDatetime.isBefore(DateTime.now())) {
      return TownClassState.finished;
    }
    if (maxiumUserCount == currentUserCount) {
      return TownClassState.bookedUp;
    }
    return TownClassState.booking;
  }

  @override
  List<Object?> get props => [
        id,
        beginDateTime,
        endDatetime,
        maxiumUserCount,
        currentUserIDList,
        hasError,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'beginDateTime': beginDateTime.millisecondsSinceEpoch,
      'endDateTime': endDatetime.millisecondsSinceEpoch,
      'maxiumUserCount': maxiumUserCount,
      'currentUserIDList': currentUserIDList,
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
      currentUserIDList: map['currentUserIDList'] as List<String>,
    );
  }

  TownClassSchedule copyWith({
    String? id,
    DateTime? beginDateTime,
    DateTime? endDatetime,
    int? maxiumUserCount,
    List<String>? currentUserIDList,
    bool? hasError,
  }) {
    return TownClassSchedule(
      id: id ?? this.id,
      beginDateTime: beginDateTime ?? this.beginDateTime,
      endDatetime: endDatetime ?? this.endDatetime,
      maxiumUserCount: maxiumUserCount ?? this.maxiumUserCount,
      currentUserIDList: currentUserIDList ?? this.currentUserIDList,
      hasError: hasError ?? this.hasError,
    );
  }
}
