import 'package:chatgpt_clone/components/appbar/custom_appbar.dart';
import 'package:chatgpt_clone/components/chat/message_list.dart';
import 'package:chatgpt_clone/components/bottom_field/send_message.dart';
import 'package:chatgpt_clone/models/enums/role_enum.dart';
import 'package:chatgpt_clone/models/message.dart';
import 'package:chatgpt_clone/providers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final messageController = TextEditingController();
  final _scrollController = ScrollController();
  late AnimationController _animationController;
  bool _isLoading = false;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: 500.ms);
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  setLoading(bool load) => setState(() => _isLoading = load);

  Future<void> _onSubmitted() async {
    if (messageController.text.trim().isEmpty) return;
    final messageProvider =
        Provider.of<MessageProvider>(context, listen: false);
    final String msg = messageController.text;

    if (messageProvider.messages.isNotEmpty) {
      await _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: 300.ms,
        curve: Curves.easeOut,
      );
    }

    messageController.clear();

    setLoading(true);
    try {
      await messageProvider.doAsk(
        Message(
          uuid: const Uuid().v4(),
          role: Role.user,
          content: msg,
        ),
      );
    } catch (e) {
      messageProvider.addMessage(
        Message(
          uuid: const Uuid().v4(),
          role: Role.system,
          content: e.toString(),
        ),
      );
    }
    setLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final hideChat = isKeyboardVisible && isLandscape;

    Provider.of<MessageProvider>(context).addListener(() {
      _animationController.reset();
      _animationController.forward();
    });

    return Scaffold(
      appBar: hideChat ? null : CustomAppBar(isActive: !_isLoading),
      body: SafeArea(
        child: Column(
          children: [
            Visibility(
              visible: !hideChat,
              child: Expanded(
                child: MessageList(
                  controller: _scrollController,
                  isLoading: _isLoading,
                  animationController: _animationController,
                ),
              ),
            ),
            SendMessage(
              controller: messageController,
              isActive: !_isLoading,
              onSubmitted: _onSubmitted,
            ),
          ],
        ),
      ),
    );
  }
}
