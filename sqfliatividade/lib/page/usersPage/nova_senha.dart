import 'package:sqfliatividade/model/classes/usuario.dart';
import 'package:sqfliatividade/model/widgets/widgets_repetidos.dart';
import 'package:sqfliatividade/page/usersPage/login_page.dart';
import 'package:sqfliatividade/services/database_helper.dart';
import 'package:flutter/material.dart';

class NovaSenhaPage extends StatefulWidget {
  const NovaSenhaPage({super.key, required this.usuario});
  final Usuario usuario;

  @override
  State<NovaSenhaPage> createState() => _NovaSenhaPageState();
}

class _NovaSenhaPageState extends State<NovaSenhaPage> {
  late Future<List<Usuario>> futureUsuario;
  DatabaseHelper databaseHelper = DatabaseHelper();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Insira sua nova senha",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: senhaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nova Senha',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: confirmarSenhaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirme a nova senha',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                senhaValida();
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
    );
  }

  void _updateUsuario() {
    if (senhaController.text == confirmarSenhaController.text &&
        senhaController.text.isNotEmpty &&
        confirmarSenhaController.text.isNotEmpty) {
      Usuario usuario = Usuario(
        id: widget.usuario.id,
        nome: widget.usuario.nome,
        email: widget.usuario.email,
        senha: senhaController.text,
      );
      DatabaseHelper.updateUsuario(usuario);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }));
      showSnackbar("Senha alterada com sucesso", context);
    } else {
      showSnackbar("Digite nas duas caixas de texto", context);
    }
  }

  // TODO:metodo senha valida
  void senhaValida() {
    if (senhaController.text.isEmpty) {
      showSnackbar('Por favor, insira uma senha', context);
    } else if (senhaController.text.length < 8) {
      showSnackbar('A senha deve ter no mínimo 8 caracteres', context);
    } else if (!senhaController.text.contains(RegExp('[0-9]'))) {
      showSnackbar('A senha deve conter números', context);
    } else if (!senhaController.text.contains(RegExp('[A-Z]'))) {
      showSnackbar('A senha deve conter letras maiúsculas', context);
    } else if (!senhaController.text.contains(RegExp('[a-z]'))) {
      showSnackbar('A senha deve conter letras minúsculas', context);
    } else {
      _updateUsuario();
    }
  }
}
