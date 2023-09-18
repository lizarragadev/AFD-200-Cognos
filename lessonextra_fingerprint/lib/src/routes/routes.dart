import 'package:flutter/material.dart';
import 'package:lesson_extra_fingerprint/src/screens/home_screen.dart';
import 'package:lesson_extra_fingerprint/src/screens/local_auth_screen.dart';

class RoutePaths {
  static const homeScreen = "homeScreen";
  static const localAuthScreen = "localAuthScreen";
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutePaths.localAuthScreen:
        return MaterialPageRoute(builder: (context) => const LocalAuthScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Text("Ruta erronea"));
    }
  }
}
