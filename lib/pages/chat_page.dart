import 'package:chatgpt_clone/components/appbar/custom_appbar.dart';
import 'package:chatgpt_clone/components/chat/message_list.dart';
import 'package:chatgpt_clone/components/bottom_field/send_message.dart';
import 'package:chatgpt_clone/models/enums/role_enum.dart';
import 'package:chatgpt_clone/models/message.dart';
import 'package:chatgpt_clone/providers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

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

  Future<void> onSubmitted() async {
    if (messageController.text.trim().isEmpty) return;
    final messageProvider =
        Provider.of<MessageProvider>(context, listen: false);

    final String msg = messageController.text;
    messageController.clear();

    setState(() => _isLoading = true);
    try {
      await messageProvider.doAsk(
        Message(
          uuid: const Uuid().v4(),
          role: Role.user,
          content: msg,
        ),
      );
    } catch (e) {
      messageProvider.addMessage(
        Message(
          uuid: const Uuid().v4(),
          role: Role.system,
          content: e.toString(),
        ),
      );
    }
    setState(() => _isLoading = false);
  }

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
                child: MessageList(isLoading: _isLoading),
              ),
            ),
            SendMessage(
              controller: messageController,
              isActive: !_isLoading,
              onSubmitted: onSubmitted,
            ),
          ],
        ),
      ),
    );
  }
}
