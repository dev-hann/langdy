part of town_repo;

class TownImpl extends TownRepo {
  final TownService service = TownService();
  @override
  Future requestTownPage(String userID) {
    return service.requestTownPage(userID);
  }
}
