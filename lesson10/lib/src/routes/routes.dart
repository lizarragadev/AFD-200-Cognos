import 'package:flutter/material.dart';
import 'package:lesson10/src/screens/error_screen.dart';
import 'package:lesson10/src/screens/google_maps_screen.dart';

class RoutePaths {
  static const googleMaps = "googleMaps";
  static const errorScreen = "errorPage";
}

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.googleMaps:
        return MaterialPageRoute(
            builder: (context) => const GoogleMapsScreen());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorScreen());
    }
  }
}
