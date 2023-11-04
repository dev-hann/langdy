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
}
