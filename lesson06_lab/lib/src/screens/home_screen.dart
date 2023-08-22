import 'package:flutter/material.dart';
import 'package:lesson06_lab/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: Column(
          children: [crearBotones(context), crearContenidoHome()],
        ));
  }
}
