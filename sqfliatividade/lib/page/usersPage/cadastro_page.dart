import 'package:sqfliatividade/model/classes/usuario.dart';
import 'package:sqfliatividade/model/widgets/widgets_repetidos.dart';
import 'package:sqfliatividade/page/usersPage/login_page.dart';
import 'package:sqfliatividade/services/database_helper.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  late Future<List<Usuario>> futureUsuario;
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshTaskList();
  }

  void _refreshTaskList() {
    setState(() {
      futureUsuario = DatabaseHelper.getAllUsuarios();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Cadastro",
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                  ),
                ),
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
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: senhaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    nomeValido();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.tertiaryContainer),
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.onTertiaryContainer),
                      fixedSize: MaterialStateProperty.all(const Size(200, 50))),
                  child: const Text("Cadastrar"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));
                  },
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 50))),
                  child: const Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//TODO: Método _add
  void _add() {
    Usuario usuario = Usuario(
      id: null,
      nome: nomeController.text,
      email: emailController.text,
      senha: senhaController.text,
    );
    DatabaseHelper.insertUsuario(usuario).then((value) {
      _refreshTaskList();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }));
    });
  }

//TODO: verifica nome valido
  void nomeValido() {
    if (nomeController.text.isEmpty) {
      showSnackbar('Por favor, insira um nome', context);
    } else {
      emailValido();
    }
  }

  //TODO: Metodo verifica se email é valido
  void emailValido() {
    List<String> email = [
      '@gmail.com',
      '@outlook.com',
      '@hotmail.com',
      '@yahoo.com'
    ];
    if (emailController.text.isEmpty) {
      showSnackbar('Por favor, insira um email', context);
    }
    if (!emailController.text.contains(email[0]) &&
        !emailController.text.contains(email[1]) &&
        !emailController.text.contains(email[2]) &&
        !emailController.text.contains(email[3])) {
      showSnackbar('Por favor, insira um email válido', context);
    } else {
      senhaValida();
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
      _add();
    }
  }
}
