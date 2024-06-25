import 'package:flutter/material.dart';
import 'package:project01/pages/listaTurma/chamadaPage.dart';
import 'package:project01/pages/listaTurma/listaTurma.dart';
import 'package:project01/pages/outros/genericos.dart';
import 'package:project01/pages/outros/variaveis.dart';

class FaltantesPage extends StatefulWidget {
  const FaltantesPage({super.key});

  @override
  State<FaltantesPage> createState() => _FaltantesPageState();
}

class _FaltantesPageState extends State<FaltantesPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: AppBarBaixo(),
      drawer: MenuLateral(),
      appBar: AppbarTopo(title: "Faltantes 1M1"),
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
                      Text("faltas"),
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
                      child: Text('${alunos[index].id}',style: Theme.of(context).textTheme.titleMedium,)),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(alunos[index].nome),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('${alunos[index].numFalta}',style: Theme.of(context).textTheme.titleMedium,),
                  )
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
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ListaTurmaPage()));
                    },
                    child: Text("Lista de alunos"),
                  ),
                ),
                SizedBox(
                    height: 40,
                    width: 150,
                    child: FilledButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const ChamadaPage()));
                        },
                        child: Text("Chamada")))
              ],
            ),
          )
        ],
      ),
    );
  }
}