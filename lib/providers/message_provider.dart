import 'dart:convert';

import 'package:chatgpt_clone/models/message.dart';
import 'package:chatgpt_clone/utils/configs.dart' as configs;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MessageProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Message> _messages = [];

  List<Message> get messages => [..._messages.reversed];

  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }

  void removeMessage(Message message) {
    _messages.removeWhere((msg) => msg.uuid == message.uuid);
    notifyListeners();
  }

  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }

  Future<void> doAsk(Message message) async {
    addMessage(message);
    List<Map<String, dynamic>> messagesMap = [
      for (Message msg in _messages) msg.messageToMap()
    ];

    final response = await http
        .post(
          Uri.parse(configs.link),
          headers: configs.headers,
          body: jsonEncode({
            'model': configs.model,
            'messages': messagesMap,
            'temperature': 0.5,
          }),
        )
        .onError((error, stackTrace) =>
            throw 'Não foi possível conectar. Verifique sua conexão de rede.');

    if (response.statusCode == 200) {
      final dadosBody = jsonDecode(utf8.decode(response.bodyBytes));
      final Map<String, dynamic>? message = dadosBody['choices'][0]['message'];

      if (message == null) {
        throw 'Ocorreu um erro com a sua solicitação. ${response.statusCode}';
      }

      addMessage(Message.fromGPTMap(message));
    } else {
      throw 'Ocorreu um erro com a sua solicitação. ${response.statusCode}';
    }
  }
}
