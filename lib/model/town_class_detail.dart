import 'package:langdy/enum/language_type.dart';
import 'package:langdy/model/town_comment.dart';
import 'package:langdy/model/town_class.dart';

class TownClassDetail extends TownClass {
  const TownClassDetail({
    required super.id,
    required super.title,
    required super.bannerImage,
    required super.state,
    required super.languageType,
    required super.price,
    required super.level,
    required super.scheduleList,
    required this.commentList,
  });
  final List<TownComment> commentList;

  @override
  List<Object?> get props => [
        id,
        title,
        bannerImage,
        state,
        languageType,
        price,
        level,
        scheduleList,
        commentList,
      ];

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'bannerImage': bannerImage,
      'level': level,
      'state': state.index,
      'languageType': languageType.index,
      'scheduleList': scheduleList.map((e) => e.toMap()).toList(),
      'price': price,
      'commentList': commentList.map((x) => x.toMap()).toList(),
    };
  }

  factory TownClassDetail.fromMap(Map<String, dynamic> map) {
    return TownClassDetail(
      id: map['id'] as String,
      title: map['title'] as String,
      bannerImage: map['bannerImage'] as String,
      level: map['level'] as String,
      state: TownClassState.values[map['state']],
      languageType: LanguageType.values[map['languageType']],
      scheduleList: List.from(map['scheduleList']).map((e) {
        return TownClassSchedule.fromMap(e);
      }).toList(),
      price: map['price'] as int,
      commentList: List.from(map['commentList']).map((e) {
        return TownComment.fromMap(e);
      }).toList(),
    );
  }

  factory TownClassDetail.fromTownItem(
    TownClass item, {
    required List<TownComment> commentList,
  }) {
    return TownClassDetail(
      id: item.id,
      title: item.title,
      bannerImage: item.bannerImage,
      state: item.state,
      languageType: item.languageType,
      price: item.price,
      level: item.level,
      scheduleList: item.scheduleList,
      commentList: commentList,
    );
  }
}
