import 'package:flutter/material.dart';

class GPTIcon extends StatelessWidget {
  const GPTIcon({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: size,
        width: size,
        child: Image.asset('assets/images/light_logo.png'),
      ),
    );
  }
}
