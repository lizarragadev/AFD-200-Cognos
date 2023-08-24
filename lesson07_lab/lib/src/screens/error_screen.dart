import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error 404'),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning,
            size: 100,
            color: Colors.red,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "No se encontró la página",
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Regresar"))
        ],
      )),
    );
  }
}
