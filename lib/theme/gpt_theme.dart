import 'package:flutter/material.dart';

class GPTTheme {
  static ThemeData getTheme() {
    final theme = ThemeData.dark();

    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: const Color(0xFF393939),
        secondary: Colors.black,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.green.shade400,
      ),
      scaffoldBackgroundColor: Colors.black,
    );
  }
}
