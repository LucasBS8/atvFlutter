import 'package:appimc/pages/homePage.dart';
import 'package:flutter/material.dart';

class AbaixoPeso extends StatefulWidget {
  const AbaixoPeso({super.key});

  @override
  State<AbaixoPeso> createState() => _AbaixoPesoState();
}

class _AbaixoPesoState extends State<AbaixoPeso> {
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
          title: Text('Abaixo do peso',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Image.asset('assets/images/pesoBaixo.png',
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: SizedBox(
                  width: ctxPage.size.width * 0.9,
                  child: Text('"Explore seu bem-estar! Estar abaixo do peso pode ser'
                      'um sinal para revisitar seus hábitos alimentares e de '
                      'saúde. Alimentação balanceada e atividades físicas '
                      'regulares são essenciais para atingir um peso '
                      'saudável. Lembre-se, cada corpo é único; considere'
                      'conversar com um profissional de saúde para '
                      'orientações personalizadas."',style: TextStyle(fontSize: 20),),
                ),
              )
            ]),
          ),
        ));
  }
}
