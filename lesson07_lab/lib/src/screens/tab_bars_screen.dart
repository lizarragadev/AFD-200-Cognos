import 'package:flutter/material.dart';
import 'package:lesson07_lab/src/screens/subscreens/dos_screen.dart';
import 'package:lesson07_lab/src/screens/subscreens/tres_screen.dart';
import 'package:lesson07_lab/src/screens/subscreens/uno_screen.dart';

class TabBarsScreen extends StatelessWidget {
  const TabBarsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBars'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: const DefaultTabController(
        length: 3,
        child: Column(
          children: [
            ColoredBox(
              color: Colors.deepOrangeAccent,
              child: TabBar(
                  /*isScrollable: true, */
                  tabs: [
                    Tab(text: "Screen 1", icon: Icon(Icons.home)),
                    Tab(text: "Screen 2", icon: Icon(Icons.star)),
                    Tab(text: "Screen 3", icon: Icon(Icons.person)),
                  ]),
            ),
            Expanded(
                child: TabBarView(children: [
              UnoScreen(),
              DosScreen(),
              TresScreen(),
            ]))
          ],
        ),
      ),
    );
  }
}
