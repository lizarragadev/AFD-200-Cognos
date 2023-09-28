import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lesson_extra_webservices/src/models/pelicula.dart';
import 'package:lesson_extra_webservices/src/routes/routes.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  const CardSwiper({super.key, required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
        padding: const EdgeInsets.only(top: 20),
        child: Swiper(
          itemHeight: screenSize.height * 0.5,
          itemWidth: screenSize.width * 0.7,
          itemCount: peliculas.length,
          layout: SwiperLayout.STACK,
          onTap: (index) {
            peliculas[index].uniqueId = "${peliculas[index].id}-poster";
            Navigator.pushNamed(context, 
              RoutePaths.detailPage, arguments: peliculas[index]);
          },
          itemBuilder: (context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage("assets/images/no-image.jpeg"),
                image: NetworkImage(peliculas[index].getPosterImg()),
                fit: BoxFit.cover,
              ),
            );
          },
        )
    );
  }
}
