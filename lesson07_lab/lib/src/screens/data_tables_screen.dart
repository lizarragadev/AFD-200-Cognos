import 'package:flutter/material.dart';

class DataTablesScreen extends StatelessWidget {
  DataTablesScreen({Key? key}) : super(key: key);

  int numColumnas = 10;
  int numFilas = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Tables'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.yellowAccent),
            dataRowColor:
                MaterialStateColor.resolveWith((states) => Colors.greenAccent),
            columns: addHeaders(),
            rows: addRows(),
          ),
        ),
      ),
    );
  }

  List<DataColumn> addHeaders() {
    List<DataColumn> list = [];
    for (int i = 1; i <= numColumnas; i++) {
      list.add(DataColumn(label: Text("Columna $i")));
    }
    return list;
  }

  List<DataRow> addRows() {
    List<DataRow> list = [];
    for (int i = 1; i <= numFilas; i++) {
      List<DataCell> listaCelda = [];
      for (int j = 1; j <= numColumnas; j++) {
        listaCelda.add(DataCell(Text("Celda ($i, $j)")));
      }
      list.add(DataRow(cells: listaCelda));
    }
    return list;
  }
}
