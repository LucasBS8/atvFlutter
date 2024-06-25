import 'package:appimc/pages/homePage.dart';
import 'package:flutter/material.dart';

class ObesidadeNvl2 extends StatefulWidget {
  const ObesidadeNvl2({super.key});

  @override
  State<ObesidadeNvl2> createState() => _ObesidadeNvl2State();
}

class _ObesidadeNvl2State extends State<ObesidadeNvl2> {
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
          title: Text('Obesidade grau 2'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset(
                'assets/images/obsd2.png',
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: SizedBox(
                  width: ctxPage.size.width * 0.9,
                  child: Text(
                    '"Foco na saúde! Estar na faixa de obesidade grau II é '
                    'um sinal para priorizar sua saúde. É importante adotar '
                    'hábitos saudáveis e, possivelmente, buscar '
                    'intervenções específicas com o suporte de '
                    'profissionais. Sua jornada para o bem-estar é '
                    'importante, e cada pequeno passo conta."',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
