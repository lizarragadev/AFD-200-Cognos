import 'package:flutter/material.dart';
import 'package:lesson06_lab/src/widgets/widgets.dart';

class PizzaDosScreen extends StatelessWidget {
  const PizzaDosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [crearContenidoImg("assets/images/pizza2.png", "Pizza 2")],
      ),
    );
  }
}
