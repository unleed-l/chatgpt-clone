import 'package:chatgpt_clone/components/suggestion/suggestion_widget.dart';
import 'package:chatgpt_clone/models/suggestion.dart';
import 'package:flutter/material.dart';

class SuggestionPage extends StatelessWidget {
  const SuggestionPage({
    super.key,
    required this.suggestions,
  });

  final List<Suggestion> suggestions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SuggestionWidget(suggestions: suggestions),
      ),
    );
  }
}
