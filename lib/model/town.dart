import 'package:equatable/equatable.dart';

import 'package:langdy/model/town_item.dart';

class Town extends Equatable {
  const Town({
    required this.id,
    required this.title,
    required this.bannerImage,
    required this.itemList,
  });

  final String id;
  final String title;
  final String bannerImage;
  final List<TownItem> itemList;

  @override
  List<Object?> get props => [
        id,
        title,
        bannerImage,
        itemList,
      ];

  factory Town.fromMap(Map<String, dynamic> map) {
    return Town(
      id: map["id"] as String,
      title: map['title'] as String,
      bannerImage: map["bannerImage"] as String,
      itemList: List.from(map['itemList']).map((e) {
        return TownItem.fromMap(e);
      }).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'bannerImage': bannerImage,
      'itemList': itemList.map((x) => x.toMap()).toList(),
    };
  }
}
