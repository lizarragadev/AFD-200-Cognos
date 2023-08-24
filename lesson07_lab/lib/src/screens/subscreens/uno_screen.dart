import 'package:flutter/material.dart';

class UnoScreen extends StatelessWidget {
  const UnoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: Colors.greenAccent,
      ),*/
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              size: 150,
              color: Colors.greenAccent,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Inicio",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
