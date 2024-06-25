import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:project01/pages/blocoDeNota/editarBlocoNotas.dart';

class BlocoNotasModel extends StatefulWidget {
  const BlocoNotasModel({super.key, required this.name, required this.texto});
  final String name, texto;
  @override
  State<BlocoNotasModel> createState() => _BlocoNotasModelState();
}

class _BlocoNotasModelState extends State<BlocoNotasModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            onPressed: () {Navigator.pop(context);},
          ),
          title: Text(widget.name),
          actions: [
            IconButton(
                onPressed: () {
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => EditorBlocoNotas(title:widget.name , blocoNotas: widget.texto)));
                },
                icon: Icon(Icons.edit))
          ]),
      body:  SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MarkdownBody(
                    data: widget.texto,
                    shrinkWrap: true,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
