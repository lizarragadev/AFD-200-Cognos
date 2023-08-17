import 'package:flutter/material.dart';

class ContadorScreen extends StatefulWidget {
  const ContadorScreen({Key? key}) : super(key: key);

  @override
  _ContadorScreenState createState() => _ContadorScreenState();
}

class _ContadorScreenState extends State<ContadorScreen> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
      body: crearBody(),
      floatingActionButton: crearFABs(),
    );
  }

  Widget crearBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Cantidad de clicks realizados:",
            style: TextStyle(fontSize: 20, fontFamily: 'MiFuente'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("$contador",
              style: const TextStyle(fontSize: 70, fontFamily: 'MiFuente'))
        ],
      ),
    );
  }

  Widget crearFABs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: resetear,
          child: const Icon(Icons.update),
        ),
        const SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          onPressed: reducir,
          child: const Icon(Icons.remove),
        ),
        const SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          onPressed: adicionar,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  void adicionar() => setState(() {
        contador++;
      });

  void reducir() => setState(() {
        contador--;
      });

  void resetear() => setState(() {
        contador = 0;
      });
}
