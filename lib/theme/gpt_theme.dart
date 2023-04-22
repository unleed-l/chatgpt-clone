import 'package:flutter/material.dart';

class GPTTheme {
  static ThemeData getTheme() {
    final theme = ThemeData.dark();

    return theme.copyWith(
      // useMaterial3: true,
      colorScheme: theme.colorScheme.copyWith(
        primary: const Color(0xFF393939),
        secondary: const Color.fromARGB(255, 194, 194, 194),
      ),
      scaffoldBackgroundColor: const Color(0xFF393939),
    );
  }
}
