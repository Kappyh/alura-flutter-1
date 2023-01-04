import 'package:alura_flutter_curso_1/components/task.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {

  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        leading: Container(),
      ),
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 800),
        opacity: opacidade ? 1 : 0,
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Tasks(
                  'Estudar Flutter',
                  'assets/images/dash.png',
                  3
              ),
            ),
            Tasks(
                'Andar de Bike',
                'assets/images/bike.webp',
                4
            ),
            Tasks(
                'Ler',
                'assets/images/book.jpeg',
                2
            ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.redAccent,
        child: opacidade ? const Icon(Icons.remove_red_eye) : const Icon(Icons.panorama_fish_eye),
      ),
    );
  }
}