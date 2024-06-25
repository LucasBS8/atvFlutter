import 'package:flutter/material.dart';
import 'package:project01/pages/inicio_login/cadastro.dart';
import 'package:project01/pages/home/homePage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Diário do professor',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
              child: Image.asset('assets/images/logo.png'),
            ),
            Text("Login",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
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
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: SizedBox(
                width: 230,
                height: 40,
                child: FilledButton(
                    onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const MyHomePage()));},
                    child: Text(
                      "Entrar"
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: SizedBox(
                width: 230,
                height: 40,
                child: OutlinedButton(
                    onPressed: () {
Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const Cadastro()));
                    },
                    child: Text(
                      "Cadastrar-se",
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
