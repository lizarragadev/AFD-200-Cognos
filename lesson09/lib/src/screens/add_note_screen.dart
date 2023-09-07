
import 'package:flutter/material.dart';
import 'package:lesson09/src/model/note.dart';
import 'package:lesson09/src/provider/auth_provider.dart';
import 'package:lesson09/src/utils/constants.dart';
import 'package:lesson09/src/utils/utils.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
 

  initState() {
    super.initState();
    

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
                

              },
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                validarForm();
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

  void validarForm() {
    

  }

  
}
