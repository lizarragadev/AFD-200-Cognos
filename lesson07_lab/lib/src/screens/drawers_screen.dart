import 'package:flutter/material.dart';
import 'package:lesson07_lab/src/screens/subscreens/cuatro_screen.dart';
import 'package:lesson07_lab/src/screens/subscreens/dos_screen.dart';
import 'package:lesson07_lab/src/screens/subscreens/tres_screen.dart';
import 'package:lesson07_lab/src/screens/subscreens/uno_screen.dart';

class DrawersScreen extends StatefulWidget {
  const DrawersScreen({Key? key}) : super(key: key);

  @override
  _DrawersScreenState createState() => _DrawersScreenState();
}

class _DrawersScreenState extends State<DrawersScreen> {
  int selectedPage = 0;
  final drawerItems = [
    DrawerItem("Inicio", Icons.home),
    DrawerItem("Favoritos", Icons.star),
    DrawerItem("Imagenes", Icons.image),
    DrawerItem("PErfil", Icons.person)
  ];

  Widget getDrawerItemWidget(position) {
    switch (position) {
      case 0:
        return const UnoScreen();
      case 1:
        return const DosScreen();
      case 2:
        return const TresScreen();
      default:
        return const CuatroScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawers'),
      ),
      body: getDrawerItemWidget(selectedPage),
      drawer: Drawer(
        child: Column(
          children: [cabecera(), cuerpo()],
        ),
      ),
    );
  }

  Widget cabecera() {
    return UserAccountsDrawerHeader(
      accountName: const Text("Gustavo Lizárraga"),
      accountEmail: const Text("lizarraga.dev@gmail.com"),
      currentAccountPicture: GestureDetector(
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 34,
            backgroundImage: const Image(
              image: AssetImage("assets/images/profile1.png"),
            ).image,
          ),
        ),
        onTap: () {
          print("Click en la imagen");
        },
      ),
      otherAccountsPictures: [
        CircleAvatar(
          backgroundImage: const Image(
            image: AssetImage("assets/images/profile.png"),
          ).image,
        ),
        CircleAvatar(
          backgroundImage: const Image(
            image: AssetImage("assets/images/profile1.jpeg"),
          ).image,
        )
      ],
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.greenAccent,
            Colors.green,
            Colors.green.shade900
          ])),
    );
  }

  Widget cuerpo() {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      drawerOptions.add(ListTile(
        title: Text(drawerItems[i].title),
        leading: Icon(drawerItems[i].icon),
        trailing: const Icon(Icons.arrow_right),
        selected: i == selectedPage,
        onTap: () {
          setState(() {
            selectedPage = i;
            Navigator.of(context).pop();
          });
        },
      ));
    }
    return Column(
      children: drawerOptions,
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}
