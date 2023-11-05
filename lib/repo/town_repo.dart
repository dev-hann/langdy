library town_repo;

import 'package:langdy/service/town_service.dart';

part './town_impl.dart';

abstract class TownRepo {
  Future requestTownPage(String userID);

  Future requestTownDetailPage({
    required String userID,
    required String townID,
  });

  Future requestBookingSchedule(String scheduleID);
}
