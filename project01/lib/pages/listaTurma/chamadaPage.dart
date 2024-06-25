import 'package:flutter/material.dart';
import 'package:project01/pages/listaTurma/listaTurma.dart';
import 'package:project01/pages/outros/genericos.dart';
import 'package:project01/pages/outros/variaveis.dart';

class ChamadaPage extends StatefulWidget {
  const ChamadaPage({super.key});

  @override
  State<ChamadaPage> createState() => _ChamadaPageState();
}

class _ChamadaPageState extends State<ChamadaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBarBaixo(),
      drawer: MenuLateral(),
      appBar: AppbarTopo(title: "Turma 1M1"),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(0, 10, 10, 10))),
                  child: Row(
                    children: [
                      Text("N°"),
                      Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                  onPressed: () {
                    // Add filter functionality by ID
                  },
                ),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(0, 10, 10, 10))),
                  child: Row(
                    children: [
                      Text("Nome"),
                      Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(0, 10, 10, 10))),
                  child: Row(
                    children: [
                      Text("Visto"),
                      Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: alunos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        '${alunos[index].id}',
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(alunos[index].nome),
                  ),
                  trailing: Checkbox(
                    value: alunos[index].isChecked,
                    onChanged: (value) {
                      setState(() {
                        alunos[index].isChecked = value!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  width: 150,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancelar"),
                  ),
                ),
                SizedBox(
                    height: 40,
                    width: 150,
                    child: FilledButton(
                        onPressed: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: const Text('Salvo com sucesso!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ListaTurmaPage())),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          });
                        },
                        child: Text("Salvar")))
              ],
            ),
          )
        ],
      ),
    );
  }
}
