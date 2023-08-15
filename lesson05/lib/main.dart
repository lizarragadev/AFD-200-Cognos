import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mi App"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: const Center(
          child: Column(
            children: [
              Text("Texto 1"),
              Text("Texto 2"),
              Text("Texto 3"),
              Text("Texto 4"),
              Text("Texto 5"),
              Text("Texto 6"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}
