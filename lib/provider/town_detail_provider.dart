import 'dart:math';

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
    final list = _detailPage?.commentList ?? [];
    return list.sublist(0, min(_commentPage * 5, list.length));
  }

  int _commentPage = 1;

  void _resetCommentPage() {
    _commentPage = 1;
  }

  void loadNextCommentList() {
    if (_commentPage > 10) {
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
    _resetCommentPage();
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

  Future _loadingOverlayAsync(Future Function() callback) async {
    _loadingOverlay = true;
    notifyListeners();
    await callback();
    _loadingOverlay = false;
    notifyListeners();
  }

  Future requestBookingSchedule({
    required String townClassID,
    required TownClassSchedule schedule,
  }) async {
    await _loadingOverlayAsync(() async {
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
    });
  }

  Future requestCancelSchedule({
    required String townClassID,
    required TownClassSchedule schedule,
  }) async {
    await _loadingOverlayAsync(() async {
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
    });
  }
}
