// 1. Imports 
// 2. Lista de publicaciones
// 3. Stream Controller
// 4. Stream Sink Getters.
// 5. Constructor - añadir datos, escuchar cambios.
// 6. Funciones principales
// 7. Dispose

import 'dart:async';
import 'package:lessonextra_patron_bloc/src/publicacion.dart';

class PublicacionBloc {
  List<Publicacion> _publicacionList = [
    Publicacion(1, "Luis Perez", "Mi primer post", 0),
    Publicacion(2, "Andrea Murillo", "Publicacion X", 3),
    Publicacion(3, "Pedro Martinez", "Mis fotografias del viaje", 6),
    Publicacion(4, "Luisa Arandia", "Album de la familia", 1),
    Publicacion(5, "Gustavo Torrez", "Mensaje motivacional", 7),
    Publicacion(6, "Mariela Gonzales", "Ultimo post", 23),
  ];

  final _publicacionListStreamController = StreamController<List<Publicacion>>();
  final _publicacionIncrementarStreamController = StreamController<Publicacion>();
  final _publicacionDecrementarStreamController = StreamController<Publicacion>();

  Stream <List<Publicacion>> get publicacionListStream => _publicacionListStreamController.stream;
  StreamSink <List<Publicacion>> get publicacionListSink => _publicacionListStreamController.sink;

  StreamSink <Publicacion> get publicacionReaccionesIncrement => _publicacionIncrementarStreamController.sink;
  StreamSink <Publicacion> get publicacionReaccionesDecrement => _publicacionDecrementarStreamController.sink; 

  PublicacionBloc() {
    _publicacionListStreamController.add(_publicacionList);
    _publicacionIncrementarStreamController.stream.listen(_incrementReacciones);
    _publicacionDecrementarStreamController.stream.listen(_decrementReacciones);
  }

  _incrementReacciones(Publicacion publicacion) {
    int cantidadReaccionesActual = publicacion.reacciones;
    int cantidadReaccionesIncrement = cantidadReaccionesActual + 1;

    _publicacionList[publicacion.id - 1].reacciones = cantidadReaccionesIncrement;
    publicacionListSink.add(_publicacionList);
  }

  _decrementReacciones(Publicacion publicacion) {
    int cantidadReaccionesActual = publicacion.reacciones;
    int cantidadReaccionesIncrement = cantidadReaccionesActual - 1;

    _publicacionList[publicacion.id - 1].reacciones = cantidadReaccionesIncrement;
    publicacionListSink.add(_publicacionList);
  }

  void dispose() {
    _publicacionDecrementarStreamController.close();
    _publicacionIncrementarStreamController.close();
    _publicacionListStreamController.close();
  }

}