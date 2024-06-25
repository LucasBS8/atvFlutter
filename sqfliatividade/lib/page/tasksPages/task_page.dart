import 'package:sqfliatividade/page/tasksPages/add_task.dart';
import 'package:sqfliatividade/page/tasksPages/task_concluida_page.dart';
import 'package:flutter/material.dart';
import 'package:sqfliatividade/model/classes/tarefa.dart';
import 'package:sqfliatividade/model/classes/usuario.dart';
import 'package:sqfliatividade/model/widgets/widgets_repetidos.dart';
import 'package:sqfliatividade/services/database_helper.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key, required this.usuario, required this.tarefa});
  final Usuario usuario;
  final Tarefa tarefa;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late Future<Tarefa> futureTarefa;
  DateTime dataHora = DateTime.now();
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  int finalizada = 0;

  void _refreshTask() {
    setState(() {
      futureTarefa = DatabaseHelper.getTarefasUsuarioById(
          widget.usuario, widget.tarefa.id ?? 0);
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshTask();
  }

  @override
  Widget build(BuildContext context) {
    _refreshTask();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.tarefa.titulo,
            style: Theme.of(context).textTheme.titleLarge),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: const Text("Nova task"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddTaskPage(
                            usuario: widget.usuario,
                          );
                        },
                      ),
                    );
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
        child: Column(
          children: [
            notifiConcluido(),
                      Text("*Clique no botão \"editar\" para alterar o status da task",textAlign: TextAlign.left),
            FutureBuilder<Tarefa>(
              future: futureTarefa,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  Tarefa tarefa = snapshot.data!;
                  tituloController.text = tarefa.titulo;
                  descricaoController.text = tarefa.descricao;
                  finalizada = tarefa.finalizada;
                  dataHora = DateTime.parse(tarefa.dataHora);
                  return _corpoPage(tarefa);
                } else {
                  return const Text("Tarefa não encontrada.");
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: FutureBuilder<Tarefa>(
        future: futureTarefa,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buttonEditDelete(snapshot.data!);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

//TODO: Método _corpoPage
  Widget _corpoPage(Tarefa tarefa) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.74,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: TextEditingController(
                      text:
                          "${dataHora.day}/${dataHora.month}/${dataHora.year}",
                    ),
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Data',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: TextEditingController(
                      text: "${dataHora.hour}:${dataHora.minute}",
                    ),
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Hora',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: descricaoController,
                    readOnly: true,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descrição',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//TODO: Método buttonEditDelete
  Widget buttonEditDelete(Tarefa tarefa) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: const ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              backgroundColor: MaterialStatePropertyAll(Colors.red),
            ),
            onPressed: () {
              excluirTask(context, tarefa, widget.usuario);
            },
            child: const SizedBox(
              height: 50,
              width: 100,
              child: Center(child: Text("Excluir")),
            ),
          ),
          FilledButton(
            onPressed: () {
              editarTask(tarefa, context, widget.usuario);
            },
            child: const SizedBox(
              height: 50,
              width: 100,
              child: Center(child: Text("Editar")),
            ),
          ),
        ],
      ),
    );
  }

//TODO:Método notifiConcluido
  Container notifiConcluido() {
    if (widget.tarefa.finalizada == 1) {
      return Container(
        alignment: Alignment.topLeft,
        child: const Center(
          child: Text(
            "Task concluída",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.topLeft,
        child: const Center(
          child: Text(
            "Task não concluída",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }
}
