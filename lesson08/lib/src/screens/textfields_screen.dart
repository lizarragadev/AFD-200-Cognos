import 'package:flutter/material.dart';

class TextfieldsScreen extends StatefulWidget {
  const TextfieldsScreen({ Key? key }) : super(key: key);

  @override
  _TextfieldsScreenState createState() => _TextfieldsScreenState();
}

class _TextfieldsScreenState extends State<TextfieldsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Textfields'),
      ),
      body: Container(),
    );
  }
}