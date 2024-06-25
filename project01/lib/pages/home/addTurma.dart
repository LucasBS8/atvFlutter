import 'package:flutter/material.dart';
import 'package:project01/pages/outros/genericos.dart';
import 'package:project01/pages/home/homePage.dart';

class AdicionarTurma extends StatefulWidget {
  const AdicionarTurma({super.key, required this.titulo});
  final String titulo;
  @override
  State<AdicionarTurma> createState() => _AdicionarTurmaState();
}

class _AdicionarTurmaState extends State<AdicionarTurma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppbarTopo(title: widget.titulo),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(children: [
            SizedBox(
              width: 400,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 400,
                      height: 150,
                      child: Image.asset(
                        'assets/images/thumbTurma.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.bottomLeft,
                      child: Text('Exemplo',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
                width: 400,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome da turma',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: SizedBox(
                width: 230,
                height: 40,
                child: FilledButton(
                    onPressed: () {
                      setState(
                        () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: const Text('Criado com sucesso!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (_) => const MyHomePage())),
                                  child: const Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text("Aceitar")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: SizedBox(
                width: 230,
                height: 40,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const MyHomePage()));
                    },
                    child: Text(
                      "Cancelar",
                      style: Theme.of(context).textTheme.labelMedium,
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
