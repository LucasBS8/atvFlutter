import 'package:appimc/pages/homePage.dart';
import 'package:flutter/material.dart';

class ObesidadeNvl1 extends StatefulWidget {
  const ObesidadeNvl1({super.key});

  @override
  State<ObesidadeNvl1> createState() => _ObesidadeNvl1State();
}

class _ObesidadeNvl1State extends State<ObesidadeNvl1> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData ctxPage = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) => const MyHomePage(
                      title: 'Calculo de IMC',
                    )));
          }),
          centerTitle: true,
          title: Text('Obesidade grau 1'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset(
                'assets/images/obsd1.png',
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: SizedBox(
                  width: ctxPage.size.width * 0.9,
                  child: Text(
                    '"Tempo de atenção! Seu IMC indica obesidade grau I,'
                    'o que sugere a importância de cuidar mais de sua '
                    'saúde. Modificações no estilo de vida, como melhorar '
                    'a dieta e aumentar as atividades físicas, são passos '
                    'significativos. Profissionais de saúde podem oferecer '
                    'suporte e orientação personalizada para sua jornada."',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
