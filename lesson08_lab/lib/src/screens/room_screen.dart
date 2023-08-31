import 'package:flutter/material.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({ Key? key }) : super(key: key);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms'),
      ),
      body: Container(),
    );
  }
}