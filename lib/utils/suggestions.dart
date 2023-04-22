import 'package:chatgpt_clone/models/enums/suggestion_enum.dart';
import 'package:chatgpt_clone/models/suggestion.dart';

List<Suggestion> suggestions = [
  Suggestion(
    type: SuggestionType.example,
    content: '"Explique a computação quântica em termos simples"',
  ),
  Suggestion(
    type: SuggestionType.example,
    content:
        '"Tem alguma ideia criativa para o aniversário de uma criança de 10 anos?"',
  ),
  Suggestion(
    type: SuggestionType.example,
    content: '"Como faço uma solicitação HTTP em Javascript?"',
  ),
  Suggestion(
    type: SuggestionType.capability,
    content: 'Lembra o que o usuário disse anteriormente na conversa',
  ),
  Suggestion(
    type: SuggestionType.capability,
    content: 'Permite que o usuário forneça correções de acompanhamento',
  ),
  Suggestion(
    type: SuggestionType.capability,
    content: 'Treinado para recusar pedidos inapropriados',
  ),
  Suggestion(
    type: SuggestionType.limitation,
    content: 'Ocasionalmente pode gerar informações incorretas',
  ),
  Suggestion(
    type: SuggestionType.limitation,
    content:
        'Ocasionalmente, pode produzir instruções prejudiciais ou conteúdo tendencioso',
  ),
  Suggestion(
    type: SuggestionType.limitation,
    content: 'Conhecimento limitado do mundo e eventos após 2021',
  ),
];
