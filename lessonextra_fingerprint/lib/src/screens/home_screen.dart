// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenidx"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100,),
            SizedBox(height: 20),
            Text("Bienvenidx", style: TextStyle(fontSize: 20)),
            Text("Has iniciado sesión con éxito", style: TextStyle(fontSize: 20)),
        ],
      )),
    );
  }
}
