import 'package:flutter/material.dart';
import 'package:lesson06_buttons/src/screens/buttons_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ButtonsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
