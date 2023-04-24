import 'package:chatgpt_clone/models/message.dart';
import 'package:chatgpt_clone/models/enums/role_enum.dart';
import 'package:chatgpt_clone/providers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({
    super.key,
    required this.controller,
    required this.setLoad,
    required this.isActive,
  });

  final TextEditingController controller;
  final Function(bool) setLoad;
  final bool isActive;

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  bool isNotEmpty = false;

  Future<void> ask(MessageProvider messageProvider) async {
    if (widget.controller.text.trim().isEmpty) return;

    final String message = widget.controller.text;
    widget.controller.clear();

    widget.setLoad(true);
    try {
      await messageProvider.doAsk(
        Message(
          uuid: const Uuid().v4(),
          role: Role.user,
          content: message,
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
    widget.setLoad(false);
  }

  onChanged(String text) {
    if ((text.trim().isNotEmpty && !isNotEmpty) ||
        (text.trim().isEmpty && isNotEmpty)) {
      setState(() => isNotEmpty = !isNotEmpty);
    }
  }

  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MessageProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Theme.of(context).colorScheme.primary,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: screenHeight * .15),
          child: TextFormField(
            controller: widget.controller,
            enabled: widget.isActive,
            maxLines: null,
            cursorColor: const Color.fromARGB(255, 80, 192, 148),
            decoration: InputDecoration(
              hintText: 'Enviar mensagem...',
              border: InputBorder.none,
              suffixIconColor: const Color.fromARGB(255, 80, 192, 148),
              suffixIcon: IconButton(
                onPressed: widget.isActive && isNotEmpty
                    ? () => ask(messageProvider)
                    : null,
                iconSize: 18,
                icon: const FaIcon(FontAwesomeIcons.solidPaperPlane),
              ),
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
