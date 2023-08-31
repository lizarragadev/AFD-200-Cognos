import 'package:flutter/material.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({ Key? key }) : super(key: key);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class ItemHabitacion {
  bool isExpanded;
  final Widget header;
  final String title;
  final String body;

  ItemHabitacion(
    this.isExpanded,
    this.header,
    this.title,
    this.body,
  );
}

class _RoomScreenState extends State<RoomScreen> {
  List<ItemHabitacion> listaHabitaciones = [
    ItemHabitacion(
        false,
        const Image(
          height: 60,
          image: AssetImage('assets/images/habitacion1.jpeg'),
        ),
        "Habitación grande",
        "Habitación con una cama tamaño King"),
    ItemHabitacion(
        false,
        const Image(
          height: 60,
          image: AssetImage('assets/images/habitacion2.webp'),
        ),
        "Habitación doble",
        "Habitación con dos camas, diseñada para dos personas."),
    ItemHabitacion(
        false,
        const Image(
          height: 60,
          image: AssetImage('assets/images/habitacion3.jpg'),
        ),
        "Habitación Familiar",
        "Habitación extra grande diseñada para 3 o 4 personas."),
  ];

  ListView? listViewHabitaciones;

  @override
  Widget build(BuildContext context) {
    listViewHabitaciones = ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionPanelList(
            children: listaHabitaciones.map((ItemHabitacion item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ListTile(
                        leading: item.header,
                        title: Text(
                          item.title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                          ),
                        )),
                  );
                },
                isExpanded: item.isExpanded,
                body: Container(
                  padding: const EdgeInsets.only(
                      bottom: 15.0, left: 15.0, right: 15.0),
                  alignment: Alignment.center,
                  child: Text(
                    item.body,
                  ),
                ),
              );
            }).toList(),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                listaHabitaciones[index].isExpanded =
                    !listaHabitaciones[index].isExpanded;
              });
            },
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          "Lista de habitaciones",
        ),
      ),
      body: listViewHabitaciones,
      persistentFooterButtons: [
        ButtonBar(children: [
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
            onPressed: () {
              nosVemos(context);
            },
            child: const Text('Finalizar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                )),
          ),
        ]),
      ],
    );
  }

  void nosVemos(BuildContext context) {
    var alertDialog = AlertDialog(
      title: const Text(
        "Nos vemos pronto",
        style: TextStyle(color: Colors.orangeAccent),
      ),
      content: const Text(
          "Gracias por su visita. recuerda visitar nuestras redes sociales /HotelesVIP"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.orangeAccent),
          ),
        )
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }
}