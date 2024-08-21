import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:s7_cinema/models/models.dart';
import 'package:s7_cinema/models/response/film/film.dart';
import 'package:s7_cinema/repository/film/film_repository.dart';

import '../helpers/debouncer.dart';

class MoviesProvider extends ChangeNotifier {
  // final String _serviceUrl = 'api.themoviedb.org';
  // final String _serviceApiKey = '9b1dcc497efc218750de36540c517e44';
  // final String _language = 'es-ES';
  int _popularPage = 1;

  final api = ApiFilm.instance.restClient;

  List<FilmResponse> onDisplayMovies = [];
  List<FilmResponse> popularMovies = [];

  Map<int, List<Cast>> moviesCasting = {};

  // STREAMS IMPLEMENTATION VARIABLES

  final debouncer = Debouncer<String>(duration: const Duration(milliseconds: 500));

  final StreamController<List<FilmResponse>> _suggestionsStreamController = StreamController.broadcast();
  Stream<List<FilmResponse>> get suggestionsStream => _suggestionsStreamController.stream;

  //*********************************

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();

    debouncer.value = '';
    debouncer.onValue = (String value) async {
      // final movies = await searchMovies(value);
      // _suggestionsStreamController.add(movies);
    };
  }

  // Future<Response> _getJsonData(String urlEndPath, [int page = 1]) async {
  //   final url = Uri.https(_serviceUrl, urlEndPath, {'api_key': _serviceApiKey, 'language': _language, 'page': '$page'});

  //   return await http.get(url);
  // }

  Future getOnDisplayMovies({bool? isLoadMore = false}) async {
    try {
      if (isLoadMore == false) {
        _popularPage = 0;
        onDisplayMovies.clear();
      } else {
        _popularPage++;
      }
      try {
        final response = await api.listFilm({
          "page": _popularPage,
          "limit": 10,
        });

        List<FilmResponse> list = response.data['items'].map<FilmResponse>((e) => FilmResponse.fromJson(e)).toList();
        onDisplayMovies.addAll(list.take(min(list.length, 5)));
        popularMovies.addAll(list);
        notifyListeners();
      } catch (error) {
        print(error);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future getPopularMovies() async {
    // final Response response = await _getJsonData('/3/movie/popular', _popularPage);

    // if (response.statusCode == 200) {
    //   final popularResponse = PopularResponse.fromRawJson(response.body);
    //   popularMovies = [...popularMovies, ...popularResponse.movies];
    //   _popularPage++;
    //   notifyListeners();
    // }
  }

  // Future<List<Cast>> getMovieCasting(int movieId) async {
  //   if (moviesCasting.containsKey(movieId)) {
  //     return moviesCasting[movieId]!;
  //   }

  //   final response = await _getJsonData('/3/movie/$movieId/credits');
  //   final creditsResponse = CreditsResponse.fromRawJson(response.body);

  //   moviesCasting[movieId] = creditsResponse.cast;

  //   return creditsResponse.cast;
  // }

  // Future<List<FilmResponse>> searchMovies(String query) async {
  //   final url = Uri.https(_serviceUrl, '/3/search/movie', {
  //       'api_key': _serviceApiKey,
  //       'language': _language,
  //       'query': query
  //     }
  //   );

  //   final response = await http.get(url);

  //   final SearchResponse searchResponse = SearchResponse.fromRawJson(response.body);
  //   return searchResponse.movies;
  // }

  void getSuggestionsByQuery(String query) async {
    debouncer.value = query;
  }
}
