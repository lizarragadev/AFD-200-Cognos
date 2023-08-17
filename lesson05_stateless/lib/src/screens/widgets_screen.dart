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
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Curso de Flutter en Cognos Capacitación",
          style: TextStyle(
              fontSize: 20, color: Colors.blue, fontFamily: "Times New Roman"),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Flutter Development",
          style:
              TextStyle(fontSize: 30, color: Colors.green, fontFamily: "Arial"),
        ),
        const SizedBox(
          height: 20,
        ),
        const Image(
          image: AssetImage("assets/images/imagen.png"),
          width: 200,
        ),
        const SizedBox(height: 10),
        const Image(
          image: NetworkImage(
              "https://cdn.create.vista.com/api/media/small/110016664/stock-photo-close-up-of-a-tricolor"),
          width: 200,
        ),
        const SizedBox(height: 10),
        cardPersonalizado()
      ],
    );
  }

  Widget cardPersonalizado() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/img.png"),
              width: 50,
            ),
            SizedBox(
              width: 15,
            ),
            Text("Galeria de fotos", style: TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}
