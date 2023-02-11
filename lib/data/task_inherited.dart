import 'package:alura_flutter_curso_1/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Tasks> taskList = [
    Tasks('Estudar Flutter', 'assets/images/dash.png', 3),
    Tasks('Andar de Bike', 'assets/images/bike.webp', 4),
    Tasks('Ler', 'assets/images/book.jpeg', 2),
    Tasks(
      'Meditar',
      'assets/images/meditar.jpeg',
      5,
    ),
    Tasks(
      'Jogar',
      'assets/images/jogar.jpeg',
      1,
    ),
  ];

  void newTask(String name, String foto, int difficulty){
    taskList.add(Tasks(name, foto, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
