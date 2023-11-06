import 'package:dartz/dartz.dart';
import 'package:langdy/model/custom_error.dart';
import 'package:langdy/model/town_class_detail.dart';
import 'package:langdy/model/town_page.dart';
import 'package:langdy/repo/town_repo.dart';

class TownUseCase {
  TownUseCase(this.repo);
  final TownRepo repo;

  Future<Either<TownPage, CustomError>> requestTownPage(String userID) async {
    try {
      final data = await repo.requestTownPage(userID);
      return Left(TownPage.fromMap(data));
    } catch (e) {
      return Right(CustomError.fromObject(e));
    }
  }

  Future<Either<TownClassDetail, CustomError>> requestTownClassDetail({
    required String userID,
    required String townClassID,
  }) async {
    try {
      final data = await repo.requestTownClassDetail(
        userID: userID,
        townClassID: townClassID,
      );
      return Left(TownClassDetail.fromMap(data));
    } catch (e) {
      return Right(CustomError.fromObject(e));
    }
  }

  Future<Either<TownClassDetail, CustomError>> requestBookingSchedule({
    required String userID,
    required String townClassID,
    required String scheduleID,
  }) async {
    try {
      final data = await repo.requestBookingSchedule(
        userID: userID,
        scheduleID: scheduleID,
        townClassID: townClassID,
      );
      return Left(TownClassDetail.fromMap(data));
    } catch (e) {
      return Right(CustomError.fromObject(e));
    }
  }

  Future<Either<TownClassDetail, CustomError>> requestCancelSchedule({
    required String userID,
    required String townClassID,
    required String scheduleID,
  }) async {
    try {
      final data = await repo.requestCancelSchedule(
        userID: userID,
        scheduleID: scheduleID,
        townClassID: townClassID,
      );
      return Left(TownClassDetail.fromMap(data));
    } catch (e) {
      return Right(CustomError.fromObject(e));
    }
  }
}
