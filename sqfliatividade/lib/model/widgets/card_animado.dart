import 'package:sqfliatividade/model/classes/tarefa.dart';
import 'package:sqfliatividade/model/classes/usuario.dart';
import 'package:sqfliatividade/model/widgets/widgets_repetidos.dart';
import 'package:sqfliatividade/page/tasksPages/task_page.dart';
import 'package:sqfliatividade/services/database_helper.dart';
import 'package:flutter/material.dart';

//TODO: Card animada
class CardAnimada extends StatefulWidget {
  const CardAnimada({super.key, required this.tarefa, required this.usuario});
  final Tarefa tarefa;
  final Usuario usuario;

  @override
  State<CardAnimada> createState() => _CardAnimadaState();
}

class _CardAnimadaState extends State<CardAnimada> {
  late Future<List<Tarefa>> futureTarefa;
  DatabaseHelper databaseHelper = DatabaseHelper();
  late Color cardCor = Theme.of(context).colorScheme.primaryContainer;
  double dx = 0.0;
  void _refreshTaskList() {
    setState(() {
      futureTarefa = DatabaseHelper.getAllTarefas();
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime dataHora = DateTime.parse(widget.tarefa.dataHora);
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: dx,
            top: 0,
            child: GestureDetector(
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  dx += details.delta.dx;
                  if (dx < -100) {
                    cardCor = Theme.of(context).colorScheme.inversePrimary;
                  } else if (dx > 100) {
                    cardCor = Theme.of(context).colorScheme.errorContainer;
                  } else {
                    cardCor = Theme.of(context).colorScheme.primaryContainer;
                  }
                });
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                setState(() {
                  if (dx < -100) {
                    editarTask(widget.tarefa, context, widget.usuario);
                    _refreshTaskList();
                  } else if (dx > 100) {
                    excluirTask(context, widget.tarefa, widget.usuario);
                    _refreshTaskList();
                  }
                  cardCor = Theme.of(context).colorScheme.primaryContainer;
                  dx = 0.0;
                });
              },
              child: _cardCorpo(widget.tarefa, dataHora, cardCor),
            ),
          ),
        ],
      ),
    );
  }

//TODO: Método cardCorpo
  Widget _cardCorpo(Tarefa tarefa, DateTime dataHora, Color cardCor) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: Card(
        color: cardCor,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TaskPage(
                    usuario: widget.usuario,
                    tarefa: tarefa,
                  );
                },
              ),
            );
          },
          child: Container(
            height: 90,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tarefa.titulo,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${dataHora.day}/${dataHora.month}/${dataHora.year}",
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "${dataHora.hour}:${dataHora.minute}",
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
