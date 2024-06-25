import 'package:sqfliatividade/page/tasksPages/task_concluida_page.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:sqfliatividade/model/classes/tarefa.dart';
import 'package:sqfliatividade/model/classes/usuario.dart';
import 'package:sqfliatividade/model/widgets/widgets_repetidos.dart';
import 'package:sqfliatividade/page/tasksPages/home_page.dart';
import 'package:sqfliatividade/services/database_helper.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key, required this.usuario});
  final Usuario usuario;
  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  late Future<List<Tarefa>> futureTarefa;
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    futureTarefa = DatabaseHelper.getTarefasUsuario(widget.usuario);
  }

  void _refreshTaskList() {
    setState(() {
      futureTarefa = DatabaseHelper.getTarefasUsuario(widget.usuario);
    });
  }

  @override
  Widget build(BuildContext context) {
    _refreshTaskList();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage(usuario: widget.usuario);
                },
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text("Adicionar task",
            style: Theme.of(context).textTheme.titleLarge),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: const Text("Nova task"),
                  onTap: () {
                    showSnackbar(
                        "Voce já está na página de adicionar task", context);
                  },
                ),
                PopupMenuItem(
                  child: const Text("Tasks concluídas"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TaskConcluidaPage(
                            usuario: widget.usuario,
                          );
                        },
                      ),
                    );
                  },
                )
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: tituloController,
                    maxLength: 20,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Título',
                    ),
                  ),
                  DateTimeField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Data',
                    ),
                    value: selectedDate,
                    onChanged: (value) {
                      setState(() {
                        selectedDate = value!;
                      });
                    },
                  ),
                  TextField(
                    controller: descricaoController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descrição',
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 50,
              width: 150,
              child: FilledButton(
                onPressed: () {
                  _add();
                },
                child: const Text("Salvar"),
              ),
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancelar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

//TODO: Método _add
  void _add() {
    if (tituloController.text.isNotEmpty &&
        descricaoController.text.isNotEmpty) {
      DatabaseHelper.insertTarefa(Tarefa(
        id: null,
        titulo: tituloController.text,
        descricao: descricaoController.text,
        dataHora: selectedDate.toIso8601String(),
        finalizada: 0,
        idUsuario: widget.usuario.id!,
      )).then((newTaskId) {
        showSnackbar('Tarefa adicionada com sucesso!', context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage(usuario: widget.usuario);
            },
          ),
        );
      }).catchError((error) {
        showSnackbar('Falha ao adicionar tarefa: $error', context);
      });
    } else {
      showSnackbar('Por favor, preencha todos os campos.', context);
    }
  }
}
