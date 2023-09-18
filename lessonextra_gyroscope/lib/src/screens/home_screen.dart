// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Gyroscope Sensor in Flutter"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container( 
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        child: Column(
          children:[
          
          ]
        )
      ),
    );
  }
}
