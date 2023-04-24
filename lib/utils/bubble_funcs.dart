import 'package:chatgpt_clone/models/enums/role_enum.dart';
import 'package:flutter/material.dart';

class BubbleFuncs {
  static Color bubbleColor(BuildContext context, Role role) {
    switch (role) {
      case Role.user:
        return const Color.fromARGB(255, 80, 192, 148);
      case Role.assistant:
        return Theme.of(context).primaryColor;
      case Role.system:
        return Colors.transparent; //Theme.of(context).colorScheme.error;
    }
  }

  static Color textColor(Role role) {
    switch (role) {
      case Role.user:
        return Colors.black;
      case Role.assistant:
        return Colors.white;
      case Role.system:
        return Colors.redAccent;
    }
  }

  static MainAxisAlignment bubbleAlignment(Role role) {
    switch (role) {
      case Role.user:
        return MainAxisAlignment.end;
      case Role.assistant:
        return MainAxisAlignment.start;
      case Role.system:
        return MainAxisAlignment.center;
    }
  }

  static BorderRadiusGeometry bubbleBorder(Role role) {
    switch (role) {
      case Role.user:
        return const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(0),
        );
      case Role.assistant:
        return const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(12),
        );
      case Role.system:
        return BorderRadius.circular(12);
    }
  }
}
