import 'package:flutter/material.dart';

class WorkInProcessWidget extends StatelessWidget {
  const WorkInProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "🚧 작업중입니다 :)",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
