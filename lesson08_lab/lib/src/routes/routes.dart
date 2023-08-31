import 'package:flutter/material.dart';
import 'package:lesson08_lab/src/screens/home_screen.dart';
import 'package:lesson08_lab/src/screens/room_screen.dart';

class RoutePaths {
  static const homeScreen = "home";
  static const roomScreen = "room";
}

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case RoutePaths.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen()); 
      default:
        return MaterialPageRoute(builder: (context) => const RoomScreen());
    }
  }
}