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
    
  }

  

  
}
