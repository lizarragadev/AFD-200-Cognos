import 'package:flutter/material.dart';
import 'package:lesson07_lab/src/routes/routes.dart';
import 'package:lesson07_lab/src/screens/error_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: getRoutes(),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const ErrorScreen();
        });
      },
    );
  }
}
