import 'dart:convert';

import 'package:flutter/services.dart';

class PeopleProvider {
  List<dynamic> lista = [];

  Future<List<dynamic>> cargarDatos() async {
    final response = await rootBundle.loadString("assets/data/people.json");
    Map dataMap = json.decode(response);
    lista.addAll(dataMap['people']);
    return lista;
  }
}
