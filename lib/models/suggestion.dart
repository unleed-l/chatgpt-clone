import 'package:chatgpt_clone/models/enums/suggestion_enum.dart';

class Suggestion {
  final String content;
  final SuggestionType type;

  Suggestion({
    required this.content,
    required this.type,
  });
}
