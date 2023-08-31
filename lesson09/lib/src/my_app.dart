import 'package:flutter/material.dart';
import 'package:lesson09/src/provider/auth_provider.dart';
import 'package:lesson09/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  late AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = AuthProvider();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
    );
  }

}
