import 'package:alura_flutter_curso_1/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key,  required this.taskContext}) : super(key: key);
  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late AnimationController _controller;
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Nova tarefa'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                  height: 650,
                  width: 375,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if(value != null && value.isEmpty){
                              return 'Insira o nome da tarefa';
                            }
                            return null;
                          },
                          controller: nameController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Nome',
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if(value!.isEmpty || int.parse(value) > 5
                                || int.parse(value) < 1 ){
                              return 'Insira uma dificuldade entre 1 e 5';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          controller: difficultyController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Dificuldade',
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if( value!.isEmpty){
                              return 'Insira uma URL de imagem';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.url,
                          controller: imageController,
                          onChanged: (text)=>{
                            setState((){
                            })
                          },
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Imagem',
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 72,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2.0,
                            color: Colors.blue,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageController.text,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stacktrace){
                              return Image.asset('assets/images/nophoto.png');
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){

                             TaskInherited.of(widget.taskContext)
                                 .newTask(nameController.text, imageController.text, int.parse(difficultyController.text));

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Criando uma nova tarefa'))
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Adicionar'),
                      ),
                    ],
                  )),
            ),
          )),
    );
  }
}
