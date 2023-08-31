import 'package:flutter/material.dart';
import 'package:lesson09/src/model/note.dart';
import 'package:lesson09/src/provider/auth_provider.dart';
import 'package:lesson09/src/routes/routes.dart';
import 'package:lesson09/src/utils/constants.dart';
import 'package:lesson09/src/utils/utils.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(34, 179, 164, 1.0),
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.addNoteScreen);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: null
        ),
    );
  }

 
}
