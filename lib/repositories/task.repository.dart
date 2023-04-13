import '../models/task.model.dart';

class TaskRepository {
  List<Task> tasks = [
    Task(
      id: 1,
      name: 'Fazer compras no supermercado',
      description: 'Comprar arroz, feijão, carne, legumes e frutas',
      done: false,
      dataLimite: DateTime.now().add(const Duration(days: 1)),
    ),
    Task(
      id: 2,
      name: 'Limpar a casa',
      description: 'Limpar os quartos, banheiros, sala e cozinha',
      done: false,
      dataLimite: DateTime.now().add(const Duration(days: 2)),
    ),
    Task(
      id: 3,
      name: 'Estudar para a prova',
      description: 'Revisar os principais conceitos da matéria',
      done: false,
      dataLimite: DateTime.now().add(const Duration(days: 3)),
    ),
    Task(
      id: 4,
      name: 'Fazer exercícios físicos',
      description: 'Ir à academia ou fazer caminhada no parque',
      done: false,
      dataLimite: DateTime.now().add(const Duration(days: 4)),
    ),
    Task(
      id: 5,
      name: 'Preparar a apresentação do trabalho',
      description: 'Fazer slides e treinar a apresentação',
      done: false,
      dataLimite: DateTime.now().add(const Duration(days: 5)),
    ),
    Task(
      id: 6,
      name: 'Ler o livro recomendado',
      description: 'Ler o livro "O Pequeno Príncipe"',
      done: false,
      dataLimite: DateTime.now().add(const Duration(days: 6)),
    ),
    Task(
      id: 7,
      name: 'Fazer a declaração de imposto de renda',
      description: 'Organizar os documentos e preencher o formulário',
      done: true,
      dataLimite: DateTime.now().add(const Duration(days: 7)),
    ),
    Task(
      id: 8,
      name: 'Atualizar o currículo',
      description: 'Incluir novas experiências e habilidades',
      done: true,
      dataLimite: DateTime.now().add(const Duration(days: 8)),
    ),
    Task(
      id: 9,
      name: 'Fazer um bolo de chocolate',
      description: 'Comprar os ingredientes e seguir a receita',
      done: true,
      dataLimite: DateTime.now().add(const Duration(days: 9)),
    ),
    Task(
      id: 10,
      name: 'Planejar as próximas férias',
      description: 'Escolher o destino, pesquisar hospedagem e passagens',
      done: true,
      dataLimite: DateTime.now().add(const Duration(days: 10)),
    ),
    Task(
      id: 11,
      name: 'Visitar os avós',
      description: 'Ir à casa dos avós para conversar e tomar café',
      done: false,
      dataLimite: DateTime.now().add(const Duration(days: 11)),
    ),
    Task(
      id: 12,
      name: 'Assistir a um filme',
      description: 'Escolher um filme para assistir e preparar pipoca',
      done: false,
      dataLimite: DateTime.now().add(const Duration(days: 12)),
    ),
  ];

  void add(Task task) {
    tasks.add(task);
  }

  void remove(int id) {
    tasks.remove(tasks.where((element) => element.id == id).first);
  }

  void update(int id, Task task) {
    int index = tasks.indexWhere((element) => element.id == id);
    if (index != -1) {
      tasks[index] = task;
    }
  }

  void delete(int id) {
    tasks.removeWhere((element) => element.id == id);
  }
}
