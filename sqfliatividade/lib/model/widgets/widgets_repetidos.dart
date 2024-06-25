import 'package:sqfliatividade/model/classes/tarefa.dart';
import 'package:sqfliatividade/model/classes/usuario.dart';
import 'package:sqfliatividade/page/tasksPages/home_page.dart';
import 'package:sqfliatividade/services/database_helper.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';


//TODO: Método showSnackbar
void showSnackbar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

//TODO: Método excluirTask
Future excluirTask(BuildContext context, Tarefa tarefa, Usuario usuario) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Center(
        child: Text(
          "Excluir",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(2),
                  shadowColor: MaterialStatePropertyAll(Colors.black),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () {
                  DatabaseHelper.deleteTarefa(tarefa);
                  showSnackbar("Tarefa excluída", context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage(usuario: usuario);
                      },
                    ),
                  );
                },
                child: const Text("Excluir"),
              ),
            ),
            SizedBox(
              width: 120,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Voltar"),
              ),
            ),
          ],
        ),
      ],
      content: Text(
        "Tem certeza que você deseja excluir essa tarefa?",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    ),
  );
}

//TODO: Método editarTask
Future editarTask(Tarefa tarefa, BuildContext context, Usuario usuario) {
  DateTime dataHora = DateTime.parse(tarefa.dataHora);
  TextEditingController tituloController =
      TextEditingController(text: tarefa.titulo);
  TextEditingController descricaoController =
      TextEditingController(text: tarefa.descricao);
  int finalizada = tarefa.finalizada;
  return showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: const Center(child: Text("Editar")),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Finalizada"),
                      Switch(
                        value: finalizada == 1,
                        onChanged: (value) {
                          setState(() {
                            finalizada = value ? 1 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: tituloController,
                    maxLength: 20,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: "Título",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DateTimeField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Data',
                    ),
                    value: dataHora,
                    onChanged: (value) {
                      setState(() {
                        dataHora = value!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: descricaoController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: "Descrição",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          _edit(
                              Tarefa(
                                id: tarefa.id,
                                titulo: tituloController.text,
                                descricao: descricaoController.text,
                                dataHora: dataHora.toString(),
                                finalizada: finalizada,
                                idUsuario: tarefa.idUsuario,
                              ),
                              context,
                              usuario);
                        },
                        child: const Text("Salvar"),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Voltar"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

//TODO: Método_edit
void _edit(Tarefa tarefa, BuildContext context, Usuario usuario) {
  if (tarefa.titulo.isNotEmpty && tarefa.descricao.isNotEmpty) {
    DatabaseHelper.updateTarefa(
      Tarefa(
        id: tarefa.id,
        titulo: tarefa.titulo,
        descricao: tarefa.descricao,
        dataHora: tarefa.dataHora,
        finalizada: tarefa.finalizada,
        idUsuario: tarefa.idUsuario,
      ),
    ).then((_) {
      showSnackbar('Tarefa atualizada com sucesso!', context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage(usuario: usuario);
          },
        ),
      );
    }).catchError((error) {
      showSnackbar('Falha ao atualizar tarefa: $error', context);
    });
  } else {
    showSnackbar('Por favor, preencha todos os campos.', context);
  }
}
