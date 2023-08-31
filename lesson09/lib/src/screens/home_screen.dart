import 'package:flutter/material.dart';
import 'package:lesson09/src/provider/auth_provider.dart';
import 'package:lesson09/src/routes/routes.dart';
import 'package:lesson09/src/screens/contacts_screen.dart';
import 'package:lesson09/src/screens/notes_screen.dart';
import 'package:lesson09/src/screens/profile_screen.dart';
import 'package:lesson09/src/utils/constants.dart';
import 'package:lesson09/src/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;
  final pagesc = [ProfileScreen(), NotesScreen(), ContactsScreen()];
  late AuthProvider provider;

  @override
  void initState() {
    super.initState();
    provider = AuthProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LAB 9'),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                

                
              })
        ],
        backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
      ),
      body: pagesc[selectedPage],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(right: 15, left: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 5, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Perfil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.note_add),
                label: 'Notas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                label: 'Contactos',
              ),
            ],
            currentIndex: selectedPage,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
            fixedColor: Colors.white,
            unselectedItemColor: Colors.black12,
            onTap: (index) {
              setState(() {
                selectedPage = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
