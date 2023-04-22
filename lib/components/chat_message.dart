import 'package:chatgpt_clone/components/gpt_icon.dart';
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

class Bubble extends StatelessWidget {
  const Bubble({
    super.key,
    required this.isUser,
    required this.message,
  });

  final bool isUser;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isUser
                ? const Color.fromARGB(255, 80, 192, 148)
                : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft:
                  isUser ? const Radius.circular(12) : const Radius.circular(0),
              bottomRight:
                  isUser ? const Radius.circular(0) : const Radius.circular(12),
            ),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .7,
            minWidth: MediaQuery.of(context).size.width * .2,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment:
                isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                isUser ? 'Você' : 'ChatGPT',
                style: TextStyle(
                  color: isUser
                      ? Colors.grey.shade900
                      : const Color.fromARGB(255, 80, 192, 148),
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 5),
              SelectableText(
                message.content,
                textAlign: isUser ? TextAlign.right : TextAlign.left,
                style: TextStyle(
                  color: isUser ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GPTLogo extends StatelessWidget {
  const GPTLogo({
    super.key,
    required this.visible,
  });

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Flexible(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            GPTIcon(),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
