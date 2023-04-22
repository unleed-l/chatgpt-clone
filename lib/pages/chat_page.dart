import 'package:chatgpt_clone/components/custom_appbar.dart';
import 'package:chatgpt_clone/components/messages.dart';
import 'package:chatgpt_clone/components/send_message.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Messages(isLoading: _isLoading),
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
