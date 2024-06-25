import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';

class EditorBlocoNotas extends StatefulWidget {
  const EditorBlocoNotas(
      {super.key, required this.title, required this.blocoNotas});
  final String title, blocoNotas;
  @override
  State<EditorBlocoNotas> createState() => _EditorBlocoNotasState();
}

class _EditorBlocoNotasState extends State<EditorBlocoNotas> {
  String description = "";
  void initState() {
    super.initState();
    // Atribuir o valor de widget.blocoNotas a description dentro do initState()
    description = widget.blocoNotas;
    // Configurar o controller com o valor inicial
    controller.text = description;
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(onPressed: () {
            Navigator.pop(context);
          }),
          title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  MarkdownTextInput(
                    (String value) => setState(() => description = value),
                    description,
                    label: 'Description',
                    maxLines: 10,
                    insertLinksByDialog: true,
                    actions: [
                      MarkdownType.bold,
                      MarkdownType.italic,
                      MarkdownType.strikethrough,
                      MarkdownType.link,
                      MarkdownType.title,
                      MarkdownType.list,
                      MarkdownType.blockquote,
                      MarkdownType.separator
                    ],
                    controller: controller,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FilledButton(
                            onPressed: () {
                              setState(() {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    content: const Text('Salvo com sucesso!'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            },
                            child: Text("Salvar")),
                        FilledButton(
                          onPressed: () {
                            controller.clear();
                          },
                          child: Text('Clear'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MarkdownBody(
                      data: description,
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
