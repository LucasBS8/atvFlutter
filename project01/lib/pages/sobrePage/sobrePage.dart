import 'package:flutter/material.dart';
import 'package:project01/pages/outros/genericos.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({super.key});

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarTopo(title: "Diário do professor"),
      drawer: MenuLateral(),
      bottomNavigationBar: AppBarBaixo(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("SOBRE", style: Theme.of(context).textTheme.titleLarge),
          Center(
            child: Text(
              "\nO Diário do professor é um aplicativo que permite aos usuários cadastrar com suas contas e e-mail. Com o Diário do professor, você pode armazenar informações importantes sobre as turmas, alunos e notas dos alunos do professor."
              "\nPolítica de privacidade:"
              "\nO DP.System respeita sua privacidade. Para saber mais sobre como coletamos e usamos seus dados, visite nossa política de privacidade."
              "\nTermos de serviço:"
              "\nPor favor, leia nossos termos de serviço antes de usar o DP.System."
              "\nParticipantes da criação do software:"
              "\n- Lucas Bellúcio Sebastião",textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ])),
      ),
    );
  }
}
