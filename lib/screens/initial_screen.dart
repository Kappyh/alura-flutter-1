import 'package:alura_flutter_curso_1/components/task.dart';
import 'package:alura_flutter_curso_1/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        leading: Container(),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Tasks('Estudar Flutter', 'assets/images/dash.png', 3),
          ),
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
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
