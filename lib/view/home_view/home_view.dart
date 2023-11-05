import 'package:flutter/material.dart';
import 'package:langdy/widget/wip_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String get name => "/";

  @override
  Widget build(BuildContext context) {
    return const WorkInProcessWidget();
  }
}
