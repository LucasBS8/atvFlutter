import 'package:sqfliatividade/model/classes/tarefa.dart';
import 'package:sqfliatividade/model/classes/usuario.dart';
import 'package:sqfliatividade/model/widgets/card_animado.dart';
import 'package:sqfliatividade/model/widgets/widgets_repetidos.dart';
import 'package:sqfliatividade/page/tasksPages/add_task.dart';
import 'package:sqfliatividade/page/tasksPages/home_page.dart';
import 'package:sqfliatividade/services/database_helper.dart';
import 'package:flutter/material.dart';

class TaskConcluidaPage extends StatefulWidget {
  const TaskConcluidaPage({super.key, required this.usuario});
  final Usuario usuario;
  @override
  State<TaskConcluidaPage> createState() => _TaskConcluidaPageState();
}

class _TaskConcluidaPageState extends State<TaskConcluidaPage> {
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
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage(
                    usuario: widget.usuario,
                  );
                },
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text("Tasks concluídas", style: Theme.of(context).textTheme.titleLarge),
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
                    showSnackbar(
                        "Voce já está na página de tasks concluídas", context);
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
                if (tarefa.finalizada == 1) {
                  return CardAnimada(
                    tarefa: tarefa,
                    usuario: widget.usuario,
                  );
                }
                return null;
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
