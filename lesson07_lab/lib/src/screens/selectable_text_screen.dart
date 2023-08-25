import 'package:flutter/material.dart';

class SelectableTextScreen extends StatefulWidget {
  const SelectableTextScreen({Key? key}) : super(key: key);

  @override
  _SelectableTextScreenState createState() => _SelectableTextScreenState();
}

class _SelectableTextScreenState extends State<SelectableTextScreen> {
  String texto =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  String textoSeleccionado = "";
  int posInicial = 0;
  int posFinal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectableText'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              texto,
              textAlign: TextAlign.justify,
              onSelectionChanged: (TextSelection text, cause) {
                setState(() {
                  posInicial = text.start;
                  posFinal = text.end;
                  textoSeleccionado = texto.substring(posInicial, posFinal);
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Texto seleccionado"),
            const SizedBox(height: 20),
            Text(textoSeleccionado)
          ],
        ),
      ),
    );
  }
}
