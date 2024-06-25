import 'package:sqfliatividade/model/classes/tarefa.dart';
import 'package:sqfliatividade/model/classes/usuario.dart';
import 'package:sqfliatividade/model/widgets/card_animado.dart';
import 'package:sqfliatividade/page/tasksPages/add_task.dart';
import 'package:sqfliatividade/page/tasksPages/task_concluida_page.dart';
import 'package:sqfliatividade/services/database_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.usuario});
  final Usuario usuario;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Tarefa>> futureTarefa;
  
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _refreshTaskList();
  }

  void _refreshTaskList() {
    setState(() {

      futureTarefa = DatabaseHelper.getAllTarefas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Task", style: Theme.of(context).textTheme.titleLarge),
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
      body: FutureBuilder<List<Tarefa>>(
        future: DatabaseHelper.getTarefasUsuario(widget.usuario),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Tarefa tarefa = snapshot.data![index];
                return CardAnimada(
                  tarefa: tarefa,
                  usuario: widget.usuario,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
