import 'package:flutter/material.dart';

class UnoScreen extends StatelessWidget {
  const UnoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 1'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Pantalla 1"),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                //Navigator.pushReplacementNamed(context, "2");
                Navigator.pop(context);
              },
              child: const Text("Cerrar pantalla 1"))
        ],
      )),
    );
  }
}
