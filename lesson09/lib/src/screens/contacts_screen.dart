
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
  

  @override
  Widget build(BuildContext context) {
    

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
            stream: null!,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                //mostrarMensaje(context, "No se pudo obtener datos", Constants.MENSAJE_ERROR);
                return const Center(
                  child: Text("Ocurrio un error"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text("Cargando...")
                    ],
                  ),
                );
              }


              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: ListView.builder(
                    itemCount: 0,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromRGBO(174, 226, 214, 1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            onTap: () {},
                            title: Text(
                              "",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("",
                                style: const TextStyle(
                                    fontSize: 15, fontStyle: FontStyle.italic)),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {

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


}
