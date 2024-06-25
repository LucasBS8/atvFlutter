import 'package:sqfliatividade/model/classes/usuario.dart';
import 'package:sqfliatividade/model/widgets/widgets_repetidos.dart';
import 'package:sqfliatividade/page/usersPage/login_page.dart';
import 'package:sqfliatividade/page/usersPage/nova_senha.dart';
import 'package:sqfliatividade/services/database_helper.dart';
import 'package:flutter/material.dart';

class EsqueceuSenhaPage extends StatefulWidget {
  const EsqueceuSenhaPage({super.key});

  @override
  State<EsqueceuSenhaPage> createState() => _EsqueceuSenhaPageState();
}

class _EsqueceuSenhaPageState extends State<EsqueceuSenhaPage> {
  late Future<List<Usuario>> futureUsuario;
  DatabaseHelper databaseHelper = DatabaseHelper();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Insira seu e-mail",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  _sendEmail();
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(200, 50))),
                child: const Text("Enviar"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(200, 50))),
                child: const Text("Voltar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

//TODO:enviar email
  Future<void> _sendEmail() async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Insira um e-mail válido"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      Usuario? usuarioBuscado =
          await DatabaseHelper.getUsuarioByEmail(emailController.text);
      if (usuarioBuscado != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return NovaSenhaPage(usuario: usuarioBuscado);
        }));
      } else {
        showSnackbar("E-mail não encontrado", context);
      }
    }
  }
}
