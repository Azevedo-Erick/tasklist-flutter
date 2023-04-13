import 'package:avaliacao_mobile/ui/android/screens/task_details.screen.dart';
import 'package:avaliacao_mobile/ui/android/screens/tasks_form.screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/task.model.dart';
import '../../../repositories/task.repository.dart';
import '../widgets/overview_card.widget.dart';

class OverviewScreen extends StatelessWidget {
  OverviewScreen({super.key});

  TaskRepository repository = TaskRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas tarefas"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TasksFormScreen(
                      task: Task(
                          id: 0,
                          name: "",
                          description: "",
                          dataLimite: DateTime.now(),
                          done: false))),
            ), //Navigator.pushNamed(context, '/new-data'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OverviewCardWidget(
                    backGroundColor: Colors.blue,
                    quantity: repository.tasks
                        .where((element) => !element.done)
                        .length
                        .toString(),
                    title: "Tarefas a fazer",
                  ),
                  OverviewCardWidget(
                    backGroundColor: Colors.blue,
                    quantity: repository.tasks
                        .where((element) => element.done)
                        .length
                        .toString(),
                    title: "Tarefas feitas essa semana",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 4, offset: Offset(4, 7))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.black, width: 1)),
              child: Text(
                "Tarefas",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 4, offset: Offset(4, 7))
                  ],
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(7),
                ),
                padding: const EdgeInsets.all(6),
                child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  repository.tasks[index].name,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    decoration: repository.tasks[index].done
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    color: repository.tasks[index].done
                                        ? Colors.grey
                                        : Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  repository.tasks[index].dataLimite
                                      .toIso8601String(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    decoration: repository.tasks[index].done
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    color: repository.tasks[index].done
                                        ? Colors.grey
                                        : Colors.black,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => TaskDetails(
                                                  task:
                                                      repository.tasks[index]),
                                            ),
                                          ),
                                        },
                                    child: const Icon(Icons.search))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    height: 10,
                  ),
                  itemCount: repository.tasks.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
