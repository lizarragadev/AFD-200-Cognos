import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:lesson_extra_webservices/src/models/pelicula.dart';
import 'package:lesson_extra_webservices/src/providers/peliculas_provider.dart';
import 'package:lesson_extra_webservices/src/widgets/card_swipper.dart';
import 'package:lesson_extra_webservices/src/widgets/movie_horizontal.dart';

class HomeScreen extends StatelessWidget {
  final peliculasProvider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("FlutterPelis"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 50),
          _swiperCards(),
          const SizedBox(height: 50),
          _footer()
        ],
      ),
    );
  }

  Widget _swiperCards() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if( snapshot.hasData ) {
          return CardSwiper(
            peliculas: snapshot.data!,
          );
        } else {
          return const SizedBox(
            height: 500,
            child: Center(child: CircularProgressIndicator(),),
          );
        }
      },
    );
  }

  Widget _footer() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: const Text("Populares", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
          ),
          const SizedBox(height: 10.0,),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (context, AsyncSnapshot<List<Pelicula>> snapshot) {
              if( snapshot.hasData ) {
                return MovieHorizontal(
                  peliculas: snapshot.data!, 
                  siguientePagina: peliculasProvider.getPopulares
                );
              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ],
      ),
    );
  }

  Future<bool> internet() async {
    var connectivity = await Connectivity().checkConnectivity();
    if(connectivity == ConnectivityResult.mobile) {

    }
    bool isOnline = connectivity != ConnectivityResult.none;

    if(isOnline) {
      // Si hay acceso a Internet
      return true;
    } else {
      // No hay acceso a Internet
      return false;
    }
  }

}
