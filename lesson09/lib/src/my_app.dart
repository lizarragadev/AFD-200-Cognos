import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson09/src/provider/auth_provider.dart';
import 'package:lesson09/src/routes/routes.dart';
import 'package:lesson09/src/screens/login_screen.dart';

class MyApp extends StatelessWidget {
  late AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = AuthProvider();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: getRoute(),
    );
  }

  String getRoute() {
    User? user = provider.getUsuario();
    if(user != null) {
      return RoutePaths.homeScreen;
    } else {
      return RoutePaths.loginScreen;
    }
  }

}
