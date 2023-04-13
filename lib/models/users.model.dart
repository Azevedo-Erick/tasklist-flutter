import 'package:avaliacao_mobile/models/task.model.dart';

class User {
  int Id;
  String Username;
  String Email;
  String Name;
  List<Task> Tasks;

  User({
    required this.Id,
    required this.Username,
    required this.Email,
    required this.Name,
    required this.Tasks,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var tasksJson = json['tasks'] as List;
    List<Task> tasks =
        tasksJson.map((taskJson) => Task.fromJson(taskJson)).toList();

    return User(
      Id: json['id'],
      Username: json['username'],
      Email: json['email'],
      Name: json['name'],
      Tasks: tasks,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': Id,
        'username': Username,
        'email': Email,
        'name': Name,
        'tasks': Tasks.map((task) => task.toJson()).toList(),
      };
}
