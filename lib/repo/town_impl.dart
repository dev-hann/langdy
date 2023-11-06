part of town_repo;

class TownImpl extends TownRepo {
  final TownService service = TownService();
  @override
  Future requestTownPage(String userID) {
    return service.requestTownPage(userID);
  }

  @override
  Future requestTownClassDetail({
    required String userID,
    required String townClassID,
  }) {
    return service.requestTownClassDetail(
      userID: userID,
      townClassID: townClassID,
    );
  }

  @override
  Future requestBookingSchedule({
    required String townClassID,
    required String scheduleID,
  }) {
    return service.requestBookingSchedule(
      townClassID: townClassID,
      scheduleID: scheduleID,
    );
  }
}
