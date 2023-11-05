import 'package:flutter/material.dart';
import 'package:langdy/widget/wip_widget.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});
  static String get name => "/user";

  @override
  Widget build(BuildContext context) {
    return const WorkInProcessWidget();
  }
}
