import 'package:appimc/pages/homePage.dart';
import 'package:flutter/material.dart';

class SobrePeso extends StatefulWidget {
  const SobrePeso({super.key});

  @override
  State<SobrePeso> createState() => _SobrePesoState();
}

class _SobrePesoState extends State<SobrePeso> {
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
          title:
              Text('Sobre Peso', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset(
                'assets/images/pesoBaixo.png',
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: SizedBox(
                  width: ctxPage.size.width * 0.9,
                  child: Text(
                    '"Um passo de cada vez! Estar na faixa de sobrepeso é '
                    'um sinal para refletir sobre seus hábitos de saúde. '
                    'Pequenas mudanças, como uma alimentação mais '
                    'balanceada e aumento da atividade física, podem '
                    'fazer uma grande diferença. Considerar o apoio de '
                    'profissionais pode ser um ótimo caminho para '
                    'encontrar seu equilíbrio."',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
