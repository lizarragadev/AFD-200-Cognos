import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lesson_extra_persistence/db/db_provider.dart';
import 'package:lesson_extra_persistence/utils/colors.dart';
import 'package:lesson_extra_persistence/utils/mydrawal.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> allContactData = [];

  @override
  void initState() {
    super.initState();
    contactList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawal(),
        appBar: AppBar(
          backgroundColor: MyColors.primaryColor,
          title: const Text("Lista de Contactos"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Text(""),
            Expanded(
                child: ListView.builder(
              itemCount: allContactData.length,
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                var item = allContactData[index];
                Uint8List bytes = base64Decode(item['profile']);
                return Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            minRadius: 20,maxRadius: 25,
                            child: Image.memory(bytes,fit: BoxFit.fill,),),
                          const SizedBox(width: 20,),
                          Text("${item['name']} "),
                          Text("${item['lname']}"),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              deleteContact(item['_id']);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          const SizedBox(width: 20,)
                        ],
                      ),
                      const Divider(
                        color: MyColors.orangeDivider,
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  void contactList() async {
    final allContacts = await dbHelper.queryAllContacts();
    setState(() {
      allContactData = allContacts;
    });
  }

  void deleteContact(int id) async {
    final contactDeleted = await dbHelper.deleteContact(id);
    contactList();
  }
}