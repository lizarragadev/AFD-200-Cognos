import 'package:flutter/material.dart';
import 'package:lesson05_stateless/src/screens/widgets_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WidgetsScreen(),
    );
  }
}
