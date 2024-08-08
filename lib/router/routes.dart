import 'package:flutter/material.dart';
import 'package:s7_cinema/pages/login.dart';
import 'package:s7_cinema/pages/movie_book.dart';

import '../pages/pages.dart';

class Routes {
  static const String initialRoute = 'login';

  static Map<String, WidgetBuilder> routes = {
    'login': (_) => const LoginPage(),
    'home': (_) => const HomePage(),
    'details': (_) => const DetailsPage(),
    'book': (_) => const MovieBook(),
  };
}
