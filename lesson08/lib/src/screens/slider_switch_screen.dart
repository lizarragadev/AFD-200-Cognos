import 'package:flutter/material.dart';

class SliderSwitchScreen extends StatefulWidget {
  const SliderSwitchScreen({ Key? key }) : super(key: key);

  @override
  _SliderSwitchScreenState createState() => _SliderSwitchScreenState();
}

class _SliderSwitchScreenState extends State<SliderSwitchScreen> {
  double valorSlider = 50.0;
  bool switchStatus = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider & Switch'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cambia el tamaño de la imagen."),
          crearSlider(),
          crearSwitch(),
          crearImagen()
        ],
      ),
    );
  }

  Widget crearSlider() {
    return Slider(
      value: valorSlider, 
      label: "Tamaño imagen",
      min: 1.0,
      max: 100.0,
      divisions: 10,
      onChanged: (switchStatus) 
        ? null 
        : (value) {
          setState(() {
            valorSlider = value;
          });
      }
    );
  }

  Widget crearImagen() {
    return Image(
      image: const AssetImage("assets/images/perrito.png"),
      fit: BoxFit.contain,
      width: valorSlider * 3,
    );
  }

  Widget crearSwitch() {
    return SwitchListTile(
      value: switchStatus, 
      title: const Text("Bloquear Slider"),
      onChanged: (valor) {
        setState(() {
          switchStatus = valor;
        });
      }
    );
  }
}