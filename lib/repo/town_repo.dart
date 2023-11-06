library town_repo;

import 'package:langdy/service/town_service.dart';

part './town_impl.dart';

abstract class TownRepo {
  Future requestTownPage(String userID);

  Future requestTownClassDetail({
    required String userID,
    required String townClassID,
  });

  Future requestBookingSchedule({
    required String townClassID,
    required String scheduleID,
  });
}
