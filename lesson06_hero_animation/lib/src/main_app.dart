import 'package:flutter/material.dart';
import 'package:lesson06_hero_animation/src/screens/inicio_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: InicioScreen());
  }
}
