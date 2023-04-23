import 'package:chatgpt_clone/pages/chat_page.dart';
import 'package:chatgpt_clone/providers/message_provider.dart';
import 'package:chatgpt_clone/theme/gpt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const ChatGPTClone());
}

class ChatGPTClone extends StatelessWidget {
  const ChatGPTClone({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessageProvider(),
      child: KeyboardVisibilityProvider(
        child: MaterialApp(
          title: 'GPT Clone',
          theme: GPTTheme.getTheme(),
          home: const ChatPage(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [Locale('pt', 'BR')],
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
