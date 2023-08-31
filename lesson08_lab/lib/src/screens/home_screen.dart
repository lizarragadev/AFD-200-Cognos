import 'package:flutter/material.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
import 'package:lesson08_lab/src/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime dateCheckIn = DateTime.now();
  DateTime dateCheckOut = DateTime.now();
  final int CHECK_IN = 1;
  final int CHECK_OUT = 2;
  int numeroDeAdultos = 0;
  int numeroDeNinios = 0;
  
  var textStyleOrange = const TextStyle(
    color: Colors.deepOrange,
    fontWeight: FontWeight.bold,
    fontSize: 17
  );

  var textStyleBlue = const TextStyle(
    color: Colors.lightBlue,
    fontSize: 17
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Android ATC Hotel'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            crearCardImagen(),
            crearCheckInCheckOut("Check-in Date: ", dateCheckIn, CHECK_IN),
            crearCheckInCheckOut("Check-out Date: ", dateCheckOut, CHECK_OUT),
            crearSliderAdultos(),
            crearSliderNinios(),
            crearTitulo("Extras:"),
            crearCheckboxesExtras(),
            crearTitulo("View:"),
            crearRadioVistas(),
            crearBoton()
          ],
        ),
      ),
    );
  }

  Widget crearCardImagen() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      elevation: 10,
      child: const Image(image: AssetImage("assets/images/banner.png")),    
    );
  }

  Widget crearCheckInCheckOut(titulo, date, tipo) {
    return Row(
      children: [
        Text(titulo, style: textStyleOrange,),
        Text("${date.year}-${date.month}-${date.day}", style: textStyleBlue,),
        IconButton(
          onPressed: () {
            selectedDate(context, tipo);
          },
          icon: const Icon(Icons.date_range, color: Colors.deepOrange,)
        )
      ],
    );
  }

  Future<void> selectedDate(context, tipo) async {
    final DateTime? pickerDate = await showDatePicker(
      context: context, 
      initialDate: (tipo == CHECK_IN) ? dateCheckIn : dateCheckOut, 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2025)
    );
    if(pickerDate != null && pickerDate != dateCheckIn && pickerDate != dateCheckOut) {
      setState(() {
        if(tipo == CHECK_IN) {
          dateCheckIn = pickerDate;
        } else {
          dateCheckOut = pickerDate;
        }
      });
    }
  }
          
  Widget crearSliderAdultos() {
    return Row(
      children: [
        Text("Adultos: $numeroDeAdultos", style: textStyleOrange,),
        Expanded(
          child: Slider(
            value: numeroDeAdultos.toDouble(), 
            min: 1,
            max: 6,
            divisions: 6,
            onChanged: (valor) {
              setState(() {
                numeroDeAdultos = valor.toInt();
              });
            }
          ),
        )
      ],
    );
  }
  
  Widget crearSliderNinios() {
    return Row(
      children: [
        Text("Niños: $numeroDeNinios", style: textStyleOrange,),
        Expanded(
          child: Slider(
            value: numeroDeNinios.toDouble(), 
            min: 0.0,
            max: 6.0,
            divisions: 6,
            onChanged: (valor) {
              setState(() {
                numeroDeNinios = valor.toInt();
              });
            }
          ),
        )
      ],
    );
  }
            
  Widget crearTitulo(titulo) {
    return Text(titulo, style: textStyleOrange,);
  }
  
  Widget crearCheckboxesExtras() {
    return CheckboxGroup(
      labels: const [
        "Desayuno (Bs. 50/dia",
        "Internet WiFi (Bs. 30/dia)",
        "Parqueo (Bs. 20/dia)",
        "Piscina (Bs. 100/dia)"
      ],
      onSelected: (List<String> list){
        print(list);
      },
    );
  }

  Widget crearRadioVistas() {
    return RadioButtonGroup(
      labels: const [
        "Vista al lago",
        "Vista a la piscina",
        "Vista a la montaña"
      ],
      onSelected: (seleccionado) {
        print(seleccionado);
      },
    );
  }
  
  Widget crearBoton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, RoutePaths.roomScreen);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent), 
      child: const Text("Ver habitaciones", 
          style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17
          ),)
    );
  }
}