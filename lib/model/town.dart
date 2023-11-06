import 'package:equatable/equatable.dart';

import 'package:langdy/model/town_class.dart';

class Town extends Equatable {
  const Town({
    required this.id,
    required this.title,
    required this.bannerImage,
    required this.classList,
  });

  final String id;
  final String title;
  final String bannerImage;
  final List<TownClass> classList;

  @override
  List<Object?> get props => [
        id,
        title,
        bannerImage,
        classList,
      ];

  factory Town.fromMap(Map<String, dynamic> map) {
    return Town(
      id: map["id"] as String,
      title: map['title'] as String,
      bannerImage: map["bannerImage"] as String,
      classList: List.from(map['classList']).map((e) {
        return TownClass.fromMap(e);
      }).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'bannerImage': bannerImage,
      'classList': classList.map((x) => x.toMap()).toList(),
    };
  }
}
