import 'package:chatgpt_clone/models/enums/role_enum.dart';
import 'package:uuid/uuid.dart';

class Message {
  final String uuid;
  final Role role;
  final String content;

  Message({
    required String content,
    required this.uuid,
    required this.role,
  }) : content = content.trim();

  Map<String, dynamic> messageToMap() =>
      {'role': role.type, 'content': content};

  factory Message.fromGPTMap(Map<String, dynamic> message) => Message(
        uuid: const Uuid().v4(),
        role: Role.assistant,
        content: message['content'] ?? '',
      );
}
