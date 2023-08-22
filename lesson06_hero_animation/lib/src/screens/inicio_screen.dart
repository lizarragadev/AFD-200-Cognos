import 'package:flutter/material.dart';
import 'package:lesson06_hero_animation/src/screens/detalle_screen.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Superheroe'),
      ),
      body: Center(
        child: GestureDetector(
          child: const Hero(
            tag: "imageHero",
            child: Image(
              image: AssetImage("assets/images/superheroe.png"),
              width: 150,
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const DetalleScreen();
            }));
          },
        ),
      ),
    );
  }
}
