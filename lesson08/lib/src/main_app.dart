import 'package:flutter/material.dart';
import 'package:lesson08/src/routes/routes.dart';

class MainApp extends StatelessWidget {
const MainApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
      initialRoute: '/',
    );
  }
}