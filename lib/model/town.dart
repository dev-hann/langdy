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
}
