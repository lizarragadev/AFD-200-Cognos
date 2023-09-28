import 'package:flutter/material.dart';
import 'package:lesson12_webservices/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RoutePaths.homePage,
      debugShowCheckedModeBanner: false,
    );
  }
}
