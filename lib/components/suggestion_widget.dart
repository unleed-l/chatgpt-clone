import 'package:chatgpt_clone/models/enums/suggestion_enum.dart';
import 'package:chatgpt_clone/models/suggestion.dart';
import 'package:chatgpt_clone/pages/chat_page.dart';
import 'package:flutter/material.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({
    super.key,
    required this.suggestions,
  });

  final List<Suggestion> suggestions;

  @override
  Widget build(BuildContext context) {
    final bool isExample = suggestions.first.type == SuggestionType.example;

    String title() {
      switch (suggestions.first.type) {
        case SuggestionType.example:
          return 'Exemplos';
        case SuggestionType.capability:
          return 'Capacidades';
        case SuggestionType.limitation:
          return 'Limitações';
      }
    }

    IconData icon() {
      switch (suggestions.first.type) {
        case SuggestionType.example:
          return Icons.light_mode;
        case SuggestionType.capability:
          return Icons.bolt;
        case SuggestionType.limitation:
          return Icons.warning_amber_rounded;
      }
    }

    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon()),
            const SizedBox(width: 5),
            Text(
              title(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: suggestions.length,
          itemBuilder: (context, index) => Container(
            constraints: const BoxConstraints(minHeight: 50),
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 15,
            ),
            child: ElevatedButton(
              onPressed: isExample
                  ? () => context
                          .findAncestorStateOfType<ChatPageState>()
                          ?.messageController
                          .text =
                      suggestions.elementAt(index).content.replaceAll('"', '')
                  : null,
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: Theme.of(context).primaryColor,
                disabledBackgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: suggestions.elementAt(index).content,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    if (isExample)
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
