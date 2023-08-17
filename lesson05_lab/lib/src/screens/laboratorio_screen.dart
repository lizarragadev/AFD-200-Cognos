import 'package:flutter/material.dart';

class LaboratorioScreen extends StatelessWidget {
  const LaboratorioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Android ATC Pizza Place'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: creaListaCards(),
    );
  }

  Widget creaListaCards() {
    return Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            creaCard("assets/images/pizza1.png", "Pizza Vegetariana"),
            creaCard("assets/images/pizza2.png", "Pizza de Queso"),
            creaCard("assets/images/pizza3.png", "Pizza Carnivora"),
            creaCard("assets/images/pizza1.png", "Pizza Vegetariana"),
            creaCard("assets/images/pizza2.png", "Pizza de Queso"),
            creaCard("assets/images/pizza3.png", "Pizza Carnivora"),
            creaCard("assets/images/pizza1.png", "Pizza Vegetariana"),
            creaCard("assets/images/pizza2.png", "Pizza de Queso"),
            creaCard("assets/images/pizza3.png", "Pizza Carnivora"),
            creaCard("assets/images/pizza1.png", "Pizza Vegetariana"),
            creaCard("assets/images/pizza2.png", "Pizza de Queso"),
            creaCard("assets/images/pizza3.png", "Pizza Carnivora"),
            creaCard("assets/images/pizza1.png", "Pizza Vegetariana"),
            creaCard("assets/images/pizza2.png", "Pizza de Queso"),
            creaCard("assets/images/pizza3.png", "Pizza Carnivora"),
            creaCard("assets/images/pizza1.png", "Pizza Vegetariana"),
            creaCard("assets/images/pizza2.png", "Pizza de Queso"),
            creaCard("assets/images/pizza3.png", "Pizza Carnivora"),
            creaCard("assets/images/pizza1.png", "Pizza Vegetariana"),
            creaCard("assets/images/pizza2.png", "Pizza de Queso"),
            creaCard("assets/images/pizza3.png", "Pizza Carnivora"),
            creaCard("assets/images/pizza1.png", "Pizza Vegetariana"),
            creaCard("assets/images/pizza2.png", "Pizza de Queso"),
            creaCard("assets/images/pizza3.png", "Pizza Carnivora"),
            creaCard("assets/images/pizza1.png", "Pizza Vegetariana"),
            creaCard("assets/images/pizza2.png", "Pizza de Queso"),
            creaCard("assets/images/pizza3.png", "Pizza Carnivora"),
          ],
        ));
  }

  Widget creaCard(String imagen, String titulo) {
    return Card(
      color: Colors.deepOrangeAccent,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image(
              image: AssetImage(imagen),
              width: 70,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: Text(
              titulo,
              style: const TextStyle(
                  fontSize: 33,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ),
      ),
    );
  }
}
