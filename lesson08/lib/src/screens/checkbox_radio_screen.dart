
import 'package:flutter/material.dart';

class CheckboxRadioScreen extends StatefulWidget {
  const CheckboxRadioScreen({ Key? key }) : super(key: key);

  @override
  _CheckboxRadioScreenState createState() => _CheckboxRadioScreenState();
}

class _CheckboxRadioScreenState extends State<CheckboxRadioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckBoxes & Radio Buttons'),
      ),
      body: Container(),
    );
  }
}