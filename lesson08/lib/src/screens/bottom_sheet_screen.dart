import 'package:flutter/material.dart';

class BottomSheetScreen extends StatelessWidget {
const BottomSheetScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomSheets'),
      ),
      body: ShowBottomSheet(),
    );
  }
}

class ShowBottomSheet extends StatefulWidget {
  const ShowBottomSheet({ Key? key }) : super(key: key);

  @override
  _ShowBottomSheetState createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 50,),
          ElevatedButton(
            onPressed: showModalBS, 
            child: const Text("Show Modal Bottom Sheet")
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            onPressed: showPersistentBS, 
            child: const Text("Show Persistent Bottom Sheet")
          ),
        ],
      ),
    );
  }

  void showModalBS() {
    showModalBottomSheet(
      context: context, 
      builder: (context){
        return Container(
          height: 600,
          alignment: Alignment.topCenter,
          child: Column(
            children: listaOpciones(),
          ),
        );
      }
    );
  }

  void showPersistentBS() {
    Scaffold.of(context).showBottomSheet((context){
      return Container(
        height: 400,
        alignment: Alignment.topCenter,
        child: Column(   
          children: listaOpciones(),
    ),
      );
    });
  }

  List<Widget> listaOpciones() {
    return [
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text("Inicio"),
        onTap: (){
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text("Mi perfil"),
        onTap: (){
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text("Favoritos"),
        onTap: (){
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text("Filtros"),
        onTap: (){
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text("Configuraciones"),
        onTap: (){
          Navigator.pop(context);
        },
      ),
    ];
  }
}

