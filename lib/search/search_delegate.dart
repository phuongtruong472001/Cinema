import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s7_cinema/models/response/film/film.dart';
import 'package:s7_cinema/providers/movies_provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  final BuildContext context;
  MoviesProvider moviesProvider;

  MovieSearchDelegate(this.context) : moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

  @override
  String get searchFieldLabel => 'Buscar película..';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Build Results');
  }

  Widget _emptySearchWidget() {
    return const Center(child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 130));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptySearchWidget();
    }

    moviesProvider.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: moviesProvider.suggestionsStream,
      builder: (BuildContext context, AsyncSnapshot<List<FilmResponse>> snapshot) {
        if (snapshot.hasData) {
          final List<FilmResponse> movies = snapshot.data!;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, index) => _SearchMovieItem(movies[index]),
          );
        }

        return _emptySearchWidget();
      },
    );
  }
}

class _SearchMovieItem extends StatelessWidget {
  final FilmResponse movie;

  const _SearchMovieItem(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FadeInImage(
            alignment: Alignment.center,
            placeholder: const AssetImage('assets/no_image.jpg'),
            image: NetworkImage(movie.thumbnail ?? ''),
            height: 80,
            fit: BoxFit.contain),
      ),
      title: Text(movie.name ?? ''),
      subtitle: Text(movie.description ?? ''),
      onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
    );
  }
}
