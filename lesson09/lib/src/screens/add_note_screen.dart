
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lesson09/src/model/note.dart';
import 'package:lesson09/src/provider/auth_provider.dart';
import 'package:lesson09/src/utils/constants.dart';
import 'package:lesson09/src/utils/utils.dart';
import 'package:uuid/uuid.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  String titulo = "";
  String contenido = "";
  late AuthProvider provider;
  late User? user;

  initState() {
    super.initState();
    provider = AuthProvider();
    user = provider.getUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el título',
                border: OutlineInputBorder(),
              ),
              onChanged: (nuevoValor) {
                setState(() {
                  titulo = nuevoValor;
                });
              },
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el contenido',
                border: OutlineInputBorder(),
              ),
              onChanged: (nuevoValor) {
                setState(() {
                  contenido = nuevoValor;
                });
              },
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                validarForm(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
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

  void validarForm(context) {
    if(titulo.isNotEmpty && contenido.isNotEmpty) {
      guardarNota(context);
    } else {
      mostrarMensaje(context, "Existen campos vacios", Constants.MENSAJE_ERROR);
    }
  }

  Future<void> guardarNota(cont) async {
    try {
      showBarraProgreso(context, "Agregando Nota...");
      final realtime = FirebaseDatabase.instance;
      var refRealtime = realtime.ref().child("${Constants.NOTAS}/${generarUUID()}");
      await refRealtime.set(crearNote().toMap());
      Navigator.pop(cont);
      mostrarMensaje(cont, "Nota agregada correctamente", Constants.MENSAJE_EXITOSO);
      Navigator.pop(cont);
    } catch(err) {
      mostrarMensaje(cont, err.toString(), Constants.MENSAJE_ERROR);
    }
  }

  Note crearNote() => Note(userId: user!.uid, titulo: titulo, contenido: contenido);

  dynamic generarUUID() => const Uuid().v4();
  


  
}
