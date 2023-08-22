import 'package:flutter/material.dart';
import 'package:lesson06_lab/src/widgets/widgets.dart';

class PizzaTresScreen extends StatelessWidget {
  const PizzaTresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [crearContenidoImg("assets/images/pizza3.png", "Pizza 3")],
      ),
    );
  }
}
