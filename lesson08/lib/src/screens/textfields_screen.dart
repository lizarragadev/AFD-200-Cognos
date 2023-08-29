import 'package:flutter/material.dart';

class TextfieldsScreen extends StatefulWidget {
  const TextfieldsScreen({ Key? key }) : super(key: key);

  @override
  _TextfieldsScreenState createState() => _TextfieldsScreenState();
}

class _TextfieldsScreenState extends State<TextfieldsScreen> {
  
  String valorTextField = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Textfields'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Text("TextField Normal"),
              const TextField(
                autofocus: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20,),
              const Text("TextField con tipo de teclado"),
              const TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20,),
              const Text("TextField con tamaño max y capitalizacion"),
              const TextField(
                textInputAction: TextInputAction.next,
                maxLength: 10,
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 20,),
              const Text("TextField tipo Password"),
              const TextField(
                textInputAction: TextInputAction.next,
                obscureText: true,
              ),
              const SizedBox(height: 20,),
              const Text("Detectar cambios"),
              TextField(
                onChanged: (valor) {
                  setState(() {
                    valorTextField = valor;
                  });
                },
                textInputAction: TextInputAction.next,
              ), 
              const SizedBox(height: 20,),
              Text("Valor detectado: $valorTextField"),
              const SizedBox(height: 20,),
              const Text("TextField Decoración"),
              const SizedBox(height: 20,),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Ingrese su nombre",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(color: Colors.green, width: 2)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(color: Colors.grey, width: 1)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}