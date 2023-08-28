import 'package:flutter/material.dart';

class SliderSwitchScreen extends StatefulWidget {
  const SliderSwitchScreen({ Key? key }) : super(key: key);

  @override
  _SliderSwitchScreenState createState() => _SliderSwitchScreenState();
}

class _SliderSwitchScreenState extends State<SliderSwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider & Switch'),
      ),
      body: Container(),
    );
  }
}