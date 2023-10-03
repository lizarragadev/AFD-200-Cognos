import 'package:flutter/material.dart';
import 'package:lessonextra_patron_bloc/src/publicacion.dart';
import 'package:lessonextra_patron_bloc/src/publicacion_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PublicacionBloc _publicacionBloc = PublicacionBloc();   

  @override
  void dispose() {
    //super.dispose();
    _publicacionBloc.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: StreamBuilder<List<Publicacion>>(
              stream: _publicacionBloc.publicacionListStream, 
              builder: (context, AsyncSnapshot<List<Publicacion>> snapshot) {
                return ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                                Text("${snapshot.data![index].id}", style: const TextStyle(fontSize: 30),),
                                Column(
                                  children: [
                                    Text("${snapshot.data![index].nombre}", style: const TextStyle(fontSize: 20),),
                                    Text("${snapshot.data![index].contenido}", style: const TextStyle(fontSize: 15),),
                                  ],
                                ),
                                Text("${snapshot.data![index].reacciones}", style: const TextStyle(fontSize: 30),),
                                Container(
                                  child: IconButton(
                                    icon: const Icon(Icons.thumb_up),
                                    color: Colors.green,
                                    onPressed: () {
                                      _publicacionBloc.publicacionReaccionesIncrement.add(
                                        snapshot.data![index]
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  child: IconButton(
                                    icon: const Icon(Icons.thumb_down),
                                    color: Colors.red,
                                    onPressed: () {
                                      _publicacionBloc.publicacionReaccionesDecrement.add(
                                        snapshot.data![index]
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                      )
                    );
                  },
                  
                );
              }
            ),
        ),
      ),
    );
  }
}