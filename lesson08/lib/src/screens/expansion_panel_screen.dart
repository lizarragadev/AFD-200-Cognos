import 'package:flutter/material.dart';

class ExpansionPanelScreen extends StatefulWidget {
  const ExpansionPanelScreen({ Key? key }) : super(key: key);

  @override
  _ExpansionPanelScreenState createState() => _ExpansionPanelScreenState();
}

class _ExpansionPanelScreenState extends State<ExpansionPanelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Panels'),
      ),
      body: Container(),
    );
  }
}