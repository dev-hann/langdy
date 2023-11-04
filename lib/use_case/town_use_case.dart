import 'package:dartz/dartz.dart';
import 'package:langdy/model/custom_error.dart';
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
}
