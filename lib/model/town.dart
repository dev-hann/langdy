import 'package:equatable/equatable.dart';

import 'package:langdy/model/town_item.dart';

class Town extends Equatable {
  const Town({
    required this.title,
    required this.itemList,
  });

  final String title;
  final List<TownItem> itemList;

  @override
  List<Object?> get props => [
        title,
        itemList,
      ];

  factory Town.fromMap(Map<String, dynamic> map) {
    return Town(
      title: map['title'] as String,
      itemList: List.from(map['itemList']).map((e) {
        return TownItem.fromMap(e);
      }).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'itemList': itemList.map((x) => x.toMap()).toList(),
    };
  }
}
