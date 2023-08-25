import 'package:flutter/material.dart';
import 'package:lesson07_lab/src/providers/people_provider.dart';

class ListviewListtilesScreen extends StatelessWidget {
  const ListviewListtilesScreen({Key? key}) : super(key: key);

  // Main Thread o UI Thread
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView y ListTiles'),
      ),
      body: cargarElementos(),
    );
  }

  Widget cargarElementos() {
    final peopleProvider = PeopleProvider();
    ScrollController scrollController =
        ScrollController(initialScrollOffset: 0);

    return FutureBuilder(
        future: peopleProvider.cargarDatos(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: ListView(
              controller: scrollController,
              reverse: false,
              children: listaItems(snapshot.data ?? []),
            ),
          );
        });
  }

  List<Widget> listaItems(List<dynamic> data) {
    List<Widget> personas = [];
    for (var persona in data) {
      personas.add(crearItem(
        persona['name'],
        persona['country'],
        persona['region'],
        persona['image'],
      ));
    }
    return personas;
  }

  Widget crearItem(name, country, region, image) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text("$country, $region"),
        leading: CircleAvatar(
          backgroundImage: Image(
            image: AssetImage(image),
          ).image,
        ),
        trailing: const Icon(Icons.arrow_right_rounded),
        onTap: () {
          print("Hizo click en $name");
        },
      ),
    );
  }
}
