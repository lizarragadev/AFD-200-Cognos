import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lesson_extra_webservices/src/models/actor.dart';
import 'package:lesson_extra_webservices/src/models/pelicula.dart';

class PeliculasProvider {
  final String _apiKey = "c2a665c49a75f5cf47424caf5c70c8a0";
  final String _url = "api.themoviedb.org";
  final String _language = "es-ES";
  
  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = [];
  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController.close();
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(
      _url, 
      "3/movie/now_playing", {
          "api_key": _apiKey,
          "language": _language
      }
    );
    return await procesarRespuesta(url);
  }

  Future<List<Pelicula>> procesarRespuesta(Uri url) async {
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);
    final peliculas = Peliculas.fromJsonList(decodedData['results']);
    return peliculas.items;
  }

  Future<List<Pelicula>> getPopulares() async {
    if ( _cargando ) return [];
    _cargando = true;
    _popularesPage++;
    final url = Uri.https(
      _url, 
      "3/movie/popular", {
          "api_key": _apiKey,
          "language": _language,
          "page": _popularesPage.toString()
      }
    );
    final resp = await procesarRespuesta(url);
    _populares.addAll(resp);
    popularesSink(_populares);
    _cargando = false;
    return resp;
  }


  Future<List<Actor>> getActores(String peliculaId) async {
    final url = Uri.https(
      _url,
      "3/movie/$peliculaId/credits", {
        "api_key": _apiKey,
        "language": _language,
      } 
    );
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cast = Actores.fromJsonList(decodedData['cast']);

    return cast.actores;
  }

}
