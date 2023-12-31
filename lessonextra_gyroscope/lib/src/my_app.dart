import 'package:flutter/material.dart';
import 'package:lesson_extra_gyroscope/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RoutePaths.homeScreen,
    );
  }
}
