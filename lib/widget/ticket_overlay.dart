import 'package:flutter/material.dart';

class TicketOverlay extends StatelessWidget {
  const TicketOverlay({
    super.key,
    required this.onTapDismiss,
  });
  final VoidCallback onTapDismiss;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: onTapDismiss,
          child: ColoredBox(
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Work In Progress :)"),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: onTapDismiss,
                    child: const Text("Good Bye!"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
