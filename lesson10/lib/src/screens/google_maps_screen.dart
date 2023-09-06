import 'dart:async';

import 'package:flutter/material.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {


  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: Stack(
        children: [
          
          
          Container(
            margin: const EdgeInsets.only(top: 80, right: 10),
            alignment: Alignment.topRight,
            child: Column(children: [
              FloatingActionButton(
                  elevation: 5,
                  backgroundColor: Colors.blue,
                  onPressed: () {


                  },
                  child: const Icon(Icons.layers)),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                  elevation: 5,
                  backgroundColor: Colors.blue,
                  onPressed: () {


                  },
                  child: const Icon(Icons.arrow_forward)),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                  elevation: 5,
                  backgroundColor: Colors.blue,
                  onPressed: () {


                  },
                  child: const Icon(Icons.arrow_back)),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                  elevation: 5,
                  backgroundColor: Colors.blue,
                  onPressed: () {


                  },
                  child: const Icon(Icons.gps_fixed)),
            ]),
          ),
        ],
      ),
      persistentFooterButtons: [
        Center(
          child: Column(
            children: [
              

              
            ],
          ),
        )
      ],
    );
  }


 

  


  
}
