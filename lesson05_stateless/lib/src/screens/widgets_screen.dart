import 'package:flutter/material.dart';

class WidgetsScreen extends StatelessWidget {
  const WidgetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless'),
      ),
      body: body(),
    );
  }

  Widget body() {
    return const Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "Curso de Flutter en Cognos Capacitación",
          style: TextStyle(
              fontSize: 20, color: Colors.blue, fontFamily: "Times New Roman"),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Flutter Development",
          style:
              TextStyle(fontSize: 30, color: Colors.green, fontFamily: "Arial"),
        ),
        SizedBox(
          height: 20,
        ),
        Image(
          image: AssetImage("assets/images/imagen.png"),
          width: 200,
        ),
        SizedBox(height: 10),
        Image(
          image: NetworkImage(
              "https://cdn.create.vista.com/api/media/small/110016664/stock-photo-close-up-of-a-tricolor"),
          width: 200,
        ),
      ],
    );
  }
}
