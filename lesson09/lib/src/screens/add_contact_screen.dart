import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson09/src/model/contact.dart';
import 'package:lesson09/src/provider/auth_provider.dart';
import 'package:lesson09/src/utils/constants.dart';
import 'package:lesson09/src/utils/utils.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  String nombre = "";
  String telefono = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Contacto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el nombre',
                border: OutlineInputBorder(),
              ),
              onChanged: (nuevoValor) {
                setState(() {
                  nombre = nuevoValor;
                });
              },
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el telefono',
                border: OutlineInputBorder(),
              ),
              onChanged: (nuevoValor) {
                telefono = nuevoValor;
              },
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el correo',
                border: OutlineInputBorder(),
              ),
              onChanged: (nuevoValor) {
                email = nuevoValor;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                validarForm();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // NEW
              ),
              child: const Text(
                "GUARDAR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validarForm() {
    if(nombre.isNotEmpty && telefono.isNotEmpty && email.isNotEmpty) {
      guardarContactoFirestore();
    } else {
      mostrarMensaje(context, "Existen campos vacios", Constants.MENSAJE_ERROR);
    }
  }

  Future<void> guardarContactoFirestore() async {
    try {
      showBarraProgreso(context, "Agregando contacto");
      CollectionReference refFirestore = FirebaseFirestore.instance.collection(Constants.CONTACTS);
      await refFirestore.add(createContact().toMap()).whenComplete(() {
        mostrarMensaje(context,"Contacto agregado", Constants.MENSAJE_EXITOSO);
        Navigator.pop(context);
      });
      Navigator.pop(context);
    } on FirebaseException catch(e) {
      mostrarMensaje(context, e.message, Constants.MENSAJE_ERROR);
    }
  } 

  Contact createContact() {
    AuthProvider auth = AuthProvider();
    var user = auth.getUsuario();
    return Contact(
      userId: user!.uid,
      nombre: nombre,
      telefono: telefono,
      email: email
    );
  }

  
}
