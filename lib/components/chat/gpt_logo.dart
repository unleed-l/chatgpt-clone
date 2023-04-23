import 'package:chatgpt_clone/components/icons/gpt_icon.dart';
import 'package:flutter/material.dart';

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
            GPTIcon(size: 30),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
