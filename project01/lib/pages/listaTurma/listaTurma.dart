import 'package:flutter/material.dart';
import 'package:project01/pages/listaTurma/addAluno.dart';
import 'package:project01/pages/listaTurma/chamadaPage.dart';
import 'package:project01/pages/listaTurma/faltantes.dart';
import 'package:project01/pages/outros/genericos.dart';
import 'package:project01/pages/outros/variaveis.dart';

class ListaTurmaPage extends StatefulWidget {
  const ListaTurmaPage({super.key});

  @override
  State<ListaTurmaPage> createState() => _ListaTurmaPageState();
}

class _ListaTurmaPageState extends State<ListaTurmaPage> {
  final List<String> dates = ['01/04', '02/04', '03/04', '04/04', '05/04'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarTopo(title: "Turma 1M1"),
        drawer: MenuLateral(),
        bottomNavigationBar: AppBarBaixo(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const AddAlunoPage()));
                        },
                        child: Icon(Icons.add),
                      )),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                          label:
                              TextButton(onPressed: () {}, child: Text('N°'))),
                      DataColumn(
                          label: TextButton(
                              onPressed: () {}, child: Text('Aluno'))),
                      DataColumn(
                          label: TextButton(
                              onPressed: () {}, child: Text('Faltas'))),
                      for (var date in dates) DataColumn(label: Text(date)),
                    ],
                    rows: alunos.map((aluno) {
                      return DataRow(cells: [
                        DataCell(Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(aluno.id.toString()),
                        )),
                        DataCell(
                            SingleChildScrollView(child: Text(aluno.nome))),
                        DataCell(Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('${aluno.numFalta}'),
                        )),
                        for (var i = 0; i < dates.length; i++)
                          DataCell(
                            SizedBox(
                              width: 50,
                              child: Checkbox(
                                value: aluno.faltas[i],
                                onChanged: (value) {
                                  setState(() {
                                    aluno.faltas[i] = value!;
                                    if (value) {
                                      aluno.numFalta--;
                                    } else {
                                      aluno.numFalta++;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                      ]);
                    }).toList(),
                  ),
                ),
              ],
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
                            builder: (_) => const ChamadaPage()));
                      },
                      child: Text("Chamada"),
                    ),
                  ),
                  SizedBox(
                      height: 40,
                      width: 150,
                      child: FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const FaltantesPage()));
                          },
                          child: Text("Faltantes")))
                ],
              ),
            )
          ],
        ));
  }
}
