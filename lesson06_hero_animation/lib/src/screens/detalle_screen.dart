import 'package:flutter/material.dart';

class DetalleScreen extends StatelessWidget {
  const DetalleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle Superheroe'),
      ),
      body: Center(
        child: GestureDetector(
          child: const Hero(
            tag: "imageHero",
            child: Image(
              image: AssetImage("assets/images/superheroe.png"),
              width: 400,
            ),
          ),
          onLongPress: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
