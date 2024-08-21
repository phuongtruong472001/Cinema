import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:s7_cinema/models/response/film/film.dart';

class CardsSwiper extends StatelessWidget {
  final List<FilmResponse> movies;

  const CardsSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.54,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.58,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.78,
        itemHeight: size.height * 0.54,
        itemBuilder: (_, index) {
          final movie = movies[index];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(_, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(placeholder: const AssetImage('assets/no_image.jpg'), image: NetworkImage(movie.thumbnail ?? ''), fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
