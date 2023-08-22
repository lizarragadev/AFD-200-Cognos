import 'package:flutter/material.dart';
import 'package:lesson06_lab/src/screens/home_screen.dart';
import 'package:lesson06_lab/src/screens/pizza_dos_screen.dart';
import 'package:lesson06_lab/src/screens/pizza_tres_screen.dart';
import 'package:lesson06_lab/src/screens/pizza_uno_screen.dart';
import 'package:lesson06_lab/src/screens/web_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          'pizza1': (context) => const PizzaUnoScreen(),
          'pizza2': (context) => const PizzaDosScreen(),
          'pizza3': (context) => const PizzaTresScreen(),
          'webview': (context) => const WebScreen()
        });
  }
}
