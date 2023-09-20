import 'package:flutter/material.dart';
import 'package:lesson_extra_webservices/src/models/pelicula.dart';
import 'package:lesson_extra_webservices/src/routes/routes.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  const MovieHorizontal(
      {super.key, required this.peliculas, required this.siguientePagina});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final pageController =
        PageController(initialPage: 1, viewportFraction: 0.3);

    pageController.addListener(() {
      if (pageController.position.pixels >=
          pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return SizedBox(
      height: screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: pageController,
        itemCount: peliculas.length,
        itemBuilder: (context, i) {
          return _tarjeta(peliculas[i], context);
        },
      ),
    );
  }

  Widget _tarjeta(Pelicula pelicula, BuildContext context) {
    

    return GestureDetector(
      child: Text(""),
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.detailPage,
            arguments: pelicula);
      },
    );
  }
}
