class Todo {
  final String id;
  final String text;
  final bool completed;

  const Todo({required this.id, required this.text, required this.completed});

  Todo copyWith({
    String? id,
    String? text,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      completed: completed ?? this.completed,
    );
  }
}
