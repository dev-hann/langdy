import 'package:flutter/material.dart';
import 'package:langdy/model/custom_error.dart';
import 'package:langdy/model/town_comment.dart';
import 'package:langdy/model/town_detail_page.dart';
import 'package:langdy/model/town_item.dart';
import 'package:langdy/use_case/town_use_case.dart';

class TownDetailProvider extends ChangeNotifier {
  TownDetailProvider(this.useCase);
  final TownUseCase useCase;
  TownDetailPage? _detailPage;
  TownDetailPage? get detailPage => _detailPage;
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

  Future requestTownDetailPage(String townID) async {
    _detailPage = null;
    final either = await useCase.requestTownDetailPage(
      userID: "TestUserID",
      townID: townID,
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

  Future requestBookingSchedule(TownItemSchedule schedule) async {
    _loadingOverlay = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    _loadingOverlay = false;
    notifyListeners();
  }
}
