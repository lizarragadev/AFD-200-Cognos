import 'package:flutter/material.dart';

class TresScreen extends StatelessWidget {
  const TresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 3'),
      ),
      body: const Center(
        child: Text("Pantalla 3"),
      ),
    );
  }
}
