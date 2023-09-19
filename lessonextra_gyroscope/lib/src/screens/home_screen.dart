// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double x = 0, y = 0, z = 0;
  String direction = "None";

  @override
  void initState() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      print(event);
      x = event.x;
      y = event.y;
      z = event.z;

      if(x > 0) {
        direction = "atras";
      } else {
        if(x < 0) {
          direction = "adelante";
        } else {
          if(y > 0) {
            direction = "izquierda";
          } else {
            if(y < 0) {
              direction = "derecha";
            } else {
              if(z > 0) {
                direction = "rotando a derecha";
              } else {
                direction = "rotando a izquierda";
              }
            }
          }
        }
      }

      setState(() {
        direction = direction;
      });
    });
    super.initState();
  }


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
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(direction, style: const TextStyle(fontSize: 30),)
          ]
        )
      ),
    );
  }
}
