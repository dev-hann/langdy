import 'package:flutter/material.dart';
import 'package:langdy/model/town_comment.dart';

class TownDetailProvider extends ChangeNotifier {
  final List<TownComment> _commentList = List.generate(50, (index) {
    return TownComment(
      userName: "TestName$index",
      image: "https://picsum.photos/100/100",
      dateTime: DateTime.now(),
      title: "TestTitle$index",
      comment: 'Testcomment' * index,
    );
  });
  List<TownComment> get commentList {
    return _commentList.sublist(0, _commentPage * 5);
  }

  int _commentPage = 1;

  void loadCommentList() {
    if (_commentPage > 9) {
      return;
    }
    _commentPage++;
    notifyListeners();
  }
}
