import 'package:sqfliatividade/page/tasksPages/home_page.dart';
import 'package:sqfliatividade/page/usersPage/cadastro_page.dart';
import 'package:sqfliatividade/page/usersPage/esqueceu_senha_page.dart';
import 'package:sqfliatividade/services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqfliatividade/model/classes/usuario.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Future<List<Usuario>> futureUsuario;
  DatabaseHelper databaseHelper = DatabaseHelper();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          heightFactor: 1.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("TaskFy", style: Theme.of(context).textTheme.displayMedium),
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 30),
                      height: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'E-mail',
                            ),
                          ),
                          TextField(
                            controller: senhaController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Senha',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(bottom: 30),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const EsqueceuSenhaPage();
                            }));
                          },
                          child: const Text("Recuperar senha")),
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            DatabaseHelper.login(
                                    emailController.text, senhaController.text)
                                .then((value) {
                              if (value != null) {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage(usuario: value);
                                }));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Usuário ou senha inválidos')));
                              }
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context)
                                      .colorScheme
                                      .tertiaryContainer),
                              foregroundColor: MaterialStateProperty.all(
                                  Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer),
                              fixedSize: MaterialStateProperty.all(
                                  const Size(200, 50))),
                          child: const Text("Logar"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const CadastroPage();
                              }));
                            },
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(200, 50))),
                            child: const Text("Cadastre-se"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
