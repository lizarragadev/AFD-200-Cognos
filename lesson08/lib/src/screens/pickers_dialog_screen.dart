import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickersDialogScreen extends StatefulWidget {
  const PickersDialogScreen({ Key? key }) : super(key: key);

  @override
  _PickersDialogScreenState createState() => _PickersDialogScreenState();
}

class _PickersDialogScreenState extends State<PickersDialogScreen> {
  DateTime date = DateTime.now();
  DateTime? pickerDate;

  TimeOfDay time = TimeOfDay.now();
  TimeOfDay? pickerTime;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pickers & Dialogs'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Seleccione una fecha: "),
                IconButton(
                  onPressed: () {
                    abrirPickerFecha(context);
                  }, 
                  icon: const Icon(Icons.calendar_month)
                )
              ],
            ),
            Text("${date.day}/${date.month}/${date.year}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Seleccione una hora: "),
                IconButton(
                  onPressed: () {
                    abrirPickerHora(context);
                  }, 
                  icon: const Icon(Icons.watch_later)
                )
              ],
            ),
            Text("${time.hour}:${time.minute}"),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                openDialogMaterial();
              }, 
              child: const Text("Abrir dialogo Material")
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () {
                openDialogCupertino();
              }, 
              child: const Text("Abrir dialogo Cupertino")
            ),
          ],
        ),
      ),
    );
  }

  Future<void> abrirPickerFecha(context) async {
    pickerDate = await showDatePicker(
      context: context, 
      initialDate: date, 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2025)
    );
    if(pickerDate != null && pickerDate != date) {
      setState(() {
        date = pickerDate!;
      });
    }
  }

  Future<void> abrirPickerHora(context) async {
    pickerTime = await showTimePicker(
      context: context, 
      initialTime: time
    );
    if(pickerTime != null && pickerTime != time) {
      setState(() {
        time = pickerTime!;
      });
    }
  }

  void openDialogMaterial() {
    var alertDialog = AlertDialog(
      title: const Text("Confirmación"),
      content: const Text("¿Desea realizar la operación?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          child: const Text("Rechazar")
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          child: const Text("Aceptar")
        ),
      ],
    );
    showDialog(
      context: context, 
      builder: (dialogContext) {
        return alertDialog;
      });
  }

  void openDialogCupertino() {
    var alertDialog = CupertinoAlertDialog(
      title: const Text("Confirmación"),
      content: const Text("¿Desea realizar la operación?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          child: const Text("Rechazar")
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          child: const Text("Aceptar")
        ),
      ],
    );
    showDialog(
      context: context, 
      builder: (dialogContext) {
        return alertDialog;
      });
  }


}