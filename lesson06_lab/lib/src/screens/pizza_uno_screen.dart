import 'package:flutter/material.dart';
import 'package:lesson06_lab/src/widgets/widgets.dart';

class PizzaUnoScreen extends StatelessWidget {
  const PizzaUnoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [crearContenidoImg("assets/images/pizza1.png", "Pizza 1")],
      ),
    );
  }
}
