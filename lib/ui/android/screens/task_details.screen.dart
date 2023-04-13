import 'package:avaliacao_mobile/ui/android/screens/tasks_form.screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../blocs/task_details.bloc.dart';
import '../../../models/task.model.dart';

class TaskDetails extends StatelessWidget {
  TaskDetailsBloc bloc = TaskDetailsBloc();
  TaskDetails({required Task task, super.key}) {
    bloc.task = task;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Minhas tarefas"),
          actions: [
            IconButton(
                onPressed: () =>
                    {bloc.delete(bloc.task), Navigator.pop(context)},
                icon: const Icon(Icons.delete)),
            const SizedBox(width: 20),
            IconButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TasksFormScreen(task: bloc.task),
                        ),
                      ),
                    },
                icon: const Icon(Icons.edit)),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 7))
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              bloc.task.name,
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              bloc.task.dataLimite.toIso8601String(),
                              style: GoogleFonts.roboto(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      !bloc.task.done
                          ? TextButton(
                              onPressed: null,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 4,
                                        offset: Offset(4, 7))
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: Text(
                                    "Concluir",
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(4, 7))
                      ],
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade400,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          bloc.task.description,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ))),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(4, 7))
                      ],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      color: bloc.task.done
                          ? Colors.green.shade600
                          : Colors.red.shade600),
                  child: Center(
                    child: Text(
                      bloc.task.done ? "Concluído" : "Incompleto",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
