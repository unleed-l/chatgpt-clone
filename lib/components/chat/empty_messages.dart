import 'package:chatgpt_clone/components/suggestion/suggestion_page.dart';
import 'package:chatgpt_clone/models/enums/suggestion_enum.dart';
import 'package:chatgpt_clone/utils/suggestions.dart';
import 'package:flutter/material.dart';

class EmptyMessages extends StatelessWidget {
  const EmptyMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final suggs = [
      for (SuggestionType suggestionType in SuggestionType.values)
        suggestions
            .where((suggestion) => suggestion.type == suggestionType)
            .toList()
    ];

    return PageView.builder(
      itemCount: suggs.length,
      itemBuilder: (context, index) =>
          SuggestionPage(suggestions: suggs[index]),
    );
  }
}
