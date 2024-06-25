import 'package:appimc/pages/homePage.dart';
import 'package:flutter/material.dart';

class ObesidadeNvl3 extends StatefulWidget {
  const ObesidadeNvl3({super.key});

  @override
  State<ObesidadeNvl3> createState() => _ObesidadeNvl3State();
}

class _ObesidadeNvl3State extends State<ObesidadeNvl3> {
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
          title: Text('Obesidade grau 3'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset(
                'assets/images/obsd3.png',
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: SizedBox(
                  width: ctxPage.size.width * 0.9,
                  child: Text(
                    ' "Priorize seu bem-estar! Seu IMC aponta para '
                    'obesidade grau III, o que significa que é crucial focar '
                    'em sua saúde agora. Este é um momento para cuidado '
                    'e compreensão, buscando orientação de especialistas '
                    'para adotar mudanças positivas no estilo de vida. '
                    'Lembre-se, cada passo em direção à saúde é valioso."',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
