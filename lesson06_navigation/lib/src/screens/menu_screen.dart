import 'package:flutter/material.dart';
import 'package:lesson06_navigation/src/screens/tres_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegación y rutas'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "1");
              },
              child: const Text("Ir a pantalla 1")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "2", arguments: "Dato de menu");
              },
              child: const Text("Ir a pantalla 2")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TresScreen()));
              },
              child: const Text("Ir a pantalla 3")),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
