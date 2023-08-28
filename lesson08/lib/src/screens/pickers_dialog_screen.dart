import 'package:flutter/material.dart';

class PickersDialogScreen extends StatefulWidget {
  const PickersDialogScreen({ Key? key }) : super(key: key);

  @override
  _PickersDialogScreenState createState() => _PickersDialogScreenState();
}

class _PickersDialogScreenState extends State<PickersDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pickers & Dialogs'),
      ),
      body: Container(),
    );
  }
}