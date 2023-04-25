import 'package:chatgpt_clone/components/chat/message_row.dart';
import 'package:chatgpt_clone/components/chat/empty_messages.dart';
import 'package:chatgpt_clone/providers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class MessageList extends StatelessWidget {
  const MessageList({
    super.key,
    required this.controller,
    required this.isLoading,
    required this.animationController,
  });

  final ScrollController controller;
  final bool isLoading;
  final AnimationController animationController;

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
                    controller: controller,
                    itemCount: value.messages.length,
                    itemBuilder: (context, index) => MessageRow(
                      message: value.messages.elementAt(index),
                      animate: index == 0,
                      animationController: animationController,
                    ),
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
