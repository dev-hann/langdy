part of town_repo;

class TownImpl extends TownRepo {
  final TownService service = TownService();
  @override
  Future requestTownPage(String userID) {
    return service.requestTownPage(userID);
  }

  @override
  Future requestTownDetailPage({
    required String userID,
    required String townID,
  }) {
    return service.requestTownDetailPage(
      userID: userID,
      townItemID: townID,
    );
  }

  @override
  Future requestBookingSchedule(String scheduleID) {
    return service.requestBookingSchedule(scheduleID);
  }
}
