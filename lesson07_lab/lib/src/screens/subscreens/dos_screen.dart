import 'package:flutter/material.dart';

class DosScreen extends StatelessWidget {
  const DosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 150,
              color: Colors.orangeAccent,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Favoritos",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
