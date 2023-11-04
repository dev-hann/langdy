import 'package:flutter/material.dart';
import 'package:langdy/enum/language_type.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({
    super.key,
    required this.type,
  });
  final LanguageType type;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: type.toColor(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Text(
          type.toLabel(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
