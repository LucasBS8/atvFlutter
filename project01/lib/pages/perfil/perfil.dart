import 'package:flutter/material.dart';
import 'package:project01/pages/blocoDeNota/blocoNotasModel.dart';
import 'package:project01/pages/outros/genericos.dart';
import 'package:project01/pages/outros/variaveis.dart';
import 'package:project01/pages/perfil/alterarRegistro.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String trecho = nota.substring(0, 150);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarTopo(title: "Perfil"),
      drawer: MenuLateral(),
      bottomNavigationBar: AppBarBaixo(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Image.asset("assets/images/perfil.png"),
                Text("Nome professor",
                    style: Theme.of(context).textTheme.titleLarge),
                Text("Email@gmail.com",
                    style: Theme.of(context).textTheme.titleSmall),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    children: [
                      FloatingActionButton.small(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const AlterarRegistro()));
                        },
                        child: Icon(Icons.mode_edit_outline_outlined),
                      )
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.all(12),
              color: Colors.deepPurple[400],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("2", style: Theme.of(context).textTheme.titleLarge),
                      Text("Turma(s)",
                          style: Theme.of(context).textTheme.titleLarge)
                    ],
                  ),
                  Column(
                    children: [
                      Text("20", style: Theme.of(context).textTheme.titleLarge),
                      Text("Aluno(s)",
                          style: Theme.of(context).textTheme.titleLarge)
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bloco de notas",
                      style: Theme.of(context).textTheme.titleLarge),
                  Divider(),
                  Text("$trecho...")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.topRight,
              child: SizedBox(
                  height: 40,
                  width: 120,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocoNotasModel(
                              name: "Bloco de nota",
                              texto: nota,
                            ),
                          ),
                        );
                      },
                      child: Text('Ler mais'))),
            )
          ],
        ),
      ),
    );
  }
}
