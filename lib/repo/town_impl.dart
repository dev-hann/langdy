part of town_repo;

class TownImpl extends TownRepo {
  final TownService service = TownService();
  @override
  Future requestTownPage(String userID) async {
    final res = await service.requestTownPage(userID);
    if (!res.isOK) {
      throw CustomError.fromResponse(res);
    }
    return res.data;
  }

  @override
  Future requestTownClassDetail({
    required String userID,
    required String townClassID,
  }) async {
    final res = await service.requestTownClassDetail(
      userID: userID,
      townClassID: townClassID,
    );
    if (!res.isOK) {
      throw CustomError.fromResponse(res);
    }
    return res.data;
  }

  @override
  Future requestBookingSchedule({
    required String userID,
    required String townClassID,
    required String scheduleID,
  }) async {
    final res = await service.requestBookingSchedule(
      userID: userID,
      townClassID: townClassID,
      scheduleID: scheduleID,
    );
    if (!res.isOK) {
      throw CustomError.fromResponse(res);
    }
    return res.data;
  }

  @override
  Future requestCancelSchedule({
    required String userID,
    required String scheduleID,
    required String townClassID,
  }) async {
    final res = await service.requestCancelSchedule(
      userID: userID,
      townClassID: townClassID,
      scheduleID: scheduleID,
    );
    if (!res.isOK) {
      throw CustomError.fromResponse(res);
    }
    return res.data;
  }
}
