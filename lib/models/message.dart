import 'package:chatgpt_clone/models/role_enum.dart';
import 'package:uuid/uuid.dart';

class Message {
  final String uuid;
  final Role role;
  final String content;

  const Message({
    required this.uuid,
    required this.role,
    required this.content,
  });

  Map<String, dynamic> messageToMap() => {
        'role': role.type,
        'content': content,
      };

  static Role _stringToRole(String role) {
    switch (role) {
      case 'assistant':
        return Role.assistant;
      default:
        return Role.system;
    }
  }

  factory Message.fromMap(Map<String, dynamic> message) => Message(
        uuid: const Uuid().v4(),
        role: _stringToRole(message['role'] ?? ''),
        content: message['content'] ?? '',
      );
}
