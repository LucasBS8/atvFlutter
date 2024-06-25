import 'package:appimc/pages/homePage.dart';
import 'package:flutter/material.dart';

class PaginaResultado extends StatefulWidget {
  const PaginaResultado(
      {super.key,
      required this.title,
      required this.desc,
      required this.caminho});
  final String title, desc, caminho;
  @override
  State<PaginaResultado> createState() => _PaginaResultadoState();
}

class _PaginaResultadoState extends State<PaginaResultado> {
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
          title: Text(widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset(
                widget.caminho,
                height: 300,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: SizedBox(
                  width: ctxPage.size.width * 0.9,
                  child: Text(
                    widget.desc,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
