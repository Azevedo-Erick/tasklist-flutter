import 'package:avaliacao_mobile/models/task.model.dart';
import 'package:flutter/material.dart';

class TasksFormScreen extends StatefulWidget {
  TasksFormScreen({required this.task, super.key});
  Task task;
  @override
  State<TasksFormScreen> createState() => _TasksFormScreenState();
}

class _TasksFormScreenState extends State<TasksFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário de Tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) => {widget.task.name = value!},
              decoration: const InputDecoration(
                  hintText: "Titulo",
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                  fillColor: Color.fromARGB(22, 68, 137, 255),
                  filled: true,
                  prefixIcon: Icon(Icons.person)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              onSaved: (value) => {widget.task.description = value!},
              decoration: const InputDecoration(
                  hintText: "Descrição",
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none),
                  fillColor: Color.fromARGB(22, 68, 137, 255),
                  filled: true,
                  prefixIcon: Icon(Icons.person)),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Text("Fazer"),
                Switch(
                    value: widget.task.done,
                    onChanged: (value) => {widget.task.done = value}),
                const Text("Feito"),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              child: Text(
                  "Data Limite: ${widget.task.dataLimite.day}/${widget.task.dataLimite.month}/${widget.task.dataLimite.year}"),
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2013),
                    lastDate: DateTime(2040));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF448AFF),
                  padding: const EdgeInsets.all(20)),
              child: const Text(
                "Cadastrar",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
