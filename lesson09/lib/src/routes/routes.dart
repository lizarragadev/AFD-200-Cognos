import 'package:flutter/material.dart';
import 'package:lesson09/src/screens/add_contact_screen.dart';
import 'package:lesson09/src/screens/add_note_screen.dart';
import 'package:lesson09/src/screens/error_screen.dart';
import 'package:lesson09/src/screens/home_screen.dart';
import 'package:lesson09/src/screens/login_screen.dart';
import 'package:lesson09/src/screens/register_screen.dart';

class RoutePaths {
  static const loginScreen = "login";
  static const registerScreen = "register";
  static const homeScreen = "home";
  static const addNoteScreen = "addNote";
  static const addContactScreen = "addContact";
}

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutePaths.registerScreen:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case RoutePaths.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutePaths.addNoteScreen:
        return MaterialPageRoute(builder: (context) => AddNoteScreen());
      case RoutePaths.addContactScreen:
        return MaterialPageRoute(builder: (context) => AddContactScreen());
      default:
        return MaterialPageRoute(builder: (context) => ErrorScreen());
    }
  }
}
