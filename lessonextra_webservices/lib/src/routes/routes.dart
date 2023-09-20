import 'package:flutter/material.dart';
import 'package:lesson_extra_webservices/src/models/pelicula.dart';
import 'package:lesson_extra_webservices/src/screens/detail_screen.dart';
import 'package:lesson_extra_webservices/src/screens/home_screen.dart';

class RoutePaths {
  static const homePage = "homePage";
  static const detailPage = "detailPage";
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.homePage:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutePaths.detailPage:
        return MaterialPageRoute(
            builder: (context) => DetailScreen(settings.arguments as Pelicula));
      default:
        return MaterialPageRoute(
            builder: (context) => const Text("Ruta erronea"));
    }
  }
}
