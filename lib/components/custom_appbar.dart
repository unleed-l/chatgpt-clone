import 'package:chatgpt_clone/providers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MessageProvider>(context);

    return AppBar(
      centerTitle: true,
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      title: const Text(
        'ChatGPT Clone',
        style: TextStyle(
          // fontSize: 18,
          color: Color.fromARGB(255, 80, 192, 148),
          fontWeight: FontWeight.bold,
          // shadows: [
          //   Shadow(
          //     color: Colors.grey.shade900,
          //     offset: const Offset(2, 2),
          //   ),
          // ],
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: FittedBox(child: Image.asset('assets/images/light_logo.png')),
      ),
      actions: [
        IconButton(
          onPressed: messageProvider.messages.isEmpty
              ? null
              : () => messageProvider.clearMessages(),
          icon: const Icon(Icons.add),
        ),
      ],
      backgroundColor: Colors.black,
    );
  }
}
