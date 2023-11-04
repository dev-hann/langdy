import 'package:equatable/equatable.dart';

import 'package:langdy/model/town.dart';
import 'package:langdy/model/town_banner.dart';

class TownPage extends Equatable {
  const TownPage({
    required this.bannerList,
    required this.townList,
  });
  final List<TownBanner> bannerList;
  final List<Town> townList;

  @override
  List<Object?> get props => [
        bannerList,
        townList,
      ];

  factory TownPage.fromMap(Map<String, dynamic> map) {
    return TownPage(
      bannerList: List.from(map['bannerList']).map(
        (e) {
          return TownBanner.fromMap(e);
        },
      ).toList(),
      townList: List.from(map['townList']).map((e) {
        return Town.fromMap(e);
      }).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bannerList': bannerList.map((x) => x.toMap()).toList(),
      'townList': townList.map((x) => x.toMap()).toList(),
    };
  }
}
