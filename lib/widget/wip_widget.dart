import 'package:flutter/material.dart';

class WorkInProcessWidget extends StatelessWidget {
  const WorkInProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.orangeAccent.withOpacity(0.2),
      child: Center(
        child: Text(
          "🚧 작업중입니다 :)",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
