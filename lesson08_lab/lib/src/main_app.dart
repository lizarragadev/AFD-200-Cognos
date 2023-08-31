import 'package:flutter/material.dart';
import 'package:lesson08_lab/src/routes/routes.dart';

class MainApp extends StatelessWidget {
const MainApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: RoutePaths.homeScreen,
    );
  }
}