import 'package:flutter/material.dart';

class ExpansionPanelScreen extends StatefulWidget {
  const ExpansionPanelScreen({ Key? key }) : super(key: key);

  @override
  _ExpansionPanelScreenState createState() => _ExpansionPanelScreenState();
}

class Item {
  String title;
  String description;
  bool isExpanded;
  Item(
      {required this.title,
      required this.description,
      this.isExpanded = false});
}

class _ExpansionPanelScreenState extends State<ExpansionPanelScreen> {
  final List<Item> data = List<Item>.generate(15, (index) {
    return Item(
        title: "Elemento número ${index + 1}",
        description:
            "Esta es una descripcion que ira en la parte expandida de nuestro Item en una lista");
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansion Panel & Snackbar"),
      ),
      body: creaListaExpandible(),
    );
  }

  Widget creaListaExpandible() {
    return ListView(
      children: [
        ExpansionPanelList(
            children: data.map((item) {
              return ExpansionPanel(
                isExpanded: item.isExpanded,
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(item.title),
                    onTap: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(mySnackbar("Registro exitoso"));
                    },
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: Text(item.description),
                    subtitle: const Text("Esta es la descripcion subtitulo"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          data.remove(item);
                        });
                      },
                    ),
                  ),
                ),
              );
            }).toList(),
            expansionCallback: (index, bool isExpanded) {
              setState(() {
                data[index].isExpanded = !data[index].isExpanded;
              });
            })
      ],
    );
  }

  // ScaffoldMessenger.of(context).showSnackBar(mySnackbar("Red celular inestable"));
  var mySnackbar = (mensaje) {
    return SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(mensaje)
        ],
      ),
      backgroundColor: Colors.green,
      action: SnackBarAction(
        label: "Deshacer",
        onPressed: () {},
        textColor: Colors.black,
      ),
      duration: const Duration(seconds: 3),
    );
  };
}
