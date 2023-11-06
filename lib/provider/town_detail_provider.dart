import 'package:flutter/material.dart';
import 'package:langdy/model/custom_error.dart';
import 'package:langdy/model/town_class_schedule.dart';
import 'package:langdy/model/town_comment.dart';
import 'package:langdy/model/town_class_detail.dart';
import 'package:langdy/use_case/town_use_case.dart';

class TownDetailProvider extends ChangeNotifier {
  TownDetailProvider(this.useCase);
  final TownUseCase useCase;
  TownClassDetail? _detailPage;
  TownClassDetail? get detail => _detailPage;
  List<TownComment> get commentList {
    return _detailPage?.commentList.sublist(0, _commentPage * 5) ?? [];
  }

  int _commentPage = 1;

  void loadNextCommentList() {
    if (_commentPage > 9) {
      return;
    }
    _commentPage++;
    notifyListeners();
  }

  CustomError? error;
  bool get hasError => error != null;

  void clearError() {
    error = null;
  }

  Future requestTownClassDetail(String townClassID) async {
    _detailPage = null;
    final either = await useCase.requestTownClassDetail(
      userID: "TestUserID",
      townClassID: townClassID,
    );
    either.fold(
      (detail) {
        _detailPage = detail;
      },
      (e) {
        error = e;
      },
    );
    notifyListeners();
  }

  bool _loadingOverlay = false;
  bool get isOverlayLoading => _loadingOverlay;

  Future requestBookingSchedule({
    required String townClassID,
    required TownClassSchedule schedule,
  }) async {
    _loadingOverlay = true;
    notifyListeners();
    final either = await useCase.requestBookingSchedule(
      userID: "TestUserID",
      townClassID: townClassID,
      scheduleID: schedule.id,
    );
    either.fold(
      (data) {
        _detailPage = data;
      },
      (e) {
        final list = _detailPage!.scheduleList;
        final index = list.indexWhere((element) => element.id == schedule.id);
        list[index] = schedule.copyWith(hasError: true);
        _detailPage = _detailPage!.copyWith(
          scheduleList: list,
        );
        error = e;
      },
    );
    _loadingOverlay = false;
    notifyListeners();
  }

  Future requestCancelSchedule({
    required String townClassID,
    required TownClassSchedule schedule,
  }) async {
    _loadingOverlay = true;
    notifyListeners();
    final either = await useCase.requestCancelSchedule(
      userID: "TestUserID",
      townClassID: townClassID,
      scheduleID: schedule.id,
    );
    either.fold(
      (data) {
        _detailPage = data;
      },
      (e) {
        final list = _detailPage!.scheduleList;
        final index = list.indexWhere((element) => element.id == schedule.id);
        list[index] = schedule.copyWith(hasError: true);
        _detailPage = _detailPage!.copyWith(
          scheduleList: list,
        );

        error = e;
      },
    );
    _loadingOverlay = false;
    notifyListeners();
  }
}
