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

  factory TownBanner.fromMap(Map<String, dynamic> map) {
    return TownBanner(
      image: map['image'] as String,
      target: map['target'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'target': target,
    };
  }
}
