import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt_clone/models/enums/role_enum.dart';
import 'package:chatgpt_clone/models/message.dart';
import 'package:chatgpt_clone/utils/bubble_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bubble extends StatelessWidget {
  const Bubble({
    super.key,
    required this.message,
    required this.animateText,
  });

  final Message message;
  final bool animateText;

  @override
  Widget build(BuildContext context) {
    final isGPT = message.role == Role.assistant;

    return Container(
      decoration: BoxDecoration(
        color: BubbleFuncs.bubbleColor(context, message.role),
        borderRadius: BubbleFuncs.bubbleBorder(message.role),
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .7,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
          animateText
              ? AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      message.content,
                      textStyle: TextStyle(
                        color: BubbleFuncs.textColor(message.role),
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                  onTap: () => Clipboard.setData(
                    ClipboardData(
                      text: message.content,
                    ),
                  ),
                )
              : SelectableText(
                  message.content,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: BubbleFuncs.textColor(message.role),
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
        ],
      ),
    );
  }
}
