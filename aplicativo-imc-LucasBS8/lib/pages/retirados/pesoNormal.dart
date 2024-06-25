import 'package:appimc/pages/homePage.dart';
import 'package:flutter/material.dart';

class PesoNormal extends StatefulWidget {
  const PesoNormal({super.key});

  @override
  State<PesoNormal> createState() => _PesoNormalState();
}

class _PesoNormalState extends State<PesoNormal> {
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
          title: Text('Peso Normal',style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset(
                'assets/images/pesoIdeal.png',
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: SizedBox(
                  width: ctxPage.size.width * 0.9,
                  child: Text(
                    '"Parabéns pelo equilíbrio! Seu IMC indica que você '
                    'está em uma faixa de peso considerada saudável. '
                    'Continue com seus hábitos alimentares balanceados e '
                    'atividades físicas regulares para manter seu bem'
                    'estar. Lembre-se de que a saúde vai além do peso, '
                    'então foque também na qualidade de vida."',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
