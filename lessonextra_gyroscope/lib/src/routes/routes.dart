import 'package:flutter/material.dart';
import 'package:lesson_extra_gyroscope/src/screens/home_screen.dart';
class RoutePaths {
  static const homeScreen = "homeScreen";
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Text("Ruta erronea"));
    }
  }
}
