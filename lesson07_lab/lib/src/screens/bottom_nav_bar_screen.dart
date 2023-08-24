import 'package:flutter/material.dart';
import 'package:lesson07_lab/src/screens/subscreens/dos_screen.dart';
import 'package:lesson07_lab/src/screens/subscreens/tres_screen.dart';
import 'package:lesson07_lab/src/screens/subscreens/uno_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int selectedPage = 0;
  final screens = [const UnoScreen(), const DosScreen(), const TresScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedPage],
      bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, blurRadius: 10, spreadRadius: 5)
              ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              items: itemsBNB(),
              currentIndex: selectedPage,
              onTap: (position) {
                setState(() {
                  selectedPage = position;
                  //selectionTab(position);
                });
              },
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.blueGrey,
              backgroundColor: Colors.green,
            ),
          )),
    );
  }

  List<BottomNavigationBarItem> itemsBNB() {
    List<BottomNavigationBarItem> list = [];
    list.add(
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"));
    list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.star), label: "Favoritos"));
    list.add(
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Perfil"));
    return list;
  }

  /*selectionTab(position) {
    switch (position) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }*/
}
