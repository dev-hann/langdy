import 'package:flutter/material.dart';

enum LanguageType {
  en,
  zh,
  jp,
}

extension LanguageTypeExtension on LanguageType {
  Color toColor() {
    switch (this) {
      case LanguageType.zh:
        return Colors.yellow;
      case LanguageType.jp:
        return Colors.blueGrey;
      case LanguageType.en:
        return Colors.purple;
    }
  }

  String toLabel() {
    switch (this) {
      case LanguageType.zh:
        return "중국어";
      case LanguageType.jp:
        return "일본어";
      case LanguageType.en:
        return "영어";
    }
  }
}
