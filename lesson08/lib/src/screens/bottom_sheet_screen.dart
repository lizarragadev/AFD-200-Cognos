import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({ Key? key }) : super(key: key);

  @override
  _BottomSheetScreenState createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheets'),
      ),
      body: Container(),
    );
  }
}