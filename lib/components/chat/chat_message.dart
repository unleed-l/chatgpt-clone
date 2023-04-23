import 'package:chatgpt_clone/components/chat/bubble.dart';
import 'package:chatgpt_clone/components/chat/gpt_logo.dart';
import 'package:chatgpt_clone/models/message.dart';
import 'package:chatgpt_clone/models/enums/role_enum.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final bool isUser = message.role == Role.user;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GPTLogo(visible: !isUser),
          Bubble(isUser: isUser, message: message),
        ],
      ),
    );
  }
}
