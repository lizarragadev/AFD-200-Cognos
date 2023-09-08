
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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
  final realtime = FirebaseDatabase.instance;
  late Query query;
  late AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = AuthProvider();
    User? user = provider.getUsuario();
    query = realtime
      .ref()
      .child(Constants.NOTAS)
      .orderByChild(Constants.N_USER_ID)
      .equalTo(user!.uid);

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
          child: FirebaseAnimatedList(
            defaultChild: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(width: 20,),
                  Text("Cargando...")
                ],
              ),
            ),
            query: query,
            itemBuilder: (context, snapshot, animation, index) {
              var note = convertDataToObject(snapshot);
              return Card(
                color: const Color.fromRGBO(34, 179, 164, 1.0),
                child: ListTile(
                  title: Text(note.titulo),
                  subtitle: Text(note.contenido),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteData(note);
                    },
                  ),
                ),
              );
            },
          )
      ),
    );
  }

  Note convertDataToObject(DataSnapshot snapshot) {
    var dataObtenido = snapshot.value as Map<dynamic, dynamic>;
    dataObtenido.addAll({ 'id': snapshot.key} );
    return Note.fromJson(dataObtenido);
  }

  void deleteData(Note note) {
    realtime.ref().child(Constants.NOTAS).child(note.id!).remove();
    mostrarMensaje(context, "Nota Eliminada", Constants.MENSAJE_EXITOSO);
  }
 
}
