
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson09/src/model/contact.dart';
import 'package:lesson09/src/provider/auth_provider.dart';
import 'package:lesson09/src/routes/routes.dart';
import 'package:lesson09/src/utils/constants.dart';
import 'package:lesson09/src/utils/utils.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  late AuthProvider authProvider;
  late User? user;
  late FirebaseFirestore firestore;
  late Stream<QuerySnapshot> noteStream;

  @override
  Widget build(BuildContext context) {
    authProvider = AuthProvider();
    user = authProvider.getUsuario();
    firestore = FirebaseFirestore.instance;
    noteStream = firestore
        .collection(Constants.CONTACTS)
        .where(Constants.C_USER_ID, isEqualTo: user!.uid)
        .snapshots();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(34, 179, 164, 1.0),
          onPressed: () {
            Navigator.pushNamed(context, RoutePaths.addContactScreen);
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: StreamBuilder(
            stream: noteStream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                mostrarMensaje(context, "No se pudo obtener datos", Constants.MENSAJE_ERROR);
                return const Center(
                  child: Text("Ocurrio un error"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text("Cargando...")
                    ],
                  ),
                );
              }

              var contacts = convertDatatoObject(snapshot.data?.docs);

              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromRGBO(174, 226, 214, 1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            onTap: () {},
                            title: Text(
                              contacts[index].nombre,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("${contacts[index].telefono} | ${contacts[index].email}",
                                style: const TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic)),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                deleteContact(contacts[index].id);
                              },
                            ),
                          ),
                        ),
                      );
                    }),
              );
            },
          ),
        ));
  }

  List<Contact> convertDatatoObject(List<QueryDocumentSnapshot> snapshot) {
    List<Contact> lista = [];
    snapshot.forEach((element) { 
      var datoObtenido = element.data() as Map<String, dynamic>;
      datoObtenido.addAll({'id': element.id});
      lista.add(Contact.fromJson(datoObtenido));
    });
    return lista;
  }

  Future<void> deleteContact(String? id) async {
    await firestore
        .collection(Constants.CONTACTS)
        .doc(id)
        .delete()
        .then((value) => mostrarMensaje(context, "Contacto eliminado", 
            Constants.MENSAJE_EXITOSO))
        .catchError((error) => print("Error: $error"));
  }

}
