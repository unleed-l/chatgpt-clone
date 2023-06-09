import 'package:chatgpt_clone/components/icons/gpt_icon.dart';
import 'package:chatgpt_clone/pages/chat_page.dart';
import 'package:chatgpt_clone/providers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

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
        ),
      ),
      leading: const Padding(
        padding: EdgeInsets.all(12),
        child: GPTIcon(),
      ),
      actions: [
        IconButton(
          onPressed: messageProvider.messages.isEmpty || !isActive
              ? null
              : () {
                  messageProvider.clearMessages();
                  context
                      .findAncestorStateOfType<ChatPageState>()
                      ?.setLoading(false);
                },
          icon: const Icon(Icons.add),
        ),
      ],
      backgroundColor: Colors.black,
    );
  }
}
