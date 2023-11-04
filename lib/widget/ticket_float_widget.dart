import 'package:flutter/material.dart';

enum TicketVisibility {
  show,
  hide,
}

enum TicketMode {
  normal,
  compact,
}

class TicketFloatWidget extends StatelessWidget {
  const TicketFloatWidget({
    super.key,
    required this.ticketVisibility,
    required this.onTap,
    this.ticketMode = TicketMode.normal,
  });
  final VoidCallback onTap;
  final TicketVisibility ticketVisibility;
  final TicketMode ticketMode;

  Widget largeWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: const IntrinsicHeight(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "내 수강권 ",
                      style: TextStyle(color: Colors.orange),
                    ),
                    TextSpan(
                      text: "무료 수강권 이용 중입니다:)",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget smallWidget() {
    return const Icon(Icons.airplane_ticket);
  }

  @override
  Widget build(BuildContext context) {
    if (ticketVisibility == TicketVisibility.hide) {
      return const SizedBox();
    }

    return GestureDetector(
      onTap: onTap,
      child: (ticketMode == TicketMode.compact) ? smallWidget() : largeWidget(),
    );
  }
}
