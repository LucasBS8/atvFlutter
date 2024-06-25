import 'package:flutter/material.dart';
import 'package:project01/pages/calendario/calendarioPage.dart';
import 'package:project01/pages/listaTurma/chamadaPage.dart';
import 'package:project01/pages/listaTurma/faltantes.dart';
import 'package:project01/pages/listaTurma/listaTurma.dart';
import 'package:project01/pages/outros/genericos.dart';

class ModelTurma extends StatefulWidget {
  const ModelTurma({super.key});

  @override
  State<ModelTurma> createState() => _ModelTurmaState();
}

class _ModelTurmaState extends State<ModelTurma> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        drawer: MenuLateral(),
        appBar: AppbarTopo(title: "1m1"),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BtnTurma(
                  titleBtn: "Calendário",
                  corThumb: Color.fromARGB(127, 130, 52, 255),
                  widthBtn: 320,
                  navegar: CalendarioPage()),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 30,
                children: [
                  BtnTurma(
                    titleBtn: "Chamada",
                    corThumb: Color.fromARGB(125, 52, 140, 255),
                    widthBtn: 150,
                    navegar: ChamadaPage(),
                  ),
                  BtnTurma(
                    titleBtn: "Faltantes",
                    corThumb: Color.fromARGB(126, 52, 66, 255),
                    widthBtn: 150,
                    navegar: FaltantesPage(),
                  ),
                  BtnTurma(
                    titleBtn: "Lista de alunos",
                    corThumb: Color.fromARGB(125, 52, 255, 160),
                    widthBtn: 150,
                    navegar: ListaTurmaPage(),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: AppBarBaixo(),
      ),
    );
  }
}

//350 e 150
class BtnTurma extends StatelessWidget {
  const BtnTurma(
      {super.key,
      required this.titleBtn,
      required this.corThumb,
      required this.widthBtn,
      required this.navegar});
  final String titleBtn;
  final Color corThumb;
  final double widthBtn;
  final navegar;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: SizedBox(
        width: widthBtn,
        height: 150,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => navegar));
          },
          child: Container(
            width: widthBtn,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/thumbTurma.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(25, 0, 0, 0),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: widthBtn,
                height: 150,
                color: corThumb,
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(10),
                child: Text(titleBtn,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
