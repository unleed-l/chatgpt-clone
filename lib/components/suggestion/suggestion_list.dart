import 'package:chatgpt_clone/models/enums/suggestion_enum.dart';
import 'package:chatgpt_clone/models/suggestion.dart';
import 'package:chatgpt_clone/pages/chat_page.dart';
import 'package:flutter/material.dart';

class SuggestionList extends StatelessWidget {
  const SuggestionList({super.key, required this.suggestions});

  final List<Suggestion> suggestions;

  @override
  Widget build(BuildContext context) {
    final bool isExample = suggestions.first.type == SuggestionType.example;

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: suggestions.length,
        itemBuilder: (context, index) => Container(
          constraints: const BoxConstraints(minHeight: 60),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                  WidgetSpan(
                    child: Visibility(
                      visible: isExample,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
