import 'package:flutter/material.dart';

class CuatroScreen extends StatelessWidget {
  const CuatroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 150,
              color: Colors.purpleAccent,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Perfil",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
