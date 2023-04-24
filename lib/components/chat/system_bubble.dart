import 'package:chatgpt_clone/models/message.dart';
import 'package:chatgpt_clone/utils/bubble_funcs.dart';
import 'package:flutter/material.dart';

class SystemBubble extends StatelessWidget {
  const SystemBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .6,
        ),
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
            ),
            Text(
              message.content,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: BubbleFuncs.textColor(message.role),
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
