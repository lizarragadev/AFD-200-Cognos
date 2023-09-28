import 'package:flutter/material.dart';
import 'package:lesson_extra_persistence/screens/add_contact.dart';
import 'package:lesson_extra_persistence/utils/colors.dart';
import 'package:lesson_extra_persistence/screens/contact_list.dart';
import 'package:lesson_extra_persistence/screens/home_screen.dart';

class MyDrawal extends StatelessWidget {
  const MyDrawal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 55),
      child: Drawer(
        backgroundColor: MyColors.drawalBackground,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text(
                'Adicionar Categoria',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
            ),
            const Divider(
              color: MyColors.drawalDivider,
              height: 2,
              thickness: 2,
            ),
            ListTile(
              title: const Text(
                'Adicionar Contacto',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const AddContact()));
              },
            ),
            const Divider(
              color: MyColors.drawalDivider,
              height: 2,
              thickness: 2,
            ),
            ListTile(
              title: const Text(
                'Lista de Contactos',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const ContactList()));
              },
            ),
            const Divider(
              color: MyColors.drawalDivider,
              height: 2,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}