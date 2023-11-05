import 'package:flutter/material.dart';
import 'package:langdy/widget/wip_widget.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  static String get name => "/community";

  @override
  Widget build(BuildContext context) {
    return const WorkInProcessWidget();
  }
}
