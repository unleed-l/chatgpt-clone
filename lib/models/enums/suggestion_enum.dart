import 'package:flutter/material.dart';

enum SuggestionType {
  example(title: 'Exemplos', icon: Icons.light_mode_outlined),
  capability(title: 'Capacidades', icon: Icons.bolt),
  limitation(title: 'Limitações', icon: Icons.warning_amber_rounded);

  const SuggestionType({required this.title, required this.icon});

  final String title;
  final IconData icon;
}
