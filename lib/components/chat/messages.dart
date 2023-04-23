import 'package:chatgpt_clone/components/chat/chat_message.dart';
import 'package:chatgpt_clone/components/chat/empty_messages.dart';
import 'package:chatgpt_clone/models/message.dart';
import 'package:chatgpt_clone/providers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Messages extends StatelessWidget {
  const Messages({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Consumer<MessageProvider>(
      builder: (context, value, _) => value.messages.isEmpty
          ? const EmptyMessages()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: value.messages.length,
                    itemBuilder: (context, index) {
                      Message message = value.messages[index];
                      return MessageCard(message: message);
                    },
                  ),
                ),
                Visibility(
                  visible: isLoading,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SpinKitThreeBounce(
                        color: Colors.green.shade300,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
