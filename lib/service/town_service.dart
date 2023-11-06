import 'package:langdy/model/custom_response.dart';
import 'package:langdy/service/town_test_server.dart';

class TownService {
  final TownTestServer _server = TownTestServer.instance;

  Future<CustomResponse> requestTownPage(String userID) async {
    final res = await _server.requestTownPage(userID);
    return CustomResponse.fromMap(res);
  }

  Future<CustomResponse> requestTownClassDetail({
    required String userID,
    required String townClassID,
  }) async {
    final res = await _server.requestTownClassDetail(
      userID: userID,
      townClassID: townClassID,
    );
    return CustomResponse.fromMap(res);
  }

  Future<CustomResponse> requestBookingSchedule({
    required String userID,
    required String townClassID,
    required String scheduleID,
  }) async {
    final res = await _server.requestBookingSchedule(
      userID: userID,
      townClassID: townClassID,
      scheduleID: scheduleID,
    );
    return CustomResponse.fromMap(res);
  }

  Future<CustomResponse> requestCancelSchedule({
    required String userID,
    required String townClassID,
    required String scheduleID,
  }) async {
    final res = await _server.requestCancelSchedule(
      userID: userID,
      townClassID: townClassID,
      scheduleID: scheduleID,
    );
    return CustomResponse.fromMap(res);
  }
}
