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
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            ColoredBox(
              color: Colors.deepOrangeAccent,
              child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  labelPadding: EdgeInsets.symmetric(horizontal: 30),
                  indicatorWeight: 5,
                  indicatorColor: Colors.white,
                  tabs: const [
                    Tab(text: "Screen 1"),
                    Tab(text: "Screen 2"),
                    Tab(text: "Screen 3"),
                    Tab(text: "Screen 1"),
                    Tab(text: "Screen 2"),
                    Tab(text: "Screen 3"),
                  ]),
            ),
            const Expanded(
                child: TabBarView(children: [
              UnoScreen(),
              DosScreen(),
              TresScreen(),
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
