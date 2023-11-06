import 'package:flutter/material.dart';
import 'package:langdy/enum/language_type.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    super.key,
    required this.text,
    this.style,
    this.background,
    this.border,
  });

  factory BorderButton.level(int level) {
    return BorderButton(
      text: "Lv$level 이상",
      border: Border.all(
        color: Colors.grey,
      ),
    );
  }

  factory BorderButton.language(
    LanguageType languageType, {
    bool filled = true,
  }) {
    final color = languageType.toColor();
    return BorderButton(
      text: languageType.toLabel(),
      background: filled ? languageType.toColor() : Colors.transparent,
      border: Border.all(
        color: languageType.toColor(),
      ),
      style: TextStyle(
        color: filled ? Colors.white : color,
      ),
    );
  }

  final String text;
  final TextStyle? style;
  final Color? background;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        border: border,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 6.0,
          vertical: 4.0,
        ),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
