import 'package:flutter/material.dart';
import 'package:lesson05_lab/src/screens/laboratorio_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LaboratorioScreen());
  }
}
