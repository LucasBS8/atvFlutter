import 'package:flutter/material.dart';
import 'package:project01/pages/home/addTurma.dart';
import 'package:project01/pages/outros/genericos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppbarTopo(title: "Diário do professor"),
      bottomNavigationBar: AppBarBaixo(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              SearchBar(
                leading: Icon(Icons.search),
                padding: MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
              ),
              Column(children: [
                ModelBtnTurma(
                  title: '1M1',
                )
              ])
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const AdicionarTurma(titulo: "Adicionar turma",)));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
