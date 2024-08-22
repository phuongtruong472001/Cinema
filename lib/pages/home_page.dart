import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:s7_cinema/search/search_delegate.dart';

import '../providers/providers.dart' show MoviesProvider;
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cinema'), elevation: 0, actions: [
        IconButton(onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate(context)), icon: const Icon(Icons.search_outlined)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(onPressed: () => Navigator.pushNamed(context, 'history'), icon: const Icon(Icons.history)),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Swiper of movie cards
            CardsSwiper(movies: moviesProvider.onDisplayMovies),

            const SizedBox(height: 8),
            //Slider of movie items
            MovieSlider(movies: moviesProvider.popularMovies, title: 'Populares', onNextPage: () => moviesProvider.getPopularMovies())
          ],
        ),
      ),
    );
  }
}
