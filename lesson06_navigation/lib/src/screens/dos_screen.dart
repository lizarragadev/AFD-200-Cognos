import 'package:flutter/material.dart';

class DosScreen extends StatelessWidget {
  //String valor;
  const DosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String dataFromMenu =
        ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 2'),
      ),
      body: Center(
        child: Text("Pantalla 2 \n Valor que llega: $dataFromMenu"),
      ),
    );
  }
}
