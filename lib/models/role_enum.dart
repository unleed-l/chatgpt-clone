enum Role {
  system(type: 'system'),
  user(type: 'user'),
  assistant(type: 'assistant');

  const Role({required this.type});

  final String type;
}
