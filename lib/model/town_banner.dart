import 'package:equatable/equatable.dart';

class TownBanner extends Equatable {
  const TownBanner({
    required this.image,
    required this.target,
  });
  final String image;
  final String target;

  @override
  List<Object?> get props => [
        image,
        target,
      ];
}
