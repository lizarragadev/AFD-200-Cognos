
import 'package:flutter/material.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';

class CheckboxRadioScreen extends StatefulWidget {
  const CheckboxRadioScreen({ Key? key }) : super(key: key);

  @override
  _CheckboxRadioScreenState createState() => _CheckboxRadioScreenState();
}

class _CheckboxRadioScreenState extends State<CheckboxRadioScreen> {
  final elemCheckBox = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"];
  List<String> checkSeleccionados = [];

  final elemRadio = ["Masculino", "Femenino", "No binario"];
  String radioSeleccionado = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckBoxes & Radio Buttons'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Seleccione los días disponibles:"),
            CheckboxGroup(
              labels: elemCheckBox,
              onSelected: (List<String> seleccionados) {
                setState(() {
                  checkSeleccionados = seleccionados;
                });
              },
            ),
            Text("Seleccionados: $checkSeleccionados"),
            const SizedBox(height: 20,),
            const Text("Seleccione su género:"),
            RadioButtonGroup(
              labels: elemRadio,
              onSelected: (seleccionado) {
                setState(() {
                  radioSeleccionado = seleccionado;
                });
              },
            ),
            Text("Opción seleccionada: $radioSeleccionado")
          ],
        ),
      ),
    );
  }
}