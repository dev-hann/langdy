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
}
