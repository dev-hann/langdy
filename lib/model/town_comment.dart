import 'package:equatable/equatable.dart';

class TownComment extends Equatable {
  const TownComment({
    required this.userName,
    required this.image,
    required this.dateTime,
    required this.title,
    required this.comment,
  });
  final String userName;
  final String image;
  final DateTime dateTime;
  final String title;
  final String comment;

  @override
  List<Object?> get props => [
        userName,
        image,
        dateTime,
        title,
        comment,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'image': image,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'title': title,
      'comment': comment,
    };
  }

  factory TownComment.fromMap(Map<String, dynamic> map) {
    return TownComment(
      userName: map['userName'] as String,
      image: map['image'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      title: map['title'] as String,
      comment: map['comment'] as String,
    );
  }
}
