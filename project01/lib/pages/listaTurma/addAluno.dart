import 'package:flutter/material.dart';
import 'package:project01/pages/listaTurma/listaTurma.dart';
import 'package:project01/pages/outros/genericos.dart';

class AddAlunoPage extends StatefulWidget {
  const AddAlunoPage({super.key});

  @override
  State<AddAlunoPage> createState() => _AddAlunoPageState();
}

class _AddAlunoPageState extends State<AddAlunoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarTopo(
        title: "Adicionar aluno",
      ),
      drawer: MenuLateral(),
      bottomNavigationBar: AppBarBaixo(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome do aluno',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: 230,
                    height: 45,
                    child: FilledButton(
                        onPressed: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content:
                                    const Text('Aluno adicionado com sucesso!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (_) =>
                                                const ListaTurmaPage())),
                                    child: const Text('Ok'),
                                  ),
                                ],
                              ),
                            );
                          });
                        },
                        child: Text("Adicionar"))),
                SizedBox(
                    width: 230,
                    height: 45,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop(context);
                        },
                        child: Text("Cancelar"))),
              ],
            ),
          )
        ],
      )),
    );
  }
}
