import 'package:chatgpt_clone/models/enums/role_enum.dart';
import 'package:chatgpt_clone/models/message.dart';
import 'package:chatgpt_clone/utils/bubble_funcs.dart';
import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  const Bubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final isGPT = message.role == Role.assistant;
    final isSystem = message.role == Role.system;

    return Container(
      decoration: BoxDecoration(
        color: BubbleFuncs.bubbleColor(context, message.role),
        borderRadius: BubbleFuncs.bubbleBorder(message.role),
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .7,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: isGPT,
            child: Column(
              children: const [
                Text(
                  'ChatGPT',
                  style: TextStyle(
                    color: Color.fromARGB(255, 80, 192, 148),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
          SelectableText(
            message.content,
            textAlign: isSystem ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              color: BubbleFuncs.textColor(message.role),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
