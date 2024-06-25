import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:project01/pages/calendario/calendarioPage.dart';
import 'package:project01/pages/home/addTurma.dart';
import 'package:project01/pages/home/homePage.dart';
import 'package:project01/pages/perfil/perfil.dart';
import 'package:project01/pages/sobrePage/sobrePage.dart';
import 'package:project01/pages/turma/turmaModel.dart';


class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(children: [/*Image.asset("assets/images/logo.png",width: 80),*/
              Text(
                'Diário do professor',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ]),
            )
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const PerfilPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.class_),
            title: const Text('Turma'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const MyHomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Calendário'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CalendarioPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SobrePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}

class AppbarTopo extends StatelessWidget implements PreferredSizeWidget {
  const AppbarTopo({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Center(child: Text(title)),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const PerfilPage()));
            },
            icon: Icon(Icons.account_circle_sharp))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class AppBarBaixo extends StatelessWidget {
  const AppBarBaixo({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(backgroundColor: Theme.of(context).hoverColor,style: TabStyle.fixed, items: [
      TabItem(
          icon: InkWell(
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      )),
      TabItem(
          icon: InkWell(
        child: Image.asset('assets/images/logo.png'),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const MyHomePage()));
        },
      )),
      TabItem(
        icon: InkWell(
          child: Icon(
            Icons.calendar_today,
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CalendarioPage()));
          },
        ),
      ),
    ]);
  }
}

class ModelBtnTurma extends StatefulWidget {
  const ModelBtnTurma({super.key, required this.title});
  final String title;

  @override
  State<ModelBtnTurma> createState() => _ModelBtnTurmaState();
}

class _ModelBtnTurmaState extends State<ModelBtnTurma> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const ModelTurma()));
            },
            child: Container(
              width: 400,
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
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(widget.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_drop_down_rounded,
                          color: Colors.black),
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 63, 65, 120),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            duration: Duration(milliseconds: 300),
            height: isExpanded ? 80 : 0,
            width: 400,
            child: isExpanded
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: FilledButton(
                          onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const AdicionarTurma(titulo: "Alterar")));
                          },
                          child: Text('Editar'),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement your logic for the second button
                          },
                          child: Text('Excluir'),
                        ),
                      ),
                    ],
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
