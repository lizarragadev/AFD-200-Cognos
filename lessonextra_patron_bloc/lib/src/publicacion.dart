import 'dart:collection';

class Publicacion {
  int _id;
  String _nombre;
  String _contenido;
  int _reacciones;

  Publicacion(this._id, this._nombre, this._contenido, this._reacciones);

  set id(int id) {
    this._id = id;
  }
  set nombre(String nom) {
    this.nombre = nom;
  }
  set contenido(String cont) {
    this._contenido = cont;
  }
  set reacciones(int reac) {
    this._reacciones = reac;
  }
  int get id => this._id;
  String get nombre => this._nombre;
  String get contenido => this._contenido;
  int get reacciones => this._reacciones;

}