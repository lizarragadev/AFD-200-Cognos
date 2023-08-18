import 'package:flutter/material.dart';

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({Key? key}) : super(key: key);

  @override
  _ButtonsScreenState createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  List<String> items = ["Argentina", "Bolivia", "Brasil", "Chile"];
  String valorSeleccionado = "Argentina";
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: body(),
    );
  }

  PreferredSizeWidget myAppBar() {
    return AppBar(
      title: const Text("Botones"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        PopupMenuButton(
            itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text("Opción 1"),
                    value: 1,
                  ),
                  const PopupMenuItem(
                    child: Text("Opción 2"),
                    value: 1,
                  ),
                  const PopupMenuItem(
                    child: Text("Opción 3"),
                    value: 1,
                  ),
                ])
      ],
    );
  }

  Widget body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {}, child: const Text("Elevated Button")),
          const ElevatedButton(
              onPressed: null, child: Text("Elevated Button Disabled")),
          const SizedBox(
            height: 20,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.people),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Boton de solo texto"),
          ),
          OutlinedButton(
              onPressed: () {}, child: const Text("Outlined Button")),
          const SizedBox(
            height: 20,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Elemento 1",
                  style: TextStyle(color: Colors.deepOrange),
                ),
                style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side:
                        const BorderSide(width: 2.0, color: Colors.deepOrange)),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Elemento 2",
                  style: TextStyle(color: Colors.deepOrange),
                ),
                style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side:
                        const BorderSide(width: 2.0, color: Colors.deepOrange)),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButton(
              value: valorSeleccionado,
              items: items.map((value) {
                return DropdownMenuItem(
                    value: value,
                    child: Row(
                      children: [
                        const Icon(Icons.flag),
                        const SizedBox(width: 10),
                        Text(value)
                      ],
                    ));
              }).toList(),
              onChanged: (valor) {
                setState(() {
                  valorSeleccionado = valor.toString();
                });
              }),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ToggleButtons(
                  children: [
                    Icon(Icons.star),
                    Icon(Icons.person),
                    Icon(Icons.delete),
                    Icon(Icons.star),
                    Icon(Icons.person),
                    Icon(Icons.delete),
                    Icon(Icons.star),
                    Icon(Icons.person),
                    Icon(Icons.delete),
                  ],
                  isSelected: isSelected,
                  onPressed: (index) {
                    setState(() {
                      isSelected[index] = !isSelected[index];
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
