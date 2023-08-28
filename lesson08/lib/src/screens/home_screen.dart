import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 8'),
      ),
      body: ListView(
        children: crearItems(context),
      ),
    );
  }

  List<Widget> crearItems(context){
    return [
      crearItem('Bottom Sheet', '/bottomSheet', context),
      crearItem('Checkbox & Radio', '/checkRadio', context),
      crearItem('Expansion Panel', '/expansionPanel', context),
      crearItem('Pickers & Dialogs', '/pickers', context),
      crearItem('Slider & Switch', '/sliderSwitch', context),
      crearItem('TextFields', '/textFields', context),
    ];
  }

  Widget crearItem(String texto, String ruta, BuildContext context){
    return ListTile(
      title: Text(texto),
      subtitle: Text(ruta),
      leading: const Icon(Icons.insert_emoticon),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: (){
        Navigator.pushNamed(context, ruta);
      },
    );
  }
}