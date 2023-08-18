import 'package:flutter/material.dart';

class DosScreen extends StatelessWidget {
  const DosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 2'),
      ),
      body: const Center(
        child: Text("Pantalla 2"),
      ),
    );
  }
}
