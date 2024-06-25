import 'package:flutter/material.dart';
import 'package:project01/pages/perfil/perfil.dart';

class AlterarRegistro extends StatefulWidget {
  const AlterarRegistro({super.key});

  @override
  State<AlterarRegistro> createState() => _AlterarRegistroState();
}

class _AlterarRegistroState extends State<AlterarRegistro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
              child: Image.asset('assets/images/perfil.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Repita a senha',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: SizedBox(
                width: 230,
                height: 40,
                child: FilledButton(
                    onPressed: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: const Text('Dados alterados com sucesso!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => const PerfilPage()));
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );

                      });
                    },
                    child: Text("Salvar")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: SizedBox(
                width: 230,
                height: 40,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    child: Text(
                      "Voltar",
                      style: Theme.of(context).textTheme.labelMedium,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
