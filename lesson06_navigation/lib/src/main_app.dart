import 'package:flutter/material.dart';
import 'package:lesson06_navigation/src/screens/dos_screen.dart';
import 'package:lesson06_navigation/src/screens/menu_screen.dart';
import 'package:lesson06_navigation/src/screens/uno_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MenuScreen(),
      routes: {
        '1': (context) => const UnoScreen(),
        '2': (context) => const DosScreen(),
      },
    );
  }
}
