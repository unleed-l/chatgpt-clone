import 'package:flutter/material.dart';

class GPTIcon extends StatelessWidget {
  const GPTIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 18,
      backgroundImage: AssetImage('assets/images/light_logo.png'),
    );
  }
}
