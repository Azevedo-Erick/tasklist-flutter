class Task {
  int id;
  String name;
  String description;
  bool done;
  DateTime dataLimite;

  Task({
    required this.id,
    required this.name,
    required this.description,
    required this.done,
    required this.dataLimite,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      done: json['done'],
      dataLimite: DateTime.parse(json['dataLimite']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'done': done,
      'dataLimite': dataLimite.toIso8601String(),
    };
  }
}
