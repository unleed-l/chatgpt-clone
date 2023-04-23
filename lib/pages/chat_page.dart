import 'package:chatgpt_clone/components/custom_appbar.dart';
import 'package:chatgpt_clone/components/messages.dart';
import 'package:chatgpt_clone/components/send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final messageController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  setIsLoading(bool load) => setState(() => _isLoading = load);

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final hideChat = isKeyboardVisible && isLandscape;

    return Scaffold(
      appBar: hideChat ? null : const CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Visibility(
              visible: !hideChat,
              child: Expanded(
                child: Messages(isLoading: _isLoading),
              ),
            ),
            SendMessage(
              controller: messageController,
              isActive: !_isLoading,
              setLoad: setIsLoading,
            ),
          ],
        ),
      ),
    );
  }
}
