import 'package:chatgpt_clone/models/enums/suggestion_enum.dart';
import 'package:flutter/material.dart';

class SuggestionTitle extends StatelessWidget {
  const SuggestionTitle({
    super.key,
    required this.suggestionType,
  });

  final SuggestionType suggestionType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Icon(suggestionType.icon)),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            suggestionType.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
