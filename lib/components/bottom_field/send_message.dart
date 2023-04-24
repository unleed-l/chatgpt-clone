import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SendMessage extends StatefulWidget {
  const SendMessage({
    super.key,
    required this.controller,
    required this.onSubmitted,
    required this.isActive,
  });

  final TextEditingController controller;
  final Function() onSubmitted;
  final bool isActive;

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  bool isEmpty = true;

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() => isEmpty = widget.controller.text.trim().isEmpty);
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final canSend = widget.isActive && !isEmpty;

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
            textAlignVertical: TextAlignVertical.center,
            maxLines: null,
            cursorColor: const Color.fromARGB(255, 80, 192, 148),
            decoration: InputDecoration(
              hintText: 'Enviar mensagem...',
              border: InputBorder.none,
              suffixIconColor: const Color.fromARGB(255, 80, 192, 148),
              suffixIcon: IconButton(
                onPressed: canSend ? widget.onSubmitted : null,
                iconSize: 18,
                icon: const FaIcon(FontAwesomeIcons.solidPaperPlane),
              ),
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
          ),
        ),
      ),
    );
  }
}
