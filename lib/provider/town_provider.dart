import 'package:flutter/material.dart';
import 'package:langdy/model/town_page.dart';
import 'package:langdy/use_case/town_use_case.dart';

class TownProvider extends ChangeNotifier {
  TownProvider(this.useCase);
  final TownUseCase useCase;

  TownPage? _townPage;

  TownPage? get townPage => _townPage;

  // CustomError? error;
  // bool get hasError => error != null;

  void requestTownPage() async {
    final either = await useCase.requestTownPage("TestUserID");
    either.fold(
      (data) {
        _townPage = data;
      },
      (e) {
        // error = e;
      },
    );
    notifyListeners();
  }
}
