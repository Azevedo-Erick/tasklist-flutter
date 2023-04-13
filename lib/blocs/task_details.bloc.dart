import 'package:avaliacao_mobile/repositories/task.repository.dart';

import '../models/task.model.dart';

class TaskDetailsBloc {
  Task _task = Task(
    dataLimite: DateTime.now(),
    name: "Tarefa",
    description: "Desc",
    done: false,
    id: 1,
  );
  Task get task {
    return _task;
  }

  set task(Task task) {
    _task = task;
  }

  TaskRepository repository = TaskRepository();
  void delete(Task task) {
    repository.delete(task.id);
  }
}
