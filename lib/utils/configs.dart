import 'package:flutter_dotenv/flutter_dotenv.dart';

const String link = 'https://api.openai.com/v1/chat/completions';
const String model = 'gpt-3.5-turbo';
final Map<String, String> headers = {
  'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
  'Content-Type': 'application/json',
};
