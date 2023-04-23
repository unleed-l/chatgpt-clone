import 'package:chatgpt_clone/components/suggestion/suggestion_list.dart';
import 'package:chatgpt_clone/components/suggestion/suggestion_title.dart';
import 'package:chatgpt_clone/models/suggestion.dart';
import 'package:flutter/material.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({
    super.key,
    required this.suggestions,
  });

  final List<Suggestion> suggestions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SuggestionTitle(suggestionType: suggestions.first.type),
        SuggestionList(suggestions: suggestions),
      ],
    );
  }
}
