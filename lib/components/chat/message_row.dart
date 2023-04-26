import 'package:chatgpt_clone/components/chat/bubble.dart';
import 'package:chatgpt_clone/components/chat/gpt_logo.dart';
import 'package:chatgpt_clone/components/chat/system_bubble.dart';
import 'package:chatgpt_clone/models/message.dart';
import 'package:chatgpt_clone/models/enums/role_enum.dart';
import 'package:chatgpt_clone/providers/message_provider.dart';
import 'package:chatgpt_clone/utils/bubble_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MessageRow extends StatefulWidget {
  const MessageRow({
    super.key,
    required this.message,
    required this.animate,
    required this.animationController,
  });

  final Message message;
  final bool animate;
  final AnimationController animationController;

  @override
  State<MessageRow> createState() => _MessageRowState();
}

class _MessageRowState extends State<MessageRow> {
  @override
  Widget build(BuildContext context) {
    final bool isGPT = widget.message.role == Role.assistant;
    final isSystem = widget.message.role == Role.system;

    return widget.animate
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Row(
              mainAxisAlignment:
                  BubbleFuncs.bubbleAlignment(widget.message.role),
              crossAxisAlignment:
                  isGPT ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (isGPT) const GPTLogo(),
                isSystem
                    ? SystemBubble(message: widget.message)
                    : Bubble(
                        message: widget.message,
                        animateText: widget.animate && isGPT,
                      ),
              ],
            ),
          )
            .animate(
              autoPlay: false,
              controller: widget.animationController,
            )
            .moveY(
              begin: 50,
              duration: 500.ms,
              curve: Curves.easeInOut,
            )
            .fade(
              duration: 500.ms,
              curve: Curves.easeIn,
            )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Row(
              mainAxisAlignment:
                  BubbleFuncs.bubbleAlignment(widget.message.role),
              crossAxisAlignment:
                  isGPT ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (isGPT) const GPTLogo(),
                isSystem
                    ? SystemBubble(message: widget.message)
                    : Bubble(
                        message: widget.message,
                        animateText: widget.animate && isGPT,
                      ),
              ],
            ),
          )
            .animate(
              autoPlay: false,
              controller: widget.animationController,
            )
            .moveY(
              begin: 50,
              duration: 500.ms,
              curve: Curves.easeInOut,
            );
  }
}
